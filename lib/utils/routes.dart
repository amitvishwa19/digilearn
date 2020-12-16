//import 'dart:js';

import 'package:digilearn/pages/Auth/Auth.dart';
import 'package:digilearn/pages/Class/classesHome.dart';
import 'package:digilearn/pages/Class/JoinClass.dart';
import 'package:digilearn/pages/Class/createClass.dart';
import 'package:digilearn/pages/Class/classDetail.dart';
import 'package:digilearn/pages/Home/homeScreen.dart';
import 'package:digilearn/pages/Home/NoticeBoard.dart';
import 'package:digilearn/pages/Home/Explore.dart';
import 'package:digilearn/pages/Home/Support.dart';
import 'package:digilearn/pages/Home/RecentActivity.dart';
import 'package:digilearn/pages/OnBoard/OnBoardingScreen.dart';
import 'package:digilearn/pages/Profile/EditProfile.dart';
import 'package:digilearn/pages/Profile/Profile.dart';
import 'package:digilearn/pages/ProfileCreator/CreateInstitute.dart';
import 'package:digilearn/pages/ProfileCreator/InstituteOption.dart';
import 'package:digilearn/pages/ProfileCreator/JoinInstitute.dart';
import 'package:digilearn/pages/ProfileCreator/StudentTeacherOption.dart';
import 'package:digilearn/pages/ProfileCreator/TeacherOption..dart';
import 'package:digilearn/pages/Settings/Settings.dart';
import 'package:digilearn/pages/notification/notification.dart';
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
  Notifications.routeName: (context) => Notifications(),
  Settings.routeName: (context) => Settings(),
  EditProfile.routeName: (context) => EditProfile(),
  ClassesHome.routeName: (context) => ClassesHome(),
  JoinClass.routeName: (context) => JoinClass(),
  CreateClass.routeName: (context) => CreateClass(),
  ClassDetail.routeName: (context) => ClassDetail(),
  RecentActivity.routeName: (context) => RecentActivity(),
  NoticeBoard.routeName: (context) => NoticeBoard(),
  Explore.routeName: (context) => Explore(),
  Support.routeName: (context) => Support(),
};
