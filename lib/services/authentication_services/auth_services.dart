import 'dart:io';
// ignore: unused_import
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:makhi/screens/homeScreens/home_screen.dart';
import 'package:makhi/screens/homeScreens/NavigationBar/profile/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart' as firebase_storage;

class AuthServices extends ChangeNotifier {

  bool _isLoading = false;
  String _errorMessage;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  FirebaseAuth firebaseAuth  = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn();
//  UserModel currentUser;


  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

  }
  Future<String> getCurrentUID() async {
    return await firebaseAuth.currentUser.uid;

  }
  // GET CURRENT USER
  Future getCurrentUser()  async {
    return await firebaseAuth.currentUser;
  }
  // Get Profile Image
  getProfileImage () {
    if (firebaseAuth.currentUser.photoURL != null) {
      return Image.network(firebaseAuth.currentUser.photoURL, height: 100, width: 100);
    }
    else {
      return Icon(Icons.account_circle, size: 100);
    }
  }

  Future updateUserName(String name, User currentUser) async {
    await currentUser.updateProfile(displayName: name);
    await currentUser.reload();
  }
  // Reset PAssword
  Future sendPasswordResetEmail(String email) async {
    return firebaseAuth.signInAnonymously();
  }





  Future register(String email, String password) async {

    try{
      setLoading(true);
      UserCredential authResult= await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      User  user = authResult.user;
      setLoading(false);
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
      User user = authResult.user;
      setLoading(false);
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

  Stream<User> get user => firebaseAuth.authStateChanges() ;


}

class StorageRepo {
 // FirebaseStorage _storage = foreFirebaseStorage(_storage =);

  //FirebaseStorage _storage = FirebaseStorage.instanceFor(storageBucket: "");

}