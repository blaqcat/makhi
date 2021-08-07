import 'package:makhi/screens/splashScreen/onboarding.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';



void main() =>  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/second': (context) =>  MyApp(),
        },
        home: MyApp()));






