import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:digilearn/controllers/PageController.dart';
import 'package:digilearn/pages/Class/classesHome.dart';
import 'package:digilearn/pages/Home/explore.dart';
import 'package:digilearn/pages/Home/recentActivity.dart';
import 'package:digilearn/pages/Home/support.dart';
import 'package:digilearn/pages/Settings/Settings.dart';
import 'package:digilearn/pages/notification/notification.dart';
import 'package:digilearn/services/userService.dart';
import 'package:digilearn/utils/colors.dart';
import 'package:digilearn/utils/constants.dart';
import 'package:digilearn/widgets/CircleAvatar.dart';
import 'package:digilearn/widgets/HomeActionIcon.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';

import 'noticeBoard.dart';

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

    return Scaffold(
        appBar: buildAppBar(),
        body: WillPopScope(
          onWillPop: onWillPop,
          child: AnimatedContainer(
            height: height,
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
                color: backgroundColor,
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
                        color: primaryColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10))),
                  ),

                  //Home action icon section
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        //Main Action icons
                        Container(
                          transform: Matrix4.translationValues(0, -60, 0),
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
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //Class Icon
                                    HomeActionIcon(
                                      title: "Class",
                                      icon: FontAwesomeIcons.graduationCap,
                                      onClick: () {
                                        var type = Get.find<UserController>()
                                            .userModel
                                            .value
                                            .type;

                                        print(type);

                                        Navigator.pushReplacementNamed(
                                            context, ClassesHome.routeName);
                                      },
                                    ),

                                    //Subject
                                    HomeActionIcon(
                                      title: "Subject",
                                      icon: FontAwesomeIcons.book,
                                      onClick: () {
                                        Fluttertoast.showToast(
                                            msg: 'Subject is clicked');
                                      },
                                    ),

                                    //Assignment
                                    HomeActionIcon(
                                      title: "Assignments",
                                      icon: FontAwesomeIcons.lightbulb,
                                      onClick: () {
                                        Fluttertoast.showToast(
                                            msg: 'Assignment is clicked');
                                      },
                                    ),
                                  ],
                                ),
                                SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //Test
                                    HomeActionIcon(
                                      title: "Tests",
                                      icon: FontAwesomeIcons.stream,
                                      onClick: () {
                                        Fluttertoast.showToast(
                                            msg: 'Tests is clicked');
                                      },
                                    ),

                                    //Teacher
                                    HomeActionIcon(
                                      title: "Teachers",
                                      icon: FontAwesomeIcons.users,
                                      onClick: () {
                                        Fluttertoast.showToast(
                                            msg: 'Teachers is clicked');
                                      },
                                    ),

                                    //Notice
                                    HomeActionIcon(
                                      title: "Notice",
                                      icon: FontAwesomeIcons.bullhorn,
                                      onClick: () {
                                        Fluttertoast.showToast(
                                            msg: 'Notice is clicked');
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        //Recent activity
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, RecentActivity.routeName);
                          },
                          child: Container(
                            transform: Matrix4.translationValues(0, -40, 0),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Recent Activity',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Container(
                                  height: 100,
                                  decoration: BoxDecoration(
                                      boxShadow: boxshadow,
                                      color: Colors.white,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      )),
                                  child: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      //mainAxisAlignment:MainAxisAlignment.start ,
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 50,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50)),
                                            color: primaryColor,
                                          ),
                                          child: Center(
                                            child: Icon(
                                              FontAwesomeIcons.stream,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20),
                                        Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Maths Test',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                              Text(
                                                '04.40 PM',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                'Status:Completed',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey),
                                              )
                                            ],
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.yellow,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(5),
                                                  child: Container(
                                                    child: Text('6 Dec'),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        //Notice board
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, NoticeBoard.routeName);
                          },
                          child: Container(
                            width: width,
                            transform: Matrix4.translationValues(0, -20, 0),
                            decoration: BoxDecoration(
                                boxShadow: boxshadow,
                                color: noticeBoard,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text('Notice Board',
                                        style: TextStyle(fontSize: 18),
                                        textAlign: TextAlign.left),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                          color: primaryColor,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            FontAwesomeIcons.file,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 20),
                                      Expanded(
                                        child: Text(
                                          'Access all important announcement,notices and circulars here',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),

                        //Support and feedback
                        Container(
                          //height: 140,
                          width: width,
                          transform: Matrix4.translationValues(0, 0, 0),
                          decoration: BoxDecoration(
                              boxShadow: boxshadow,
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(10),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text('Support & Feedback',
                                            style: TextStyle(fontSize: 18),
                                            textAlign: TextAlign.left),
                                      ),
                                      SizedBox(height: 5),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            'Share your feedback and suggestions',
                                            style: TextStyle(fontSize: 16),
                                            textAlign: TextAlign.left),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 1,
                                color: Colors.grey,
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Share.share(
                                            'check out my website https://example.com',
                                            subject: 'Look what I made!');
                                      },
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Icon(FontAwesomeIcons.envelope),
                                            SizedBox(width: 10),
                                            Text('Write to DigiLearn',
                                                style: TextStyle(
                                                    color: primaryColor))
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: 1,
                                      height: 60,
                                      color: Colors.grey,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacementNamed(
                                            context, Support.routeName);
                                      },
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Icon(FontAwesomeIcons
                                                .questionCircle),
                                            SizedBox(width: 10),
                                            Text('Support & Faq\'s',
                                                style: TextStyle(
                                                    color: primaryColor)),
                                            SizedBox(width: 20),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),

                        //Explore more
                        Container(
                          width: width,
                          transform: Matrix4.translationValues(0, 20, 0),
                          decoration: BoxDecoration(
                              boxShadow: boxshadow,
                              color: getMore,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Row(
                            children: [
                              Container(
                                child: Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          // Note: Styles for TextSpans must be explicitly defined.
                                          // Child text spans will inherit styles from parent
                                          style: TextStyle(
                                            fontSize: 24.0,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(text: 'Get'),
                                            TextSpan(
                                                text: ' more',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      RichText(
                                        text: TextSpan(
                                          // Note: Styles for TextSpans must be explicitly defined.
                                          // Child text spans will inherit styles from parent
                                          style: TextStyle(
                                            fontSize: 24.0,
                                            color: Colors.black,
                                          ),
                                          children: <TextSpan>[
                                            TextSpan(text: 'from'),
                                            TextSpan(
                                                text: ' DigiLearn',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Container(
                                        decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 10),
                                          child: GestureDetector(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                  context, Explore.routeName);
                                            },
                                            child: Container(
                                              child: Text(
                                                'Explore Now',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                child: Container(
                                  height: 180,
                                  width: 180,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/splash_bg_2.png'))),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 40)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        //Bottom Navigation bar
        bottomNavigationBar: CurvedNavigationBar(
          height: 50.0,
          backgroundColor: backgroundColor,
          color: primaryColor,
          items: [
            Icon(FontAwesomeIcons.bell, size: 20, color: Colors.white),
            Icon(Icons.home, size: 20, color: Colors.white),
            Icon(FontAwesomeIcons.cog, size: 20, color: Colors.white),
          ],
          animationDuration: Duration(microseconds: 300),
          animationCurve: Curves.bounceInOut,
          index: Get.put(ScreenController()).page,
          onTap: (index) {
            if (index == 0) {
              Get.find<ScreenController>().change(0);
              Navigator.popAndPushNamed(context, Notifications.routeName);
            } else if (index == 1) {
              print('1 clicked');
            } else if (index == 2) {
              //print(Get.find<ScreenController>().change(2));
              Get.find<ScreenController>().change(2);
              //print(Get.find<ScreenController>().page);
              //Navigator.pushNamed(context, Profile.routeName);
              Navigator.popAndPushNamed(context, Settings.routeName);
            }
          },
        ));
  }

  AppBar buildAppBar() {
    String _firstName = Get.find<UserController>().userModel.value.firstname;
    String _lastName = Get.find<UserController>().userModel.value.lastname;
    String _type = Get.find<UserController>().userModel.value.type;
    String _avatar = Get.find<UserController>().userModel.value.avatarUrl;
    final String _initials =
        (Get.find<UserController>().userModel.value.firstname[0] +
                Get.find<UserController>().userModel.value.lastname[0])
            .toUpperCase();
    return AppBar(
      actions: [
        CAvatar(radius: 20, url: _avatar, text: _initials),
        SizedBox(
          width: 20,
        )
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '${_firstName[0].toUpperCase() + _firstName.substring(1)},${_lastName[0].toUpperCase() + _lastName.substring(1)}',
              style: TextStyle(
                  fontSize: 16, color: Colors.white, fontFamily: "Nunito")),
          Text(_type[0].toUpperCase() + _type.substring(1),
              style: TextStyle(
                  fontSize: 14, color: Colors.white, fontFamily: "Nunito")),
        ],
      ),
    );
  }

  DateTime currentBackPressTime;
  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Press again to exit application');
      return Future.value(false);
    }
    return Future.value(true);
  }
}
