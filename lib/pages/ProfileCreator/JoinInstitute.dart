import 'package:digilearn/utils/size_config.dart';
import 'package:digilearn/widgets/DefaultButton.dart';

import 'package:flutter/material.dart';

class JoinInstitute extends StatelessWidget {
  static String routeName = "/join_institute";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Body(),
    );
  }
}

class Body extends StatelessWidget {
  final institutecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: Column(
          children: [
            Text(
              "Join Existing Institute",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            Text(
              "Get institute code from your fellow tutors of your institute who are already on DigiLearn",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            // CustomTextField(
            //   svgicon: "assets/icons/Discover.svg",
            //   label: "Institute Code",
            //   hint: "Enter Institute Code",
            //   txtcontroller: institutecontroller,
            //   keyboard: "text",
            // ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            DefaultButton(
              text: "Join Institute",
              press: () {
                //Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
