import 'package:digilearn/helpers/SharePref.dart';
import 'package:digilearn/pages/Auth/Auth.dart';
import 'package:digilearn/pages/Home/HomeScreen.dart';
import 'package:digilearn/pages/OnBoard/OnBoardingScreen.dart';
import 'package:digilearn/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/splashscreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 5), onBoarding);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/bg.png"))),
        child: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/Digilearn.png"))),
          ),
        ),
      ),
    );
  }

  Future onBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //bool _obSeen = prefs.getBool('onBoard_visible');

    bool _onBoarding = prefs.getBool('onBoarding');
    String _token = prefs.getString('token');
    //String oldToken = prefs.getString('token');
    //print('Old token :- $oldToken');

    //Getting refresh token
    _token = await AuthService.refresh(_token);
    SharePref.setString('token', _token);
    //print('New Token:- $_token');


    if (_onBoarding == false) {
      //bool _isLoggedIn = prefs.getBool('isLoggedIn');
      if (_token != null) {
        //Navigator.pushReplacementNamed(context, Auth.routeName);
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, Auth.routeName);
      }
    } else {
      Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
    }
  }
}
