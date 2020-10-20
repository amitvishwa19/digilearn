import 'package:digilearn/pages/ProfileCreator/TeacherOption..dart';
import 'package:digilearn/utils/size_config.dart';
import 'package:digilearn/widgets/OptionCard.dart';
import 'package:flutter/material.dart';

class StudentTeacherOption extends StatelessWidget {
  static String routeName = "/student_teacher_selector";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Your Role"),
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
                        image: "assets/images/student.png",
                        title: "Student",
                        info: "Select if you are a Student",
                        click: () {
                          print("Student Clicked");
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.06,
                      ),
                      OptionCard(
                        image: "assets/images/teacher.png",
                        title: "Teacher",
                        info: "Select if you are a Teacher",
                        click: () {
                          Navigator.pushNamed(
                              context, TeachersOption.routeName);
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
