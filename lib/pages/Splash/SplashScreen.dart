import 'package:digilearn/pages/Auth/Auth.dart';
import 'package:digilearn/pages/Home/HomeScreen.dart';
import 'package:digilearn/pages/OnBoard/OnBoardingScreen.dart';
//import 'package:digilearn/pages/OnBoard/Onboarding_del.dart';
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

    Timer(Duration(seconds: 5), onboarding);
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

  Future onboarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _obSeen = prefs.getBool('onboard_visible');

    //prefs.setBool('onboard_visible', false);
    if (_obSeen == true) {
      bool _loginStatus = prefs.getBool('loginStatus');
      if (_loginStatus == true) {
        Navigator.pushNamed(context, HomeScreen.routeName);
      } else {
        Navigator.pushNamed(context, Auth.routeName);
      }
    } else {
      Navigator.pushNamed(context, OnBoardingScreen.routeName);
    }
  }
}
