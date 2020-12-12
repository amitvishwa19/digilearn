//import 'dart:js';

import 'package:digilearn/pages/Auth/Auth.dart';
import 'package:digilearn/pages/Home/HomeScreen.dart';

import 'package:digilearn/pages/OnBoard/OnBoardingScreen.dart';
import 'package:digilearn/pages/Profile/Profile.dart';
import 'package:digilearn/pages/ProfileCreator/CreateInstitute.dart';
import 'package:digilearn/pages/ProfileCreator/InstituteOption.dart';
import 'package:digilearn/pages/ProfileCreator/JoinInstitute.dart';
import 'package:digilearn/pages/ProfileCreator/StudentTeacherOption.dart';
import 'package:digilearn/pages/ProfileCreator/TeacherOption..dart';

import 'package:digilearn/pages/Splash/SplashScreen.dart';

import 'package:flutter/widgets.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  OnBoardingScreen.routeName: (context) => OnBoardingScreen(),
  Auth.routeName: (context) => Auth(),
  HomeScreen.routeName: (context) => HomeScreen(),
  StudentTeacherOption.routeName: (context) => StudentTeacherOption(),
  TeachersOption.routeName: (context) => TeachersOption(),
  InstituteOption.routeName: (context) => InstituteOption(),
  CreateInstitute.routeName: (context) => CreateInstitute(),
  JoinInstitute.routeName: (context) => JoinInstitute(),
  Profile.routeName: (context) => Profile(),
};
