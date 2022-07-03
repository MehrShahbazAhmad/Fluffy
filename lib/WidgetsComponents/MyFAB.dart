import 'package:fluffy/Components/PColorPicker.dart';
import 'package:fluffy/Components/PIconPicker.dart';
import 'package:fluffy/Components/PInputFeild.dart';
import 'package:fluffy/Components/PToggleSwitch.dart';
import 'package:flutter/material.dart';

class MyFAB extends StatefulWidget {
  const MyFAB({Key? key}) : super(key: key);

  @override
  State<MyFAB> createState() => _MyFABState();
}

class _MyFABState extends State<MyFAB> {
  Color iconColor = Colors.blue;
  Icon? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'FloatingActionButton Properties',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Icon(Icons.keyboard_arrow_down, color: Colors.grey),
          ],
        ),
        PIconPicker(
          label: "Icon",
          onChanged: (Icon ico) {
            setState(() {
              icon = ico;
            });
          },
          icon: icon,
        ),
        PColorPicker(
            label: "Color",
            color: iconColor,
            onChanged: (value) {
              setState(() {
                iconColor = Color(int.parse(value));
              });
            },
            onColorChanged: (color) {
              setState(() {
                iconColor = color;
              });
            }),
      ]),
    );
  }
}
