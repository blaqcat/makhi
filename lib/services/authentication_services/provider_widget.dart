import 'package:flutter/cupertino.dart';
import 'package:makhi/services/authentication_services/auth_services.dart';
import 'package:flutter/material.dart';


class Provider extends InheritedWidget {
  final AuthServices auth;
  final db;
  final colors;

  Provider({Key key, Widget child, this.auth, this.db, this.colors}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static Provider of(BuildContext context) => (context.dependOnInheritedWidgetOfExactType<Provider>());
}