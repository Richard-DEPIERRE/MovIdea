import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ThinkWatch/API/api.dart';
import 'package:ThinkWatch/Screens/Building/building.dart';
import 'package:ThinkWatch/Screens/Login/components/background.dart';
import 'package:ThinkWatch/Screens/Signup/signup_screen.dart';
import 'package:ThinkWatch/components/already_have_an_account_checked.dart';
import 'package:ThinkWatch/components/rouded_button.dart';
import 'package:ThinkWatch/components/text_field_container.dart';
import 'package:ThinkWatch/constants.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void _showAlert(String value, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (value.isEmpty) return;

    AlertDialog dialog = new AlertDialog(
      content: Wrap(
        children: [
          new Text(
            value,
            style: new TextStyle(
              fontSize: 15,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.05),
          SvgPicture.asset(
            "assets/icons/access-denied.svg",
            height: size.height * 0.30,
          ),
        ],
      ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text("Close"))
      ],
    );

    showDialog(context: context, child: dialog);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var username = TextEditingController();
    var password = TextEditingController();
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
              text: "LOGIN",
              press: () async {
                var data = await checkUser(username.text, password.text);
                if (data == 200) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Building();
                      },
                    ),
                  );
                } else {
                  username.clear();
                  password.clear();
                  _showAlert(
                      "Your username or password is incorrect.", context);
                }
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
