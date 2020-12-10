import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ThinkWatch/API/api.dart';
import 'package:ThinkWatch/Screens/Building/building.dart';
import 'package:ThinkWatch/Screens/Login/login_screen.dart';
import 'package:ThinkWatch/Screens/Signup/components/background.dart';
import 'package:ThinkWatch/Screens/Signup/components/or_divider.dart';
import 'package:ThinkWatch/Screens/Signup/components/social.icon.dart';
import 'package:ThinkWatch/components/already_have_an_account_checked.dart';
import 'package:ThinkWatch/components/rouded_button.dart';
import 'package:ThinkWatch/components/rounded_input_field.dart';
import 'package:ThinkWatch/components/rounded_password_field.dart';
import 'package:ThinkWatch/components/text_field_container.dart';
import 'package:ThinkWatch/constants.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var username = TextEditingController();
    var email = TextEditingController();
    var password = TextEditingController();
    var data;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            SizedBox(height: size.height * 0.035),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.30,
            ),
            SizedBox(height: size.height * 0.025),
            TextFieldContainer(
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                  hintText: "Your Username",
                  icon: Icon(
                    Icons.person,
                    color: kPrimaryColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: "Your Email",
                  icon: Icon(
                    Icons.person,
                    color: kPrimaryColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Password",
                  icon: Icon(
                    Icons.lock,
                    color: kPrimaryColor,
                  ),
                  suffixIcon: Icon(
                    Icons.visibility,
                    color: kPrimaryColor,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () async {
                data =
                    await createUser(username.text, email.text, password.text);
                if (data == 200) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                } else {
                  username.clear();
                  email.clear();
                  password.clear();
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocialIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Building();
                        },
                      ),
                    );
                  },
                ),
                SocialIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Building();
                        },
                      ),
                    );
                  },
                ),
                SocialIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Building();
                        },
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
