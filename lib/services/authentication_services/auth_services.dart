import 'dart:io';
// ignore: unused_import
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makhi/screens/homeScreens/home_screen.dart';


class AuthServices extends ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future register(String email, String password) async {

    try{
      setLoading(true);
      UserCredential authResult= await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      setLoading(false);
      User  user = authResult.user;
      return user;
    } on SocketException {
      setLoading(false);
      setMessage("No internet, please connect to the internet");
    } catch(e) {
      setLoading(false);
      print(e);
      setMessage(e.message);
    }
    notifyListeners();

  }

  Future login(String email, String password) async {
    try{
      setLoading(true);
      UserCredential authResult= await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      setLoading(false);
      User user = authResult.user;
      return user;
    } on SocketException {
      setLoading(false);
      setMessage("No internet, please connect to the internet");
    }
    catch(e) {
      setLoading(false);
      print(e);
      setMessage(e.message);
    }
    notifyListeners();

  }



  Future logout() async {
    await firebaseAuth.signOut();
  }




  void setLoading(val) {
    _isLoading = val;
    notifyListeners();
  }

  void setMessage(message) {
    _errorMessage = message;
    notifyListeners();
  }

  Stream<User> get user => firebaseAuth.authStateChanges();

}

