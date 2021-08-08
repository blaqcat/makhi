import 'package:makhi/screens/homeScreens/Authentication/authentication.dart';
import 'package:makhi/screens/splashScreen/onboarding.dart';
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
        title: Text('The Makhi Network'),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: ()  async => await loginProvider.logout()
          )
        ],
        centerTitle: true,
      ),
      body: Center(child: Text('Home', style: TextStyle(fontSize: 60)),),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Home',
          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.business_center_rounded),
          label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings"
          )

        ],
      ),
    );
  }
}

