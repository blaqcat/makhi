import 'package:makhi/screens/splashScreen/onboarding.dart';
import 'package:makhi/services/authentication_services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makhi/screens/wrapper.dart';


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Init = Firebase.initializeApp();
    return FutureBuilder(
        future: Init,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Errorwidget();
          } else if (snapshot.hasData) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider<AuthServices>.value(value: AuthServices()),
                StreamProvider<User>.value(
                    value: AuthServices().user,
                    initialData: null)
              
              ],
              child: MaterialApp(
                theme: ThemeData(
                  primarySwatch: Colors.red,
                ),
                debugShowCheckedModeBanner: false,
                home: Onbording(),
              ),
            );
          } else {
            return Loading();
          }


        });
  }
}

class Errorwidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [Icon(Icons.error), Text("Something went wrong")],
        ),
      ),
    );
  }
}

class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),

    );
  }
}