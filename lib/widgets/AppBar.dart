import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: CircleAvatar(
        backgroundImage: AssetImage("assets/images/monica.png"),
        backgroundColor: Colors.transparent,
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.white,
            onPressed: () {}),
      ],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Amit Vishwa",
            style: TextStyle(
                fontSize: 16, color: Colors.white, fontFamily: "Nunito"),
          ),
          Text(
            "Teacher",
            style: TextStyle(
                fontSize: 14, color: Colors.white, fontFamily: "Nunito"),
          )
        ],
      ),
    );
  }
}
