import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ThinkWatch/Screens/Login/login_screen.dart';
import 'package:ThinkWatch/Screens/Signup/signup_screen.dart';
import 'package:ThinkWatch/Screens/Welcome/components/background.dart';
import 'package:ThinkWatch/components/rouded_button.dart';
import 'package:ThinkWatch/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RichText(
              text: TextSpan(
                text: "WELCOME TO ",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                children: [
                  TextSpan(
                    text: "THINK&WATCH",
                    style: TextStyle(
                      color: Colors.deepPurple,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Think less, Watch more",
              style: TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.3,
            ),
            RoundedButton(
              text: "LOGIN",
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
            RoundedButton(
              text: "SIGN-UP",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
