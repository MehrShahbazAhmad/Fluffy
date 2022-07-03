// ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/theme.dart';

class MyTextInput extends StatelessWidget {
  final String hint;
  final Icon icon;
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChange;
  const MyTextInput(
      {Key? key,
      required this.hint,
      required this.icon,
      this.obscureText = false,
      this.keyboardType = TextInputType.none,
      this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 372,
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color.fromARGB(20, 255, 255, 255),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
          onChanged: onChange,
          obscureText: obscureText,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            hintStyle: TextStyle(
              color: Primary_Color_Light,
              fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w300,
            ),
            contentPadding: EdgeInsets.all(20),
            prefixIcon: Icon(
              icon.icon,
              color: Primary_Color_Light,
              size: 25,
            ),
          )),
    );
  }
}
