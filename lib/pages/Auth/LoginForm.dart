import 'package:digilearn/helpers/SharePref.dart';
import 'package:digilearn/pages/Home/homeScreen.dart';
import 'package:digilearn/services/AuthService.dart';
import 'package:digilearn/services/userService.dart';
import 'package:digilearn/widgets/DefaultButton.dart';
import 'package:get/get.dart';
import 'package:digilearn/utils/theme.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading = false;

  final email = TextEditingController();
  final password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  void validate(context) {
    if (_formKey.currentState.validate()) {
      loginClicked(context);
    }
  }

  loginClicked(context) async {
    setState(() {
      _isLoading = true;
    });

    var data = {'email': email.text, 'password': password.text};

    AuthService authService = new AuthService();
    authService.login(data).then((value) {
      if (value.success) {
        SharePref.setBool('isLoggedIn', true);
        SharePref.setString('token', value.token);
        authService.user(value.token).then((value) {
          Get.put(UserController()).user(value);

          setState(() {
            _isLoading = false;
          });

          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        });
      } else {
        final snackBar = SnackBar(content: Text('Invalid Login Credentials'));
        Scaffold.of(context).showSnackBar(snackBar);
      }
    }); //Login Service Called
  }

  userDetails(String _token) async {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        child: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmail,
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "Email Address",
                      //floatingLabelBehavior: FloatingLabelBehavior.always,
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
                      //floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon:
                          CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"))),
              SizedBox(
                height: 50,
              ),
              DZButton(
                buttonText: 'Continue',
                onClick: () {
                  validate(context);
                },
                updating: _isLoading,
              )
            ],
          ),
        )),
      ),
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
