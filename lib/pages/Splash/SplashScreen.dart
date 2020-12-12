import 'package:digilearn/controllers/AuthController.dart';
import 'package:digilearn/helpers/SharePref.dart';
import 'package:digilearn/pages/Auth/Auth.dart';
import 'package:digilearn/pages/Home/HomeScreen.dart';
import 'package:digilearn/pages/OnBoard/OnBoardingScreen.dart';
import 'package:digilearn/services/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:digilearn/helpers/SharePref.dart';

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
    onBoarding();
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
          child: Row(
            // duration: Duration(seconds: 2),
            // height: 200,
            // width: 200,
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //         image: AssetImage("assets/images/digilearn_logo.png"))),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/digilearn_fevi.png')
                  )
                ),
              ),
              SizedBox(width: 5),
              Container(
                transform: Matrix4.translationValues(0, 2, 0),
                height: 30,
                width: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/digilearn_text.png')
                    )
                ),
              )
            ],
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

    if (_onBoarding == false) {
      //bool _isLoggedIn = prefs.getBool('isLoggedIn');
      if (_token != null) {
        AuthService authService = new AuthService();
        authService.user(_token).then((value) {
          Get.put(UserController()).user(value);
          Navigator.popAndPushNamed(context, HomeScreen.routeName);
        });
        //Navigator.pushReplacementNamed(context, HomeScreen.routeName);
      } else {
        Navigator.pushReplacementNamed(context, Auth.routeName);
      }
    } else {
      Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
    }
  }
}
