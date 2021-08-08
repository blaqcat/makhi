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
  int currentIndex = 0;
  final screens = [
    Center(child: Text('Home', style: TextStyle(fontSize: 60)),),
    Center(child: Text('Search', style: TextStyle(fontSize: 60)),),
    Center(child: Text('Business Tools', style: TextStyle(fontSize: 60)),),
    Center(child: Text('Profile', style: TextStyle(fontSize: 60)),),


  ];

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
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        showUnselectedLabels: true,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.amberAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            label: 'Tools'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.green,
          )

        ],
      ),
    );
  }
}

