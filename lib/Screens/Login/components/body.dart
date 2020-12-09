import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movidea/Screens/Login/components/background.dart';
import 'package:movidea/Screens/Signup/signup_screen.dart';
import 'package:movidea/Screens/Welcome/welcome_screen.dart';
import 'package:movidea/components/already_have_an_account_checked.dart';
import 'package:movidea/components/rouded_button.dart';
import 'package:movidea/components/rounded_input_field.dart';
import 'package:movidea/components/rounded_password_field.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.3,
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
              text: "LOGIN",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  ),
                );
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAccountCheck(
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
            )
          ],
        ),
      ),
    );
  }
}
