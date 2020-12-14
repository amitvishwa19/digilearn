import 'dart:ui';

import 'package:digilearn/controllers/PageController.dart';
import 'package:digilearn/pages/Class/classHome.dart';
import 'package:digilearn/utils/colors.dart';
import 'package:digilearn/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:digilearn/utils/strings.dart';

class CreateClass extends StatelessWidget {
  static String routeName = "/createclass";
  const CreateClass({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.find<ScreenController>().change(1);
              print(Get.find<ScreenController>().page);
              //Get.put(ScreenController()).change(0);
              //Navigator.of(context).pop();
              Navigator.popAndPushNamed(context, ClassHome.routeName);
              //Navigator.pushNamed(context, HomeScreen.routeName);
              //Get.put<ScreenController>().change(1);
            }),
        title: Text(Strings.appTitle, style: TextStyle(color: Colors.white)),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.popAndPushNamed(context, ClassHome.routeName);
          return true;
        },
        //Body Container
        child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: backgroundColor,
                image:
                    DecorationImage(image: AssetImage("assets/images/bg.png"))),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                child: Text('Create Class'),
              ),
            )),
      ),
    );
  }
}
