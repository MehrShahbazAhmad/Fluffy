// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../styles/theme.dart';

class MyButton extends StatelessWidget {
  final String label;
  const MyButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: TextButton(
        child: Text(label),
        style: TextButton.styleFrom(
            backgroundColor: Primary_Color_Light,
            primary: Colors.black,
            textStyle: TextStyle(
              fontSize: 20,
              fontFamily: 'Helvetica',
            ),
            minimumSize: Size(300, 65),
            padding: EdgeInsets.symmetric(horizontal: 16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(50)),
            )),
        onPressed: () {},
      ),
    );
  }
}
