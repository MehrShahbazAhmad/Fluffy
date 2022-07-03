// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../styles/theme.dart';

class ProjectBTN extends StatelessWidget {
  final Widget widget;
  final BorderSide borderSide;
  final Function onPressed;
  final Text label;
  final bool islabel;
  final double height;
  const ProjectBTN(
      {Key? key,
      required this.onPressed,
      this.borderSide = BorderSide.none,
      required this.widget,
      this.label = const Text(""),
      this.islabel = true,
      this.height = 250})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 16, 20, 16),
      child: Column(
        children: [
          OutlinedButton(
            onPressed: () => onPressed(),
            style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                minimumSize: Size(400, height),
                maximumSize: Size(400, height),
                padding: EdgeInsets.all(0),
                primary: Primary_Color_Light,
                side: borderSide,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                )),
            child: widget,
          ),
          islabel
              ? Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: label,
                )
              : Container(),
        ],
      ),
    );
  }
}
