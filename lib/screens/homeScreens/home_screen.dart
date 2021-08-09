import 'package:makhi/screens/homeScreens/Authentication/authentication.dart';
import 'package:makhi/screens/homeScreens/NavigationBar/home_page.dart';
import 'package:makhi/screens/homeScreens/NavigationBar/profile.dart';
import 'package:makhi/screens/homeScreens/NavigationBar/search.dart';
import 'package:makhi/screens/homeScreens/NavigationBar/tools.dart';
import 'package:makhi/screens/splashScreen/onboarding.dart';
import 'package:makhi/services/authentication_services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';



class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final screens = [
    HomePage(),
    SearchPage(),
    ToolsPage(),
    ProfileView(),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex] ,
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

