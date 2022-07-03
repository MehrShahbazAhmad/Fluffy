import 'dart:html';

import 'package:fluffy/Components/PBorder.dart';
import 'package:fluffy/Components/PColorPicker.dart';
import 'package:fluffy/Components/PDropDown.dart';
import 'package:fluffy/Components/PIconPicker.dart';
import 'package:fluffy/Components/PInputFeild.dart';
import 'package:fluffy/Components/PToggleSwitch.dart';
import 'package:fluffy/WidgetsComponents/MyText.dart';
import 'package:flutter/material.dart';

class MyTextBTN extends StatefulWidget {
  const MyTextBTN({Key? key}) : super(key: key);

  @override
  State<MyTextBTN> createState() => _MyTextBTNState();
}

class _MyTextBTNState extends State<MyTextBTN> {
  bool isfilled = false;
  Color? _BorderColor = Colors.black;
  Color? _filledColor = Colors.white;
  Icon? icon;
  List<String> borderStyleList = ["Solid", "Dashed", "Dotted"];
  String selectedBorderStyle = "Solid";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'TextButton Properties',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Icon(Icons.keyboard_arrow_down, color: Colors.grey),
          ],
        ),
        PInputFeild(label: "Label"),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Decoration Properties',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            ],
          ),
        ),
        PBorder(
          label: "Border",
        ),
        PBorder(
          label: "Border Radius",
        ),
        PColorPicker(
            label: "Border Color",
            color: _BorderColor,
            onChanged: (String value) {
              setState(() {
                _BorderColor = Color(int.parse(value));
              });
            },
            onColorChanged: (Color value) {
              setState(() {
                _BorderColor = value;
              });
            }),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PDropDown(
              label: "Border Style",
              dropDownList: borderStyleList,
              selected: selectedBorderStyle,
              width: 170,
              onChanged: (value) {
                setState(() {
                  selectedBorderStyle = value;
                });
              },
            ),
            PInputFeild(
              label: "Width",
              keyboardType: TextInputType.number,
              width: 80,
            ),
          ],
        ),
        PToggleSwitch(
            label: "Filled",
            status: isfilled,
            onToggle: (value) {
              setState(() {
                isfilled = value;
              });
            }),
        PColorPicker(
            label: "Filled Color",
            color: _filledColor,
            onChanged: (String value) {
              setState(() {
                _filledColor = Color(int.parse(value));
              });
            },
            onColorChanged: (Color value) {
              setState(() {
                _filledColor = value;
              });
            }),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: MyText(),
        ),
        PBorder(
          label: "Content Padding",
        ),
      ]),
    );
  }
}
