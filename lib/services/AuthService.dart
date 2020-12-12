
import 'dart:convert';

import 'package:digilearn/models/LoginModel.dart';
import 'package:digilearn/models/UserModel.dart';
import 'package:http/http.dart' as http;
import 'package:digilearn/utils/strings.dart';

class AuthService{

  //Login Service
  Future<LoginModel> login(data) async {
    //final String _url = 'http://dev.digizigs.com//api/v1/auth/login';
    //final String _url = 'http://192.168.56.1/digizigs/api/v1/auth/login';
    final String _url = Strings.loginUrl;

    var loginModel;

    Map<String, String> header = {
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };

    try {
      //Login request
      final response =
          await http.post(_url, body: jsonEncode(data), headers: header);
      final String res = response.body;

      //final int statusCode = response.statusCode;

      loginModel = LoginModel.fromJson(json.decode(res));
    } catch (Exception) {
      return loginModel;
    }
    //print(loginModel);
    return loginModel;
  }

  //User Service
  static Future<UserModel> user(String _token) async {
    final String _url =Strings.userUrl;
    var userModel;

    var header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    };
    //print(_token);
    try {
      final response = await http.get(_url, headers: header);
      return userModelFromJson(response.body);
    } catch (Exception) {
      return userModel;
    }
    //print(userModel);
    return userModel;
  }

  //Refresh Token
  static Future<String> refresh(String _token) async {
    final String _url =Strings.refreshUrl;
    var header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    };
    //print('Auth service refresh method token: $_token');
    try {
      final response = await http.post(_url, headers: header);
      var jsonRes = jsonDecode(response.body);
      //print('Auth service refresh jsonRes: $jsonRes');
      var accessToken = jsonRes['access_token'];
      //print('Auth service refresh accessToken: $accessToken');
      //print(accessToken);
      return accessToken;
    }catch(e){
      return null;
    }
  }
}