import 'package:makhi/screens/homeScreens/Authentication/login.dart';
import 'package:makhi/screens/homeScreens/Authentication/register.dart';
import 'package:flutter/material.dart';

class Authentication extends StatefulWidget {

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool isToggle = false;
  void toggleScreen () {
    setState(() {
      isToggle = !isToggle;
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    if(isToggle) {
     return RegisterScreen(toggleScreen: toggleScreen);
    }else{
      return Login(toggleScreen: toggleScreen);
    }

  }
}

