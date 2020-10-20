import 'package:digilearn/pages/ProfileCreator/CreateInstitute.dart';
import 'package:digilearn/pages/ProfileCreator/JoinInstitute.dart';
import 'package:digilearn/utils/size_config.dart';
import 'package:digilearn/widgets/OptionCard.dart';
import 'package:flutter/material.dart';

class InstituteOption extends StatelessWidget {
  static String routeName = "/institute_select_option";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Institute Option"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
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
                  "I want to",
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
                        image: "assets/images/createinstitute.png",
                        title: "Create Institute",
                        info: "Click here to create and manage an institute",
                        click: () {
                          Navigator.pushNamed(
                              context, CreateInstitute.routeName);
                        },
                      ),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.04,
                      ),
                      OptionCard(
                        image: "assets/images/joininstitute.jpg",
                        title: "Join Institute",
                        info: "Click here if institute is already on DigiLearn",
                        click: () {
                          Navigator.pushNamed(context, JoinInstitute.routeName);
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
