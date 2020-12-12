import 'package:digilearn/utils/size_config.dart';
import 'package:digilearn/widgets/DefaultButton.dart';

import 'package:flutter/material.dart';

class CreateInstitute extends StatelessWidget {
  static String routeName = "/create_institute";
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
              "Create Institute",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            // CustomTextField(
            //   svgicon: "assets/icons/Discover.svg",
            //   label: "Institute Name",
            //   hint: "",
            //   txtcontroller: institutecontroller,
            //   keyboard: "text",
            // ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.04,
            ),
            DefaultButton(
              text: "Create Institute",
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
