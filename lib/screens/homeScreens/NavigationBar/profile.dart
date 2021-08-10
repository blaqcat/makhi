


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:makhi/services/authentication_services/auth_services.dart';
//import 'package:makhi/services/authentication_services/provider_widget.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:makhi/screens/homeScreens/NavigationBar/profile/user_model.dart';
import 'package:flutter_super_state/flutter_super_state.dart';


class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}


class _ProfileViewState extends State<ProfileView> {

  UserModel _user = UserModel("");
  bool _isAdmin = false;
  TextEditingController _userCountryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FutureBuilder(
            future:  Provider.of<AuthServices>(context).getCurrentUser(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return displayUserInformation(context, snapshot);
              } else {
                return CircularProgressIndicator();
              }

            },
          )
        ],
      ),

    );
  }
  Widget displayUserInformation(context, snapshot) {
    final user = snapshot.data;
    
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Provider.of<AuthServices>(context).getProfileImage(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(" Name: ${user.displayName}", style: TextStyle(fontSize: 20),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(" Email: ${user.email}", style: TextStyle(fontSize: 20),),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(" Created: ${DateFormat('MM/dd/yyyy').format(user.metadata.creationTime)}",
            style: TextStyle(fontSize: 20),
          ),
        ),
        FutureBuilder(
            future: _getProfileData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                _userCountryController.text = _user.homeCountry;
                _isAdmin = _user.admin ?? false;
              }
              return Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Home Country: ${_userCountryController.text}",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              );


            })

      ],
    );

  }

  void _userEditBottomSheet( BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height:MediaQuery.of(context).size.height * .60 ,
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Update Profile"),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.cancel),
                        color: Colors.orange,
                        iconSize: 25,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15.0),
                          child: TextField(
                            controller: _userCountryController,
                            decoration: InputDecoration(
                              helperText: "Province",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          );
        }
    );
  }
  _getProfileData() async {
    final uid = await Provider.of<AuthServices>(context).getCurrentUID();
    await Provider.of(context)
        .db
        .collection('userDate')
        .document(uid)
        .get().then((result) {
          _user.homeCountry = result.data['homeCountry'];
          _user.admin =result.data['admin'];
    });

  }



}