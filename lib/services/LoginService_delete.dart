// import 'dart:convert';
// import 'package:digilearn/utils/strings.dart';
// import 'package:http/http.dart' as http;
// import 'package:digilearn/models/LoginModel.dart';
//
// class LoginService {
//   Future<LoginModel> userLogin(data) async {
//     //final String _url = 'http://dev.digizigs.com//api/v1/auth/login';
//     //final String _url = 'http://192.168.56.1/digizigs/api/v1/auth/login';
//     final String _url = Strings.loginUrl;
//
//     var loginModel;
//
//     Map<String, String> header = {
//       'Content-type': 'application/json',
//       'Accept': 'application/json'
//     };
//
//     try {
//       //Login request
//       final response =
//           await http.post(_url, body: jsonEncode(data), headers: header);
//       final String res = response.body;
//       //print(json.decode(res));
//       //final int statusCode = response.statusCode;
//
//       loginModel = LoginModel.fromJson(json.decode(res));
//     } catch (Exception) {
//       return loginModel;
//     }
//     //print(loginModel);
//     return loginModel;
//   }
// }
