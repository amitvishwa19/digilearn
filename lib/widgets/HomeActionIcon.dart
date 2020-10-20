import 'package:digilearn/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeActionIcon extends StatelessWidget {
  const HomeActionIcon({
    Key key,
    this.title,
    this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: appPrimaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(child: Icon(icon, color: Colors.white)),
          ),
          SizedBox(height: 5),
          Text(title)
        ],
      ),
    );
  }
}
