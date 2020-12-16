import 'package:digilearn/controllers/PageController.dart';

import 'package:digilearn/pages/Class/JoinClass.dart';
import 'package:digilearn/pages/Class/createClass.dart';
import 'package:digilearn/pages/Class/classDetail.dart';
import 'package:digilearn/pages/Home/homeScreen.dart';
import 'package:digilearn/services/classService.dart';
import 'package:digilearn/services/userService.dart';
import 'package:digilearn/utils/colors.dart';
import 'package:digilearn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digilearn/utils/strings.dart';

class ClassesHome extends StatelessWidget {
  static String routeName = "/classhome";
  const ClassesHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var type = Get.find<UserController>().userModel.value.type;
    final ClassController classController = Get.put(ClassController());
    var classCount = classController.userClasses.length;
    print(classController.userClasses.length);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.find<ScreenController>().change(1);
              print(Get.find<ScreenController>().page);
              //Get.put(ScreenController()).change(0);
              //Navigator.of(context).pop();
              Navigator.popAndPushNamed(context, HomeScreen.routeName);
              //Navigator.pushNamed(context, HomeScreen.routeName);
              //Get.put<ScreenController>().change(1);
            }),
        title: Text(Strings.appTitle, style: TextStyle(color: Colors.white)),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.popAndPushNamed(context, HomeScreen.routeName);
          return true;
        },
        //Body Container
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                color: backgroundColor,
                image:
                    DecorationImage(image: AssetImage("assets/images/bg.png"))),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Obx(() => ListView.builder(
                  itemCount: classController.userClasses.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print(classController.userClasses[index].title);
                        Get.find<ClassController>()
                            .setClass(classController.userClasses[index].title);
                        Navigator.popAndPushNamed(
                            context, ClassDetail.routeName);
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        //height: 150,
                        decoration: BoxDecoration(
                            boxShadow: boxshadow,
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        classController
                                            .userClasses[index].title,
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: primaryColor,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Text(
                                        'Starts in 5 days',
                                        style: TextStyle(
                                            fontSize: 14, color: lightText),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    classController
                                        .userClasses[index].description,
                                    style: TextStyle(color: lightText),
                                  )
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                children: [
                                  Icon(Icons.group, color: lightText, size: 18),
                                  SizedBox(width: 10),
                                  Text(
                                    '5 Students',
                                    style: TextStyle(
                                        fontSize: 14, color: lightText),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  })),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (type == 'teacher') {
            Navigator.pushReplacementNamed(context, CreateClass.routeName);
          } else {
            Navigator.pushReplacementNamed(context, JoinClass.routeName);
          }
        },
        child: Icon(Icons.add),
        backgroundColor: primaryColor,
        tooltip: type == 'Teacher' ? 'Join Class' : 'Create Class',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
