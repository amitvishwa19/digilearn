import 'package:digilearn/utils/constants.dart';
import 'package:digilearn/utils/size_config.dart';
import 'package:flutter/material.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key key,
    this.image,
    this.title,
    this.info,
    this.click,
  }) : super(key: key);

  final String image;
  final String title;
  final String info;
  final Function click;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue[300], width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              height: getProportionateScreenHeight(250),
              width: double.infinity,
              child: Container(
                color: Colors.blue[50],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(image,
                        height: getProportionateScreenHeight(130),
                        width: getProportionateScreenWidth(130)),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.02,
                    ),
                    Text(
                      title,
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.02,
                    ),
                    Text(
                      info,
                      style: TextStyle(fontSize: 14, color: kPrimaryColor),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
