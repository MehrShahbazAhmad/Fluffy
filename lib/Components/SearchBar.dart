// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/theme.dart';

class SearchBar extends StatelessWidget {
  final String hint;
  final Icon icon;
  final bool obscureText;
  final double width;
  final double height;
  const SearchBar(
      {Key? key,
      required this.hint,
      required this.icon,
      this.obscureText = false,
      this.width = 700,
      this.height = 60})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      child: TextField(
          style: TextStyle(
            color: Primary_Color,
            fontSize: 16,
          ),
          obscureText: obscureText,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Primary_Color, width: 5.0),
              borderRadius: BorderRadius.circular(50),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Primary_Color_Light, width: 1.0),
              borderRadius: BorderRadius.circular(50),
            ),
            hintText: hint,
            hintStyle: TextStyle(
              color: Primary_Color_Light,
              fontSize: 16,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w300,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            suffixIcon: Icon(
              icon.icon,
              color: Primary_Color_Light,
              size: 25,
            ),
          )),
    );
  }
}
