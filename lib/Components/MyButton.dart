// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import '../styles/theme.dart';

class MyButton extends StatelessWidget {
  final String label;
  final bool isLoading;
  final Color? color;
  final Color? textColor;
  final double? roundness;
  final Function onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  const MyButton(
      {Key? key,
      required this.label,
      required this.onPressed,
      this.isLoading = false,
      this.color,
      this.roundness,
      this.width,
      this.textColor,
      this.fontSize,
      this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: TextButton(
        child: isLoading
            ? CircularProgressIndicator(
                color: color != null ? Primary_Color_Light : Primary_Color,
                strokeWidth: 2,
              )
            : Text(
                label,
                style: TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                ),
              ),
        style: TextButton.styleFrom(
            backgroundColor: color ?? Primary_Color_Light,
            primary: Colors.black,
            textStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'Helvetica',
            ),
            minimumSize: Size(width ?? 300, height ?? 65),
            padding: EdgeInsets.symmetric(horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(roundness ?? 50)),
            )),
        onPressed: () => onPressed(),
      ),
    );
  }
}
