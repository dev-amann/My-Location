import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_location/Screens/home_screen.dart';
import 'package:my_location/user_helper.dart';
import 'package:my_location/user_model.dart';
import 'package:my_location/utils/colors.dart';
import 'package:my_location/utils/dimensions.dart';
import 'package:my_location/utils/strings.dart';

import '../Widgets/back_widget.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _signUpFormKey = GlobalKey<FormState>();

  String userName;
  String userEmail;
  String userPhone;
  String userPassword;
  String imageFilePath = '';

  PickedFile pickedFile;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColor.blueColor,
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              BackWidget(name: Strings.signUpScreenHeader, isBack: false),
              bodyWidget(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget bodyWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius * 2),
              topRight: Radius.circular(Dimensions.radius * 2),
            )),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          18.0,
                        ),
                        topRight: Radius.circular(
                          18.0,
                        ),
                        bottomLeft: Radius.circular(
                          18.0,
                        ),
                        bottomRight: Radius.circular(
                          18.0,
                        ))),
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: _signUpFormKey,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 150,
                          child: Center(
                            child: Text(
                              'Welcome',
                              style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue.shade500),
                            ),
                          ),
                        ),
                        Container(
                          height: 150.0,
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(top: 20.0),
                                child: Stack(fit: StackFit.loose, children: <
                                    Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      ClipOval(
                                        child: (imageFilePath == '')
                                            ? Image.network(
                                                "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png",
                                                width: 100,
                                                height: 100,
                                                errorBuilder:
                                                    (BuildContext context,
                                                        Object exception,
                                                        StackTrace stackTrace) {
                                                  return errorAvatarImage(
                                                      context, 120, 120);
                                                },
                                                fit: BoxFit.cover,
                                              )
                                            : Image.file(File(imageFilePath),
                                                width: 100,
                                                height: 100, errorBuilder:
                                                    (BuildContext context,
                                                        Object exception,
                                                        StackTrace stackTrace) {
                                                return errorAvatarImage(
                                                    context, 120, 120);
                                              }, fit: BoxFit.cover),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () async {
                                      pickedFile = await ImagePicker().getImage(
                                          source: ImageSource.gallery);
                                      setState(() {
                                        imageFilePath = pickedFile.path;
                                      });
                                    },
                                    child: Padding(
                                        padding: EdgeInsets.only(
                                            top: 65.0, right: 60.0),
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            new CircleAvatar(
                                              backgroundColor: Colors.blue,
                                              radius: 15.0,
                                              child: new Icon(
                                                Icons.camera_alt,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        )),
                                  ),
                                ]),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 8),
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: CustomColor.primaryColor,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ], color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return Strings.pleaseFillOutTheField;
                                  } else {
                                    userName = value;
                                  }
                                  return null;
                                },
                                onSaved: (val) => userName = val,
                                controller: nameController,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.person_rounded,
                                    color: Colors.blue[500],
                                  ),
                                  hintText: 'Name',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 8),
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: CustomColor.primaryColor,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ], color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return Strings.pleaseFillOutTheField;
                                  } else {
                                    userEmail = value;
                                  }
                                  return null;
                                },
                                onSaved: (val) => userEmail = val,
                                controller: emailController,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.email,
                                    color: Colors.blue[500],
                                  ),
                                  hintText: 'Email',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 8),
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: CustomColor.primaryColor,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ], color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return Strings.pleaseFillOutTheField;
                                  } else {
                                    userPhone = value;
                                  }
                                  return null;
                                },
                                onSaved: (val) => userPhone = val,
                                controller: phoneController,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.phone,
                                    color: Colors.blue[500],
                                  ),
                                  hintText: 'Phone',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, top: 16, bottom: 8),
                          child: Container(
                            height: 50.0,
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                color: CustomColor.primaryColor,
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ], color: Colors.white),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value == '') {
                                    return Strings.pleaseFillOutTheField;
                                  } else {
                                    userPassword = value;
                                  }
                                  return null;
                                },
                                onSaved: (val) => userPassword = val,
                                controller: passwordController,
                                decoration: new InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.lock,
                                    color: Colors.blue[500],
                                  ),
                                  hintText: 'Password',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextButton(
                            onPressed: () {
                              if (_signUpFormKey.currentState.validate() &&
                                  imageFilePath != '') {
                                User user = User(
                                    name: userName,
                                    email: userEmail,
                                    image: imageFilePath,
                                    password: userPassword,
                                    phone: userPhone);
                                UserHelper().saveUser(user).whenComplete(() {
                                  UserHelper().getSavedUser().whenComplete(() {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                HomeScreen()));
                                  });
                                });
                              }
                            },
                            child: Text(
                              'SignUp',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 22),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blue.shade500)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        LoginScreen()));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text("Already have an account?",
                                  style: TextStyle(
                                      color: Colors.blue.shade500,
                                      fontSize: 16)),
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
