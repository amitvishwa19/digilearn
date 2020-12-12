import 'package:digilearn/utils/colors.dart';
import 'package:flutter/material.dart';

class HomeActionIcon extends StatelessWidget {
  const HomeActionIcon({
    Key key,
    this.title,
    this.icon,
    this.onClick
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 90,
      height: 90,
      child: InkWell(
        onTap: onClick,
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.grey[300],
                ),
                  child: Center(child: Icon(icon, color: primaryColor)
                  )

              ),
              SizedBox(height: 5),
              InkWell(
                onTap: onClick,
                  child: Text(title)
              )
            ],
          ),
        ),
      ),
    );
  }
}
