import 'package:fluffy/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class MyLabel extends StatefulWidget {
  const MyLabel({Key? key}) : super(key: key);

  @override
  State<MyLabel> createState() => _MyLabelState();
}

class _MyLabelState extends State<MyLabel> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Label',
            style: TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.only(top: 5),
            height: 40,
            width: 280,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.black,
                width: 0.5,
              ),
            ),
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 15),
            width: 280,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Visibility',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                FlutterSwitch(
                  width: 40.0,
                  height: 24.0,
                  valueFontSize: 10,
                  toggleSize: 20.0,
                  padding: 2,
                  activeText: "",
                  inactiveText: "",
                  value: status,
                  borderRadius: 30.0,
                  inactiveColor: Colors.transparent,
                  activeColor: Colors.transparent,
                  inactiveToggleColor: Colors.grey,
                  activeToggleColor: Primary_Color_Dark,
                  switchBorder: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  showOnOff: true,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                    });
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
