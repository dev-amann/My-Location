import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_location/Screens/second_screen.dart';
import 'package:my_location/Utils/colors.dart';
import 'package:my_location/Utils/constants.dart';
import 'package:my_location/Utils/custom_style.dart';
import 'package:my_location/Utils/dimensions.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../user_helper.dart';
import 'login_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  GoogleMapController _controller;
  Location _location = Location();
  SharedPreferences sharedPreferences;

  @override
  void initState() {
    print(
        'Name $name,Email $email,Password $password,Image $imagePath,Phone $phone');
    asyncShared();
    super.initState();
  }

  Future<void> asyncShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences?.setBool("isLogIn", true);
  }

  void _onMapCreated(GoogleMapController _cntlr) {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude, l.longitude), zoom: 15),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomColor.blueColor,
        toolbarHeight: MediaQuery.of(context).size.height * 0.2,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Image.file(File(imagePath), width: 60, height: 60,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace stackTrace) {
                return errorAvatarImage(context, 30, 30);
              }, fit: BoxFit.cover),
            ),
            SizedBox(width: Dimensions.marginSize),
            Text(name, style: CustomStyle.textStyle)
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                  (Route<dynamic> route) => false);
            },
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              IconButton(
                  icon: Icon(Icons.logout, color: Colors.white),
                  onPressed: null),
              Text('Logout')
            ]),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: _initialcameraposition),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => SecondScreen()));
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(16.0),
                    primary: Colors.white,
                    backgroundColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                  child: Text('Go to Second Screen'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
