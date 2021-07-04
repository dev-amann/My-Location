import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_location/Screens/signup_screen.dart';
import 'package:my_location/Utils/constants.dart';
import 'package:my_location/utils/colors.dart';
import 'package:my_location/utils/dimensions.dart';
import 'package:my_location/utils/strings.dart';

import '../Widgets/back_widget.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailPhoneController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _loginFormKey = GlobalKey<FormState>();

  String userEmail;
  String userPassword;

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
              BackWidget(name: 'Sign In Account', isBack: false),
              bodyWidget(context),
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
                key: _loginFormKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 150,
                        child: Center(
                          child: Text(
                            'Welcome Back',
                            style: TextStyle(
                                fontSize: 26,
                                fontFamily: 'ProductSans',
                                fontWeight: FontWeight.bold,
                                color: Colors.blue.shade500),
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
                              controller: emailPhoneController,
                              decoration: new InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.person,
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
                              obscureText: true,
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
                      SizedBox(
                        height: 25.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: TextButton(
                          onPressed: () {
                            if (_loginFormKey.currentState.validate()) {
                              if (emailPhoneController.text == email &&
                                  passwordController.text == password) {
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            HomeScreen()));
                              }
                            }
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blue.shade500)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SignupScreen()));
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text("Don't have an account ?",
                                style: TextStyle(
                                    color: Colors.blue.shade500,
                                    fontFamily: 'ProductSans',
                                    fontSize: 16)),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
