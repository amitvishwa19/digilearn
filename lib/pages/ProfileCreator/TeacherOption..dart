import 'package:digilearn/utils/size_config.dart';
import 'package:digilearn/widgets/OptionCard.dart';
import 'package:flutter/material.dart';

import 'InstituteOption.dart';

class TeachersOption extends StatelessWidget {
  static String routeName = "/teacher_institute_selector";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teacher's Option"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  final firstnamecontroller = TextEditingController();
  final lastnamecontroller = TextEditingController();
  final mobilecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                Text(
                  "I am a",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.04,
                ),
                Container(
                  child: Column(
                    children: [
                      OptionCard(
                        image: "assets/images/singleuser.png",
                        title: "Independent Teacher",
                        info: "Select if you are a Individual Teacher",
                        click: () {
                          print("Independent teacher Clicked");
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.06,
                      ),
                      OptionCard(
                        image: "assets/images/groupuser.png",
                        title: "Part of Institute",
                        info: "Select if you are a part of Institute",
                        click: () {
                          Navigator.pushNamed(
                              context, InstituteOption.routeName);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
