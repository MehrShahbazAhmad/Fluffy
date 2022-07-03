import 'package:fluffy/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class PToggleSwitch extends StatelessWidget {
  final String label;
  final bool status;
  final Function(bool) onToggle;
  const PToggleSwitch(
      {Key? key,
      required this.label,
      required this.status,
      required this.onToggle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
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
            onToggle: onToggle,
          )
        ],
      ),
    );
  }
}
