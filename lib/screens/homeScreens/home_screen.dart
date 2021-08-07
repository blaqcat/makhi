import 'package:makhi/screens/homeScreens/Authentication/authentication.dart';
import 'package:makhi/services/authentication_services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {


  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthServices>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Makhi Home Page"),
        centerTitle: true,
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app),
          onPressed: () async => await loginProvider.logout(),
          )
        ],
      ),
    );
  }
}



