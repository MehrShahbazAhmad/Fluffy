import 'package:fluffy/Components/PBorder.dart';
import 'package:fluffy/Components/PColorPicker.dart';
import 'package:fluffy/Components/PDropDown.dart';
import 'package:fluffy/Components/PIconPicker.dart';
import 'package:fluffy/Components/PInputFeild.dart';
import 'package:fluffy/Components/PToggleSwitch.dart';
import 'package:fluffy/WidgetsComponents/MyText.dart';
import 'package:fluffy/styles/theme.dart';
import 'package:flutter/material.dart';

class MyChecckBox extends StatefulWidget {
  const MyChecckBox({Key? key}) : super(key: key);

  @override
  State<MyChecckBox> createState() => _MyChecckBoxState();
}

class _MyChecckBoxState extends State<MyChecckBox> {
  bool isExpanded = false;
  List<String> _radioItems = [];
  List<String> _positionList = ["Right", "Left"];
  String _position = "Right";
  String option = "";
  Color _activeColor = Colors.white;
  Color _disableColor = Colors.white;
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
                'CheckBox Properties',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            ],
          ),
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
                        _radioItems.add(option);
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
                  children: List.generate(_radioItems.length, (index) {
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
                            _radioItems[index],
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
                              _radioItems.removeAt(index);
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
              label: "Selected Color",
              color: _activeColor,
              onChanged: (String value) {
                setState(() {
                  _activeColor = Color(int.parse(value));
                });
              },
              onColorChanged: (Color value) {
                setState(() {
                  _activeColor = value;
                });
              }),
          PColorPicker(
              label: "Unselected Color",
              color: _disableColor,
              onChanged: (String value) {
                setState(() {
                  _disableColor = Color(int.parse(value));
                });
              },
              onColorChanged: (Color value) {
                setState(() {
                  _disableColor = value;
                });
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PDropDown(
                label: "Button Position",
                dropDownList: _positionList,
                selected: _position,
                onChanged: (value) {
                  setState(() {
                    _position = value;
                  });
                },
                width: 150,
              ),
              PInputFeild(
                label: "Option Height",
                width: 100,
              )
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
