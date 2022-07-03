// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import '../styles/theme.dart';

class MyLabelInput extends StatelessWidget {
  final bool obscureText;
  final TextInputType keyboardType;
  final ValueChanged<String>? onChange;
  final String? label;
  final double? width;
  const MyLabelInput(
      {Key? key,
      this.obscureText = false,
      this.keyboardType = TextInputType.none,
      this.onChange,
      this.label,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label ?? "",
              style: TextStyle(
                  color: Primary_Color,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          Container(
            height: 60,
            width: width ?? 480,
            margin: EdgeInsets.symmetric(vertical: 8),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
                style: TextStyle(
                  color: Primary_Color,
                  fontSize: 16,
                ),
                autofocus: false,
                keyboardType: TextInputType.emailAddress,
                onChanged: onChange,
                obscureText: obscureText,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Primary_Color,
                    fontSize: 16,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w300,
                  ),
                  contentPadding: EdgeInsets.all(20),
                )),
          ),
        ],
      ),
    );
  }
}
