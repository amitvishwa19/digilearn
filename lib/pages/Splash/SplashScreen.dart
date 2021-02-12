//import 'package:digilearn/helpers/SharePref.dart';
import 'package:digilearn/helpers/SharePref.dart';
import 'package:digilearn/pages/Auth/Auth.dart';
import 'package:digilearn/pages/Home/homeScreen.dart';
//import 'package:digilearn/pages/Home/HomeScreen.dart';
import 'package:digilearn/pages/OnBoard/OnBoardingScreen.dart';
import 'package:digilearn/services/authService.dart';
import 'package:digilearn/services/userService.dart';
//import 'package:digilearn/services/AuthService.dart';
//import 'package:digilearn/services/userService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
//import 'package:shared_preferences/shared_preferences.dart';

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
                        image: AssetImage('assets/images/digilearn_fevi.png'))),
              ),
              SizedBox(width: 5),
              Container(
                transform: Matrix4.translationValues(0, 2, 0),
                height: 30,
                width: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/digilearn_text.png'))),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future refreshToken() async {
    String _token = await SharePref.getString('token');

    //    print('Input Token:' + _token);
    AuthService authService = new AuthService();
    authService.refresh(_token).then((value) {
      if (value == null) {
        Navigator.pushReplacementNamed(context, Auth.routeName);
        return false;
      } else {
        print('Token refreshed successfully');
        return true;
      }
    });
  }

  Future onBoarding() async {
    bool _onBoarding = await SharePref.getBool('onBoarding');
    String _token = await SharePref.getString('token');

    print(_onBoarding.toString());
    print('Token: ' + _token.toString());

    if (_onBoarding == false) {
      if (_token != null) {
        print('Token will be refreshed');
        //Token will be refreshed
        AuthService authService = new AuthService();
        authService.refresh(_token).then((value) {
          if (value == null) {
            Navigator.pushReplacementNamed(context, Auth.routeName);
          } else {
            SharePref.setString('token', value);
            authService.user(value).then((value) {
              print(value.firstName);
              Get.put(UserController()).user(value);
              Navigator.popAndPushNamed(context, HomeScreen.routeName);
            });
          }
        });
      } else {
        Navigator.pushReplacementNamed(context, Auth.routeName);
      }
    } else {
      Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
    }
  }
}
