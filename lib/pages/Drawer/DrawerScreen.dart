import 'package:digilearn/models/DrawerItems.dart';
import 'package:digilearn/pages/Auth/Auth.dart';
import 'package:digilearn/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 50),
      color: appPrimaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40),
                  child: Text(
                    "Institute ID : AV443456",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
          ),
          //Top info bar

          //Sidebar menu
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
                children: drawerItems
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(
                                e['icon'],
                                color: Colors.white,
                                size: 16,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                e['title'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              )
                            ],
                          ),
                        ))
                    .toList()),
          ),

          //Bottom Action
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 24,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Settings", style: TextStyle(color: Colors.white)),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 2,
                  height: 15,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                    onTap: () {
                      logoutClicked(context);
                    },
                    child:
                        Text("Logout", style: TextStyle(color: Colors.white)))
              ],
            ),
          )
        ],
      ),
    );
  }
}

Future<void> logoutClicked(context) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  bool _loginStatus = pref.getBool("loginStatus");
  if (_loginStatus == true) {
    pref.setBool("loginStatus", false);
    Navigator.pushNamed(context, Auth.routeName);
  }
}
