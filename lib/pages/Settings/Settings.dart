import 'package:digilearn/controllers/AuthController.dart';
import 'package:digilearn/controllers/PageController.dart';
import 'package:digilearn/helpers/SharePref.dart';
import 'package:digilearn/pages/Auth/Auth.dart';
import 'package:digilearn/pages/Home/HomeScreen.dart';
import 'package:digilearn/pages/Profile/EditProfile.dart';
import 'package:digilearn/utils/Colors.dart';
import 'package:digilearn/utils/constants.dart';
import 'package:digilearn/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  static String routeName = "/settings";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.find<ScreenController>().change(1);
              print(Get.find<ScreenController>().page);
              //Get.put(ScreenController()).change(0);
              //Navigator.of(context).pop();
              Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              //Navigator.pushNamed(context, HomeScreen.routeName);
              //Get.put<ScreenController>().change(1);
            }),
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        color: BackgroundColor,
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            new UserInfoCard(),
            new InfoNavigationCard(
              info: 'App Notification Settings',
              icon: FontAwesomeIcons.bell,
            ),
            new InfoNavigationCard(
              info: 'Support & Feedback',
              icon: FontAwesomeIcons.info,
            ),
            new InfoNavigationCard(
              info: 'Tell a friend about DigiLearn',
              icon: FontAwesomeIcons.shareAlt,
            ),
            new InfoNavigationCard(
              info: 'Logout',
              icon: FontAwesomeIcons.signOutAlt,
              callback: () {
                print('Logout');
                SharePref.setString('token', null);
                SharePref.setBool('isLoggedIn', false);
                Navigator.popAndPushNamed(context, Auth.routeName);
              },
            ),
            Spacer(),

            //App Info Area
            Container(
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/images/digilearn_logo.png"))),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Terms & Condition',
                          style: TextStyle(color: appPrimaryColor),
                        ),
                        SizedBox(width: 4),
                        Text('|',
                            style: TextStyle(
                                color: appPrimaryColor,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: 4),
                        Text('Privacy Policy',
                            style: TextStyle(color: appPrimaryColor)),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Version ${Strings.version}',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

class InfoNavigationCard extends StatelessWidget {
  //final Icon icon;
  final String info;
  final IconData icon;
  final void Function() callback;
  const InfoNavigationCard({Key key, this.info, this.icon, this.callback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: boxshadow,
      ),
      child: InkWell(
        onTap: callback,
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: appPrimaryColor,
                  size: 20,
                ),
                SizedBox(width: 20),
                Text(info),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserInfoCard extends StatelessWidget {
  const UserInfoCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String _initials =
        (Get.find<UserController>().userModel.value.firstname[0] +
                Get.find<UserController>().userModel.value.lastname[0])
            .toUpperCase();
    final String _avatar = Get.find<UserController>().userModel.value.avatarUrl;

    print(Get.find<UserController>().userModel.value.avatarUrl);
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        boxShadow: boxshadow,
      ),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: _avatar != null
                    ? AssetImage('assets/images/monica.png')
                    : null,
                backgroundColor: _avatar != null ? Colors.transparent : null,
                child: _avatar != null
                    ? Text(
                        '',
                        style: TextStyle(fontSize: 20),
                      )
                    : Text(
                        '$_initials',
                        style: TextStyle(fontSize: 20),
                      ),
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${Get.find<UserController>().userModel.value.firstname},${Get.find<UserController>().userModel.value.lastname}'),
                  Text('${Get.find<UserController>().userModel.value.email}')
                ],
              ),
              Spacer(),
              IconButton(
                  icon: Icon(
                    FontAwesomeIcons.pen,
                    size: 20,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    //Navigator.pop(context, EditProfile.routeName);
                    print('Edit Profile');
                    Navigator.pushNamed(context, EditProfile.routeName);
                  })
            ],
          ),
        ),
      ),
    );
  }
}
