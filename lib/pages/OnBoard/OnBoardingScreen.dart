import 'dart:ui';
import 'package:digilearn/pages/Auth/Auth.dart';
import 'package:digilearn/utils/constants.dart';
import 'package:digilearn/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatelessWidget {
  static String routeName = "/onboarding";
  @override
  Widget build(BuildContext context) {
    return Body();
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int currentPage = 0;

  List<Map<String, String>> splashData = [
    {
      "title": "This is a test title",
      "text": "Welcome to DigiLearn,Let’s Learn!",
      "image": "assets/images/splash_bg_1.png"
    },
    {
      "title": "This is a test title",
      "text": "We help people conect with store around United State of America",
      "image": "assets/images/splash_bg_2.png"
    },
    {
      "title": "This is a test title",
      "text": "We show the easy way to shop.Just stay at home with us",
      "image": "assets/images/splash_bg_7.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/bg.png"))),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 500,
                  child: PageView.builder(
                      onPageChanged: (value) {
                        setState(() {
                          currentPage = value;
                          print(value);
                        });
                      },
                      itemCount: splashData.length,
                      itemBuilder: (context, index) => OnboardContent(
                            appTitle: Strings.appTitle,
                            appSubtitle: splashData[index]['text'],
                            image: splashData[index]['image'],
                          )),
                )
              ],
            )
          ],
        ),
        bottomSheet: currentPage != splashData.length - 1
            ? Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () async {
                        SharedPreferences pref =
                            await SharedPreferences.getInstance();
                        pref.setBool('onboard_visible', true);

                        Navigator.pushNamed(context, Auth.routeName);
                      },
                      child: Text(
                        "Skip",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            splashData.length, (index) => buildDots(index)),
                      ),
                    ),
                  ],
                ),
              )
            : InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Auth.routeName);
                },
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(color: appPrimaryColor),
                    child: Text(
                      "Get Started now",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    )),
              ),
      ),
    );
  }

  AnimatedContainer buildDots(int index) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: EdgeInsets.only(right: 5),
      height: 8,
      width: currentPage == index ? 20 : 10,
      decoration: BoxDecoration(
          color: currentPage == index ? appPrimaryColor : Color(0xFFD8D8D8),
          borderRadius: BorderRadius.circular(3)),
    );
  }
}

//Onboarding content
class OnboardContent extends StatelessWidget {
  final String appTitle, appSubtitle, image;

  const OnboardContent({Key key, this.appTitle, this.appSubtitle, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Text(
            appTitle,
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: appPrimaryColor),
          ),
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(50),
          decoration:
              BoxDecoration(image: DecorationImage(image: AssetImage(image))),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Text(
            appSubtitle,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
