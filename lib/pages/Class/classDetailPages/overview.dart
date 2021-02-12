import 'package:digilearn/services/ClassroomService.dart';
import 'package:flutter/material.dart';
import 'package:digilearn/utils/colors.dart';
import 'package:digilearn/utils/strings.dart';
import 'package:get/get.dart';

class Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: backgroundColor,
              image: DecorationImage(
                  image: AssetImage(Strings.pageBackgroundImage))),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              child: Center(
                  // child: Text(Get.find<ClassController>()
                  //     .classModel
                  //     .value
                  //     .teacher
                  //     .firstname),
                  ),
            ),
          )),
    );
  }
}
