import 'dart:convert';

import 'package:digilearn/models/LoginModel.dart';
import 'package:digilearn/models/UserModel.dart';
import 'package:http/http.dart' as http;
import 'package:digilearn/utils/strings.dart';

class AuthService {
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
      var jsonResponse = json.decode(res);
      loginModel = LoginModel.fromJson(json.decode(res));
    } catch (Exception) {
      return loginModel;
    }
    //print(loginModel);
    return loginModel;
  }

  //Login Status
  static Future<bool> loginStatus(data) async {
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
      var jsonResponse = json.decode(res);
      if (jsonResponse['success']) {
        return true;
      } else {
        return false;
      }
    } catch (Exception) {
      return false;
    }
  }

  //User Service
  Future<UserModel> user(String _token) async {
    final String _url = Strings.userUrl;
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
  }

  //Refresh Token
  static Future<String> refresh(String _token) async {
    final String _url = Strings.refreshUrl;
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
    } catch (e) {
      return null;
    }
  }

  //Update User
  Future<UserModel> updateUser(data, token, image , avatar) async {
    var _url = Strings.updateUser;
    var _token = token;
    var _data = data;
    var  userModel;
    //print(data);
    //print(image.path);

    var header = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $_token',
    };

    //print('Avatar : ${avatar == null ? 'remove' : avatar}');
    var request = http.MultipartRequest('POST', Uri.parse(_url));

    //Check if image is selected or not
    if (image != null) {

      request.files
          .add(await http.MultipartFile.fromPath('avatar', image.path));
    }
    request.headers.addAll(header);
    request.fields.addAll({
      "firstname": data['firstname'],
      "lastname": data['lastname'],
      "email": data['email'],
      "avatar": avatar == null ? 'remove' : avatar
    });

    var response = await request.send();
    //print(jsonDecode(await response.headers.values.));
    //return jsonDecode(response.stream.toString());
    // final response =
    //     await http.post(_url, body: jsonEncode(_data), headers: header);
    // var jsonResponse = json.decode(response.body);
    // print(jsonResponse);
    //user_model = UserModel.fromJson(json.decode(response.body));
    //userModel.value = user_model;
    //Get.put(UserController()).user(user_model);
  }
}
