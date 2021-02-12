import 'dart:ui';
import 'package:digilearn/services/ClassroomService.dart';
import 'package:digilearn/services/userService.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:digilearn/controllers/PageController.dart';
import 'package:digilearn/pages/Class/classesHome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'classDetailPages/overview.dart' as overview;
import 'classDetailPages/discussion.dart' as discussion;
import 'classDetailPages/homework.dart' as homework;
import 'classDetailPages/attendence.dart' as attendence;
import 'classDetailPages/students.dart' as students;
import 'classDetailPages/resources.dart' as resources;

class ClassDetail extends StatefulWidget {
  static String routeName = "/classdetail";

  @override
  _ClassDetailState createState() => _ClassDetailState();
}

class _ClassDetailState extends State<ClassDetail>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final String _type = Get.find<UserController>().userModel.value.type;

  @override
  void initState() {
    _tabController =
        new TabController(length: _type == 'teacher' ? 6 : 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Get.find<ScreenController>().change(1);
              Navigator.popAndPushNamed(context, ClassesHome.routeName);
            }),
        title: Text(Get.find<ClassController>().classModel.value.name,
            style: TextStyle(color: Colors.white)),
        bottom: TabBar(
          isScrollable: _type == 'teacher' ? true : false,
          tabs: [
            Tab(
              icon: Icon(FontAwesomeIcons.eye, size: 14),
              text: 'Overview',
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.comment, size: 14),
              text: 'Discussion',
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.book, size: 14),
              text: 'Homework',
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.paperclip, size: 14),
              text: 'Resources',
            ),
            if (_type == 'teacher')
              Tab(
                icon: Icon(FontAwesomeIcons.list, size: 14),
                text: 'Attendence',
              ),
            if (_type == 'teacher')
              Tab(
                icon: Icon(FontAwesomeIcons.users, size: 14),
                text: 'Students',
              )
          ],
          controller: _tabController,
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.popAndPushNamed(context, ClassesHome.routeName);
          return true;
        },
        child: TabBarView(
          controller: _tabController,
          children: [
            overview.Overview(),
            discussion.Discussion(),
            homework.Homework(),
            resources.Resources(),
            if (_type == 'teacher') attendence.Attendence(),
            if (_type == 'teacher') students.Students()
          ],
        ),
      ),
    );
  }
}
