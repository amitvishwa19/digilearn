import 'dart:convert';

import 'package:digilearn/pages/Drawer/DrawerScreen.dart';
import 'package:digilearn/utils/constants.dart';
import 'package:digilearn/widgets/HomeActionIcon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isOpened = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: () {
        return Future.value(true);
      },
      child: Scaffold(
        appBar: buildAppBar(),
        body: Stack(
          children: [
            //Drawer Screen
            DrawerScreen(),

            //Home Screen
            GestureDetector(
              onTap: () {
                if (isOpened) {
                  setState(() {
                    xOffset = 0;
                    yOffset = 0;
                    scaleFactor = 1;
                    isOpened = false;
                  });
                }
              },
              child: AnimatedContainer(
                height: height,
                transform: Matrix4.translationValues(xOffset, yOffset, 0)
                  ..scale(scaleFactor),
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(isOpened ? 20 : 0),
                  color: Colors.red[100],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Main Curve Container
                      Container(
                        width: width,
                        height: 80,
                        decoration: BoxDecoration(
                            color:
                                !isOpened ? appPrimaryColor : Colors.red[100],
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),

                        //Option Container
                        child: Container(
                          transform: Matrix4.translationValues(0, -50, 0),
                          width: width,
                          decoration: BoxDecoration(
                              boxShadow: boxshadow,
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              )),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                HomeActionIcon(
                                  title: "Subject",
                                  icon: FontAwesomeIcons.book,
                                ),
                                HomeActionIcon(
                                  title: "Assingments",
                                  icon: FontAwesomeIcons.lightbulb,
                                ),
                                HomeActionIcon(
                                    title: "Tests",
                                    icon: FontAwesomeIcons.stream),
                                HomeActionIcon(
                                  title: "Notice",
                                  icon: FontAwesomeIcons.bullhorn,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          height: 200,
                          width: width,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var user = jsonDecode(pref.getString('user'));
    return user;
  }

  AppBar buildAppBar() {
    var user = getUser();
    print(user);

    return AppBar(
      leading: isOpened
          ? AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: 20,
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/monica.png"),
                backgroundColor: Colors.transparent,
              ),
            )
          : IconButton(
              icon: Icon(
                Icons.menu,
              ),
              onPressed: () {
                setState(() {
                  xOffset = 250;
                  yOffset = 60;
                  scaleFactor = 0.7;
                  isOpened = true;
                });
              }),
      actions: [
        IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {}),
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Amit Vishwa",
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontFamily: "Nunito"),
          ),
          Text(
            "Teacher",
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontFamily: "Nunito"),
          )
        ],
      ),
    );
  }
}
