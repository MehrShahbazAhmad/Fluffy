import 'package:fluffy/Components/PColorPicker.dart';
import 'package:fluffy/Components/PInputFeild.dart';
import 'package:fluffy/Components/PToggleSwitch.dart';
import 'package:flutter/material.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  bool _isAutoFocus = false;
  Color thumbColor = Colors.blue;
  Color activeColor = Colors.blue;
  Color inactiveColor = Colors.lightBlue.shade100;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Silder Properties',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Icon(Icons.keyboard_arrow_down, color: Colors.grey),
          ],
        ),
        PInputFeild(label: "Value"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PInputFeild(
              label: "Min",
              width: 85,
            ),
            PInputFeild(
              label: "Max",
              width: 85,
            ),
            PInputFeild(label: "Divisions", width: 85),
          ],
        ),
        PToggleSwitch(
            label: "AutoFocus",
            status: _isAutoFocus,
            onToggle: (value) {
              setState(() {
                _isAutoFocus = value;
              });
            }),
        PColorPicker(
            label: "Thumb Color",
            color: thumbColor,
            onChanged: (value) {
              setState(() {
                thumbColor = Color(int.parse(value));
              });
            },
            onColorChanged: (color) {
              setState(() {
                thumbColor = color;
              });
            }),
        PColorPicker(
            label: "Active Color",
            color: activeColor,
            onChanged: (value) {
              setState(() {
                activeColor = Color(int.parse(value));
              });
            },
            onColorChanged: (color) {
              setState(() {
                activeColor = color;
              });
            }),
        PColorPicker(
            label: "Inactive Color",
            color: inactiveColor,
            onChanged: (value) {
              setState(() {
                inactiveColor = Color(int.parse(value));
              });
            },
            onColorChanged: (color) {
              setState(() {
                inactiveColor = color;
              });
            }),
      ]),
    );
  }
}
