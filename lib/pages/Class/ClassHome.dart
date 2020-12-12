import 'package:digilearn/controllers/PageController.dart';
import 'package:digilearn/pages/Class/JoinClass.dart';
import 'package:digilearn/pages/Home/HomeScreen.dart';
import 'package:digilearn/utils/colors.dart';
import 'package:digilearn/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digilearn/utils/strings.dart';

class ClassHome extends StatelessWidget {
  static String routeName = "/classhome";
  const ClassHome({Key key}) : super(key: key);

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
          decoration: BoxDecoration(
              color: BackgroundColor,
              image:
                  DecorationImage(image: AssetImage("assets/images/bg.png"))),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/teacher.png'))),
                ),
              ),
              Spacer(),
              DZButton(
                buttonText: 'Join Class',
                updating: false,
                onClick: () {
                  Navigator.pushReplacementNamed(context, JoinClass.routeName);
                },
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
