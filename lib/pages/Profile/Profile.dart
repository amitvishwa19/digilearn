import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:digilearn/controllers/PageController.dart';
import 'package:digilearn/helpers/SharePref.dart';
import 'package:digilearn/pages/Auth/Auth.dart';
import 'package:digilearn/pages/Home/HomeScreen.dart';
import 'package:digilearn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  static String routeName = "/profile";
  //final ScreenController pageController = Get.put(ScreenController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Get.find<ScreenController>().change(1);
                  print(Get.find<ScreenController>().page);
                  //Get.put(ScreenController()).change(0);
                  //Navigator.of(context).pop();
                  Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                  //Navigator.pushNamed(context, HomeScreen.routeName);
                  //Get.put<ScreenController>().change(1);
                }),
            title: Text(
              'Profile',
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Container(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                  margin: EdgeInsets.only(top: 30),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage('assets/images/monica.png'),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.yellow, shape: BoxShape.circle),
                          child: Center(
                            heightFactor: 20,
                            widthFactor: 20,
                            child: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
