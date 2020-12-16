import 'package:flutter/material.dart';
import 'package:digilearn/utils/colors.dart';
import 'package:digilearn/utils/strings.dart';

class Discussion extends StatelessWidget {
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
                child: Text('Discussion'),
              ),
            ),
          )),
    );
  }
}
