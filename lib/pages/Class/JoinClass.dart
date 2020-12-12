import 'dart:ui';

import 'package:digilearn/controllers/PageController.dart';
import 'package:digilearn/pages/Class/ClassHome.dart';
import 'package:digilearn/utils/colors.dart';
import 'package:digilearn/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:digilearn/utils/strings.dart';

class JoinClass extends StatelessWidget {
  static String routeName = "/joinclass";
  const JoinClass({Key key}) : super(key: key);

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
                color: BackgroundColor,
                image:
                    DecorationImage(image: AssetImage("assets/images/bg.png"))),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter class code from invite message',
                      style: TextStyle(fontSize: 18, color: lightText),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      //controller: controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          //contentPadding: EdgeInsets.all(3),
                          border: InputBorder.none,
                          labelText: 'Class Code',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    SizedBox(height: 20),
                    DZButton(
                      buttonText: 'Join Class',
                      updating: false,
                      onClick: () {
                        Fluttertoast.showToast(msg: 'Join Class');
                      },
                    ),
                    SizedBox(height: 40),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'To join your Digilearn class',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: darkText),
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: primaryColor,
                              size: 16,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Use the 6 digit code (Eg: 124345) that is a part of the invite message from your teacher',
                                style: TextStyle(
                                  color: lightText,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: primaryColor,
                              size: 16,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'If you dont have a class code,ask your teacher for the same',
                                style: TextStyle(
                                  color: lightText,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: primaryColor,
                              size: 16,
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                'Only teachers can set upyour class and invite student',
                                style: TextStyle(
                                  color: lightText,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
