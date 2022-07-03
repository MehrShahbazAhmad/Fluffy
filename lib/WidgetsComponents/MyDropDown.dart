import 'package:fluffy/Components/PBorder.dart';
import 'package:fluffy/Components/PColorPicker.dart';
import 'package:fluffy/Components/PIconPicker.dart';
import 'package:fluffy/Components/PInputFeild.dart';
import 'package:fluffy/Components/PToggleSwitch.dart';
import 'package:fluffy/WidgetsComponents/MyText.dart';
import 'package:fluffy/styles/theme.dart';
import 'package:flutter/material.dart';

class MyDropDown extends StatefulWidget {
  const MyDropDown({Key? key}) : super(key: key);

  @override
  State<MyDropDown> createState() => _MyDropDownState();
}

class _MyDropDownState extends State<MyDropDown> {
  bool isExpanded = false;
  List<String> dropDownItems = [];
  String option = "";
  Color _dropDownColor = Colors.white;
  Color _dropDownIconColor = Colors.black;
  Color _dropDownFocusColor = Colors.white;
  Icon? _dropDownIcon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DropDown Properties',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            ],
          ),
          PToggleSwitch(
              label: "Expanded",
              status: isExpanded,
              onToggle: (value) {
                setState(() {
                  isExpanded = value;
                });
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PInputFeild(
                controller: TextEditingController(text: option),
                label: "Options",
                width: 230,
                onChanged: (value) {
                  option = value;
                },
              ),
              Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.only(top: 35),
                child: TextButton(
                  onPressed: () {
                    if (option != "") {
                      setState(() {
                        dropDownItems.add(option);
                        option = "";
                      });
                    }
                  },
                  child: Icon(Icons.add),
                  style: TextButton.styleFrom(
                    primary: Colors.black,
                    backgroundColor: Colors.grey[200],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
              width: 280,
              child: Column(
                  children: List.generate(dropDownItems.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 230,
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200]),
                        child: Center(
                          child: Text(
                            dropDownItems[index],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              dropDownItems.removeAt(index);
                            });
                          },
                          child: Icon(Icons.delete, color: Colors.red),
                          style: TextButton.styleFrom(
                            primary: Colors.black,
                            backgroundColor: Colors.grey[200],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }))),
          PColorPicker(
              label: "DropDown Color",
              color: _dropDownColor,
              onChanged: (String value) {
                setState(() {
                  _dropDownColor = Color(int.parse(value));
                });
              },
              onColorChanged: (Color value) {
                setState(() {
                  _dropDownColor = value;
                });
              }),
          PIconPicker(
            label: "Icon",
            onChanged: (Icon icon) {
              setState(() {
                _dropDownIcon = icon;
              });
            },
            icon: _dropDownIcon,
          ),
          PColorPicker(
              label: "Icon Color",
              color: _dropDownIconColor,
              onChanged: (String value) {
                setState(() {
                  _dropDownIconColor = Color(int.parse(value));
                });
              },
              onColorChanged: (Color value) {
                setState(() {
                  _dropDownIconColor = value;
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
          PColorPicker(
              label: "Focus Color",
              color: _dropDownFocusColor,
              onChanged: (String value) {
                setState(() {
                  _dropDownFocusColor = Color(int.parse(value));
                });
              },
              onColorChanged: (Color value) {
                setState(() {
                  _dropDownFocusColor = value;
                });
              }),
          PBorder(
            label: "Border Radius",
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PInputFeild(label: "Border Width", width: 135),
              PInputFeild(
                label: "Elevation",
                keyboardType: TextInputType.number,
                width: 135,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: MyText(),
          ),
        ],
      ),
    );
  }
}
