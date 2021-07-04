import 'package:flutter/material.dart';
import 'package:my_location/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Utils/constants.dart';

class UserHelper {
  SharedPreferences sharedPreferences;

  Future<void> saveUser(User user) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences?.setString("name", user.name);
    sharedPreferences?.setString("email", user.email);
    sharedPreferences?.setString("phone", user.phone);
    sharedPreferences?.setString("password", user.password);
    sharedPreferences?.setString("imagePath", user.image);
  }

  Future<void> getSavedUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    isLoggedIn = sharedPreferences?.getBool('isLogIn') ?? false;
    name = sharedPreferences?.getString('name') ?? '';
    email = sharedPreferences?.getString('email') ?? '';
    password = sharedPreferences?.getString('password') ?? '';
    imagePath = sharedPreferences?.getString('imagePath') ?? '';
    phone = sharedPreferences?.getString('phone') ?? '';
  }
}

Widget errorAvatarImage(BuildContext context, double height, double width) {
  return Image.network(
    "https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_1280.png",
    height: height,
    width: width,
  );
}
