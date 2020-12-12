import 'dart:convert';

import 'package:digilearn/models/LoginModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharePref {
  //TO check if onboarding is set true or false
  static Future<bool> onBoarding() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("onBoarding") != null ? true : false;
  }

  //To check if user is logged in or not
  static Future<bool> isLoggedIn() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString("login_details") != null ? true : false;
  }

  //Set sare pref after loggedin
  static Future<void> setLoginDetails(LoginModel model) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setString(
        "login_details", model != null ? jsonEncode(model.toJson()) : null);
  }

  //User Logout
  static Future<void> logout() async {
    await setLoginDetails(null);
  }

  static Future<void> setBool(String key, bool value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setBool(key, value);
  }

  static Future<bool> getBool(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(key);
  }

  static Future<void> setString(String key, String value) async {
    final pref = await SharedPreferences.getInstance();
    pref.setString(key, value);
  }

  Future<String> getString(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getString(key);
  }
}
