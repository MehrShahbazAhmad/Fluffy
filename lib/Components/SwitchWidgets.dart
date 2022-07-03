import 'package:fluffy/WidgetsComponents/MyCheckBox.dart';
import 'package:fluffy/WidgetsComponents/MyDropDown.dart';
import 'package:fluffy/WidgetsComponents/MyFAB.dart';
import 'package:fluffy/WidgetsComponents/MyIconBTN.dart';
import 'package:fluffy/WidgetsComponents/MyImageBTN.dart';
import 'package:fluffy/WidgetsComponents/MyInputFeild.dart';
import 'package:fluffy/WidgetsComponents/MyRadio.dart';
import 'package:fluffy/WidgetsComponents/MySlider.dart';
import 'package:fluffy/WidgetsComponents/MyText.dart';
import 'package:fluffy/WidgetsComponents/MyTextBTN.dart';
import 'package:flutter/material.dart';

class SwitchWidgets extends StatelessWidget {
  final int value;
  const SwitchWidgets({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (value) {
      case 1:
        return MyText();
      case 2:
        return MyInputFeild();
      case 3:
        return MyDropDown();
      case 4:
        return MyRadio();
      case 5:
        return MySlider();
      case 6:
        return MyChecckBox();
      case 7:
        return MyIconBTN();
      case 8:
        return MyFAB();
      case 9:
        return MyTextBTN();
      case 10:
        return MyImageBTN();
      default:
        return Container();
    }
  }
}
