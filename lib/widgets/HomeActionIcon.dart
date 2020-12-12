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
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(50))),
            child: Center(child: Icon(icon, color: appPrimaryColor)),
          ),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
