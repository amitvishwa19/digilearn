import 'dart:ui';

import 'package:digilearn/controllers/PageController.dart';
import 'package:digilearn/pages/Class/classesHome.dart';
import 'package:digilearn/services/ClassroomService.dart';
import 'package:digilearn/utils/colors.dart';
import 'package:digilearn/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:digilearn/utils/strings.dart';

class CreateClass extends StatelessWidget {
  static String routeName = "/createclass";
  const CreateClass({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    final description = TextEditingController();

    createClass() {
      var data = {'title': title.text, 'description': description.text};
      //Fluttertoast.showToast(msg: data.toString());

      ClassService classService = new ClassService();
      classService.addClass(data).then((value) {
        print(value);
      });
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.find<ScreenController>().change(1);
              print(Get.find<ScreenController>().page);
              //Get.put(ScreenController()).change(0);
              //Navigator.of(context).pop();
              Navigator.popAndPushNamed(context, ClassesHome.routeName);
              //Navigator.pushNamed(context, HomeScreen.routeName);
              //Get.put<ScreenController>().change(1);
            }),
        title: Text(Strings.appTitle, style: TextStyle(color: Colors.white)),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.popAndPushNamed(context, ClassesHome.routeName);
          return true;
        },
        //Body Container
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: backgroundColor,
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"))),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Container(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Enter your classroom details',
                      style: TextStyle(fontSize: 18, color: darkText),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: title,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          //contentPadding: EdgeInsets.all(3),
                          border: InputBorder.none,
                          labelText: 'Class name',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    SizedBox(height: 20),
                    TextField(
                      maxLines: 5,
                      controller: description,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          //contentPadding: EdgeInsets.all(3),
                          border: InputBorder.none,
                          labelText: 'Description',
                          floatingLabelBehavior: FloatingLabelBehavior.auto,
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                    ),
                    SizedBox(height: 20),
                    DZButton(
                      buttonText: 'Create Class',
                      updating: false,
                      onClick: () {
                        createClass();
                      },
                    ),
                  ],
                )),
              )),
        ),
      ),
    );
  }
}
