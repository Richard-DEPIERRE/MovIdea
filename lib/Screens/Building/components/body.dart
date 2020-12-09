import 'package:flutter/material.dart';
import 'package:movidea/Screens/Building/components/background.dart';
import 'package:movidea/Screens/Welcome/welcome_screen.dart';
import 'package:movidea/components/rouded_button.dart';
import 'package:movidea/constants.dart';

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
              "COMING SOON",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 36),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SizedBox(
              width: size.width * 0.4,
              height: size.height * 0.2,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                backgroundColor: kPrimaryLightColor,
                strokeWidth: 15,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            RoundedButton(
              text: "HOME",
              color: kPrimaryColor,
              textColor: Colors.black,
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
            )
          ],
        ),
      ),
    );
  }
}
