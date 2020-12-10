import 'package:flutter/material.dart';
import 'package:ThinkWatch/components/text_field_container.dart';
import 'package:ThinkWatch/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      onChanged: onChanged,
      child: TextField(
        decoration: InputDecoration(
          hintText: this.hintText,
          icon: Icon(
            this.icon,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
