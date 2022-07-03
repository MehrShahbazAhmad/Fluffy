import 'package:fluffy/Components/PBorder.dart';
import 'package:fluffy/Components/PColorPicker.dart';
import 'package:fluffy/Components/PDropDown.dart';
import 'package:fluffy/Components/PInputFeild.dart';
import 'package:fluffy/Components/PToggleSwitch.dart';
import 'package:fluffy/WidgetsComponents/MyText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class MyInputFeild extends StatefulWidget {
  const MyInputFeild({Key? key}) : super(key: key);

  @override
  State<MyInputFeild> createState() => _MyInputFeildState();
}

class _MyInputFeildState extends State<MyInputFeild> {
  bool isPassword = false;
  bool isAutoFocus = false;
  bool isReadOnly = false;
  bool isfilled = false;

  Icon? _preIcon;
  Icon? _postIcon;
  Color? _preIconColor = Colors.black;
  Color? _postIconColor = Colors.black;
  Color? _BorderColor = Colors.black;
  Color? _filledColor = Colors.white;

  Future<Icon> _pickIcon() async {
    IconData? icon = await FlutterIconPicker.showIconPicker(context,
        iconPackModes: [IconPack.cupertino]);
    return Icon(icon);
  }

  List<String> borderStyleList = ["Solid", "Dashed", "Dotted"];
  String selectedBorderStyle = "Solid";
  List<String> keyboardType = [
    'Text',
    'Multiline',
    'Number',
    'Email',
    'Phone',
    'Password',
    'Date',
    'Time',
    'DateTime',
    'URL',
    'Address',
  ];
  String selectedKeyboardType = 'Text';
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'TextFeild Properties',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            ],
          ),
          PInputFeild(label: "Label"),
          PInputFeild(label: "hint"),
          PToggleSwitch(
              label: "AutoFocus",
              status: isAutoFocus,
              onToggle: (value) {
                setState(() {
                  isAutoFocus = value;
                });
              }),
          PToggleSwitch(
              label: "ReadOnly",
              status: isReadOnly,
              onToggle: (value) {
                setState(() {
                  isReadOnly = value;
                });
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 130,
                child: PDropDown(
                    label: "Keyboard Type",
                    dropDownList: keyboardType,
                    selected: selectedKeyboardType,
                    onChanged: (value) {
                      setState(() {
                        selectedKeyboardType = value;
                      });
                    }),
              ),
              Container(
                width: 140,
                padding: EdgeInsets.only(top: 18),
                child: PToggleSwitch(
                    label: "isPassword",
                    status: isPassword,
                    onToggle: (value) {
                      setState(() {
                        isPassword = value;
                      });
                    }),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Prefix Icon',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 40,
                    width: 190,
                    child: TextButton.icon(
                      onPressed: () async {
                        Icon? icon = await _pickIcon();
                        setState(() {
                          // print(await _pickIcon());
                          _preIcon = icon;
                        });
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      label: _preIcon != null
                          ? Text(_preIcon!.icon.toString())
                          : Text("none"),
                      icon: Icon(_preIcon?.icon ?? Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            PInputFeild(
                width: 80, label: "Size", keyboardType: TextInputType.number),
          ]),
          PColorPicker(
              label: "Prefix Icon Color",
              color: _preIconColor,
              onChanged: (String value) {
                setState(() {
                  _preIconColor = Color(int.parse(value));
                });
              },
              onColorChanged: (Color value) {
                setState(() {
                  _preIconColor = value;
                });
              }),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Postfix Icon',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    height: 40,
                    width: 190,
                    child: TextButton.icon(
                      onPressed: () async {
                        Icon? icon = await _pickIcon();
                        setState(() {
                          // print(await _pickIcon());
                          _postIcon = icon;
                        });
                      },
                      style: TextButton.styleFrom(
                        primary: Colors.black,
                        backgroundColor: Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      label: _postIcon != null
                          ? Text(_postIcon!.icon.toString())
                          : Text("none"),
                      icon: Icon(_postIcon?.icon ?? Icons.add),
                    ),
                  ),
                ],
              ),
            ),
            PInputFeild(
                width: 80, label: "Size", keyboardType: TextInputType.number),
          ]),
          PColorPicker(
              label: "Postfix Icon Color",
              color: _postIconColor,
              onChanged: (String value) {
                setState(() {
                  _postIconColor = Color(int.parse(value));
                });
              },
              onColorChanged: (Color value) {
                setState(() {
                  _postIconColor = value;
                });
              }),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PInputFeild(
                  label: "Line Height",
                  keyboardType: TextInputType.number,
                  width: 135),
              PInputFeild(
                  label: "No. of Lines",
                  keyboardType: TextInputType.number,
                  width: 135),
            ],
          ),
          PBorder(label: "Content Padding"),
        ],
      ),
    );
  }
}
