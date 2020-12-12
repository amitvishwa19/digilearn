import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:digilearn/controllers/AuthController.dart';
import 'package:digilearn/helpers/SharePref.dart';
import 'package:digilearn/pages/Auth/Auth.dart';
import 'package:digilearn/pages/Profile/Profile.dart';
import 'package:digilearn/utils/constants.dart';
import 'package:digilearn/widgets/HomeActionIcon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

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
          body: AnimatedContainer(
            height: height,
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
                image:
                    DecorationImage(image: AssetImage("assets/images/bg.png"))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Main Curve Container
                  Container(
                    width: width,
                    height: 60,
                    decoration: BoxDecoration(
                        color: !isOpened ? appPrimaryColor : Colors.red[100],
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                        child: Column(
                          children: [
                            Row(
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
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                HomeActionIcon(
                                  title: "Chat",
                                  icon: FontAwesomeIcons.comment,
                                ),
                                HomeActionIcon(
                                  title: "Teachers",
                                  icon: FontAwesomeIcons.users,
                                ),
                                HomeActionIcon(
                                    title: "Notice",
                                    icon: FontAwesomeIcons.bullhorn),
                              ],
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
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: CurvedNavigationBar(
            height: 50.0,
            backgroundColor: Colors.white,
            color: appPrimaryColor,
            items: [
              Icon(
                Icons.verified_user,
                size: 20,
                color: Colors.white,
              ),
              Icon(Icons.verified_user, size: 20, color: Colors.white),
              Icon(Icons.home, size: 20, color: Colors.white),
              Icon(FontAwesomeIcons.user, size: 20, color: Colors.white),
              Icon(FontAwesomeIcons.powerOff, size: 20, color: Colors.white),
            ],
            animationDuration: Duration(microseconds: 300),
            animationCurve: Curves.bounceInOut,
            index: 2,
            onTap: (index) {
              if (index == 2) {
                print('Home Page');
              } else if (index == 3) {
                Navigator.pushNamed(context, Profile.routeName);
              } else if (index == 4) {
                SharePref.setString('token', null);
                Navigator.pushReplacementNamed(context, Auth.routeName);
              }
            },
          )),
    );
  }

  AppBar buildAppBar() {
    final userController = Get.put(UserController());
    return AppBar(
      leading: CircleAvatar(
        radius: 10,
        backgroundImage: NetworkImage(
            'https://cdn3.iconfinder.com/data/icons/minicons-for-web-sites/24/minicons2-14-512.png'),
        backgroundColor: Colors.green,
        child: Text(
          'AV',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {}),
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetX<UserController>(
            builder: (c) {
              return Text(
                  '${c.userModel.value.firstname},${c.userModel.value.lastname}',
                  style: TextStyle(
                      fontSize: 16, color: Colors.white, fontFamily: "Nunito"));
            },
          ),
          GetX<UserController>(
            builder: (c) {
              return Text('${c.userModel.value.type}',
                  style: TextStyle(
                      fontSize: 14, color: Colors.white, fontFamily: "Nunito"));
            },
          ),
        ],
      ),
    );
  }
}
