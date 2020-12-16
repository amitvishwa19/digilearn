// import 'dart:convert';

// import 'package:digilearn/models/LoginModel.dart';
// import 'package:digilearn/services/AuthService.dart';
// import 'package:digilearn/helpers/SharePref.dart';
// import 'package:digilearn/models/UserModel.dart';
// import 'package:get/get.dart';
// import 'package:digilearn/utils/strings.dart';
// import 'package:http/http.dart' as http;

// class UserController extends GetxController {

//   final userModel = UserModel().obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchUser();
//   }

//   void fetchUser() async {
//     //var _token = await SharePref().getString('token');
//     //var user = await AuthService.user(_token);
//     //userModel.value = user;
//   }

//   void user(user) {
//     userModel.value = user;
//     update();
//   }

//   updateUserType(String type){
//     userModel.update((val) {
//       val.type = type;
//     });
//   }

// }
