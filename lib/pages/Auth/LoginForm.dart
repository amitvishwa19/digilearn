import 'package:digilearn/pages/Home/HomeScreen.dart';
import 'package:digilearn/widgets/default_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';
import 'package:digilearn/utils/theme.dart';
import 'package:flutter/material.dart';
//import 'package:digilearn/api/api.dart';
import 'package:digilearn/api/api.dart';
import 'dart:convert';
import 'dart:async';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;
  bool _isClicked = false;

  final email = TextEditingController();
  final password = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void validate(context) {
    if (_formkey.currentState.validate()) {
      loginClicked(context);
    }
  }

  Future loginClicked(context) async {
    setState(() {
      _isLoading = true;
    });

    var data = {'email': email.text, 'password': password.text};
    var res = await LoginApi().getData(data);
    var body = jsonDecode(res.body);

    print(body);

    if (body['success'] == true) {
      SharedPreferences pref = await SharedPreferences.getInstance();

      //Saving Loging status in pref
      pref.setBool('loginStatus', true);

      //Saving Token in pref
      pref.setString('token', body['token']);

      //Saving user in pref
      pref.setString('user', jsonEncode(body['user']));

      Navigator.pushNamed(context, HomeScreen.routeName);
    } else {
      Toast.show("Invalid Login Credentials", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
          child: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
                controller: email,
                keyboardType: TextInputType.emailAddress,
                validator: validateEmail,
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "Email Address",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    //errorText: "Please enter Email",
                    suffixIcon:
                        CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"))),
            SizedBox(
              height: 40,
            ),
            TextFormField(
                controller: password,
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Enter Password';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "Your Password",
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon:
                        CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"))),
            SizedBox(
              height: 60,
            ),
            DefaultButton(
              text: _isLoading ? "Logging In ..." : "Continue",
              press: () {
                validate(context);
                //Navigator.pushNamed(context, HomeScreen.routeName);
                //
              },
            ),
          ],
        ),
      )),
    );
  }
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter Valid Email';
  else
    return null;
}
