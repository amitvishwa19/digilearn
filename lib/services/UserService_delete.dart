//
// import 'dart:convert';
// import 'package:digilearn/models/LoginModel.dart';
// import 'package:digilearn/models/UserModel.dart';
// import 'package:digilearn/utils/strings.dart';
// import 'package:http/http.dart' as http;
//
// class UserService{
//   //final String _url = 'http://dev.digizigs.com//api/v1/auth/login';
//   //final String _url = 'http://192.168.56.1/digizigs/api/v1/auth/login';
//   final String _url = Strings.userUrl;
//
//   static Future<UserModel> user(String _token) async {
//     final String _url =Strings.userUrl;
//     var userModel;
//
//     var header = {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $_token',
//     };
//     //print(_token);
//     try {
//       final response = await http.get(_url, headers: header);
//       return userModelFromJson(response.body);
//     } catch (Exception) {
//       return userModel;
//     }
//     //print(userModel);
//     return userModel;
//   }
// }