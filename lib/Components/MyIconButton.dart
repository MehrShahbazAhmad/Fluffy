// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../styles/theme.dart';

class MyIconButton extends StatelessWidget {
  final String icon;
  final Color bgColor;
  final Function onPressed;
  final double? radius;
  const MyIconButton(
      {Key? key,
      required this.icon,
      this.bgColor = Primary_Color_Light,
      required this.onPressed,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        child: SvgPicture.string(
          icon,
          width: 30,
          height: 30,
        ),
        style: ElevatedButton.styleFrom(
            shadowColor: Colors.black,
            elevation: 15,
            primary: bgColor,
            textStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'Helvetica',
            ),
            minimumSize: Size(70, 70),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 50),
            )),
        onPressed: () => onPressed(),
      ),
    );
  }
}
