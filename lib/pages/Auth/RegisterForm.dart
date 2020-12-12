import 'package:digilearn/utils/theme.dart';
import 'package:digilearn/widgets/DefaultButton.dart';
import 'package:flutter/material.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: "Email",
                hintText: "Email Address",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon:
                    CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"))),
        SizedBox(
          height: 20,
        ),
        TextFormField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Password",
                hintText: "Your Password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon:
                    CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"))),
        SizedBox(
          height: 20,
        ),
        TextFormField(
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
                labelText: "Confirm Password",
                hintText: "Confirm Your Password",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon:
                    CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg"))),
        SizedBox(
          height: 40,
        ),
        DefaultButton(
          text: "Continue",
          press: () {},
        ),
      ],
    ));
  }
}
