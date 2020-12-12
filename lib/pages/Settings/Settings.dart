import 'package:digilearn/controllers/AuthController.dart';
import 'package:digilearn/controllers/PageController.dart';
import 'package:digilearn/helpers/SharePref.dart';
import 'package:digilearn/pages/Auth/Auth.dart';
import 'package:digilearn/pages/Home/HomeScreen.dart';
import 'package:digilearn/pages/Profile/EditProfile.dart';
import 'package:digilearn/utils/colors.dart';
import 'package:digilearn/utils/constants.dart';
import 'package:digilearn/utils/strings.dart';
import 'package:digilearn/widgets/CircleAvatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
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
              Navigator.popAndPushNamed(context, HomeScreen.routeName);
              //Navigator.pushNamed(context, HomeScreen.routeName);
              //Get.put<ScreenController>().change(1);
            }),
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Get.find<ScreenController>().change(1);
          Navigator.popAndPushNamed(context, HomeScreen.routeName);
          return true;
        },
        child: Builder(
          builder: (context) => Container(
            color: BackgroundColor,
            padding: EdgeInsets.all(5),
            child: Column(
              children: [
                //User Info Card
                UserInfoCard(),

                //Switch Profile
                InfoNavigationCard(
                  info:
                      'Switch to ${(Get.find<UserController>().userModel.value.type) == 'Student' ? 'Teacher' : 'Student'}  profile',
                  icon: FontAwesomeIcons.syncAlt,
                  callback: () {
                    String _type =
                        Get.find<UserController>().userModel.value.type;
                    if (_type == 'Teacher') {
                      Get.find<UserController>().updateUserType('Student');
                      Get.find<ScreenController>().change(1);
                      //Get.find<UserController>().userModel.value.type = 'Student';
                      Navigator.popAndPushNamed(context, HomeScreen.routeName);
                    } else {
                      Get.find<UserController>().updateUserType('Teacher');
                      Get.find<ScreenController>().change(1);
                      //Get.find<UserController>().userModel.value.type = 'Teacher';
                      Navigator.popAndPushNamed(context, HomeScreen.routeName);
                    }

                    final snackBar = SnackBar(
                        content: Text(
                            'Profile switched to ${Get.find<UserController>().userModel.value.type}'));
                    Scaffold.of(context).showSnackBar(snackBar);
                  },
                ),

                //App Notification Setting
                InfoNavigationCard(
                  info: 'App Notification Settings',
                  icon: FontAwesomeIcons.bell,
                ),

                //Support and feedback
                InfoNavigationCard(
                  info: 'Support & Feedback',
                  icon: FontAwesomeIcons.info,
                ),

                //Tell a friend
                InfoNavigationCard(
                  info: 'Tell a friend about DigiLearn',
                  icon: FontAwesomeIcons.shareAlt,
                  callback: () {
                    share('https://flutter.dev/',
                        'Please install this application DigiLearn for online digital learning ');
                    //C:\Program Files\Android\Android Studio\jre\bin\keytool

                    //C:\Program Files\Android\Android Studio\jre\bin\keytool -genkey -v -keystore c:\Users\amitvishwa\key.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias key
                  },
                ),

                //Logout
                InfoNavigationCard(
                  info: 'Logout',
                  icon: FontAwesomeIcons.signOutAlt,
                  callback: () {
                    SharePref.setString('token', null);
                    SharePref.setBool('isLoggedIn', false);
                    Get.find<ScreenController>().change(1);
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
                              style: TextStyle(color: primaryColor),
                            ),
                            SizedBox(width: 4),
                            Text('|',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(width: 4),
                            Text('Privacy Policy',
                                style: TextStyle(color: primaryColor)),
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
                  color: primaryColor,
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
              CAvatar(
                text: _initials,
                url: _avatar,
                radius: 25,
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${Get.find<UserController>().userModel.value.firstname},${Get.find<UserController>().userModel.value.lastname}'),
                  Text('${Get.find<UserController>().userModel.value.email}'),
                  GetX<UserController>(
                      init: UserController(),
                      builder: (_) {
                        return Text('${_.userModel.value.type}');
                      })
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
                    //Navigator.pushNamed(context, EditProfile.routeName);
                    Navigator.popAndPushNamed(context, EditProfile.routeName);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

Future<void> share(dynamic link, String title) async {
  await FlutterShare.share(
      title: 'DigiLearn',
      text: title,
      linkUrl: link,
      chooserTitle: 'Share about digilearn');
}
