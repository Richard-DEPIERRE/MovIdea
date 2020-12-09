import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movidea/Screens/Building/building.dart';
import 'package:movidea/Screens/Login/login_screen.dart';
import 'package:movidea/Screens/Signup/components/background.dart';
import 'package:movidea/Screens/Signup/components/or_divider.dart';
import 'package:movidea/Screens/Signup/components/social.icon.dart';
import 'package:movidea/components/already_have_an_account_checked.dart';
import 'package:movidea/components/rouded_button.dart';
import 'package:movidea/components/rounded_input_field.dart';
import 'package:movidea/components/rounded_password_field.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              icon: Icons.person,
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChange: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
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
