import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:makhi/services/authentication_services/auth_services.dart';
import 'package:provider/provider.dart';
import 'package:makhi/services/authentication_services/locator.dart';


class StorageRepo {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instanceFor(bucket: "gs://maki-network.appspot.com");

  AuthServices _authServices = locator.get<AuthServices>();


  upLoadFile(File file) async {
    var user = await _authServices.getCurrentUser();
    var storageRef = storage.ref().child("user/profile/${user.uid})");
    var uploadTask = storageRef.putFile(file);
    //var completedTask = await uploadTask.onComplete;
  }
}

