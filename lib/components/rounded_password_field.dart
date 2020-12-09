import 'package:flutter/material.dart';
import 'package:movidea/components/text_field_container.dart';
import 'package:movidea/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChange;
  const RoundedPasswordField({
    Key key,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: this.onChange,
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
    );
  }
}