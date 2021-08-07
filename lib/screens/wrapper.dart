import 'package:makhi/screens/homeScreens/Authentication/authentication.dart';
import 'package:makhi/screens/homeScreens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    if(user != null) {
      return HomeScreen();

    } else{
      return Authentication();
    }
  }
}
