import 'package:fluffy/Components/SwitchWidgets.dart';
import 'package:fluffy/WidgetsComponents/MyAlign.dart';
import 'package:fluffy/WidgetsComponents/MyLabel.dart';
import 'package:fluffy/WidgetsComponents/MyMargin.dart';
import 'package:fluffy/WidgetsComponents/MyPadding.dart';
import 'package:flutter/material.dart';

class WidgetProperties extends StatelessWidget {
  final int value;
  const WidgetProperties({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(padding: EdgeInsets.symmetric(vertical: 20), children: [
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade400,
                  width: 0.5,
                ),
              ),
            ),
            child: Center(child: MyLabel())),
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade400,
                  width: 0.5,
                ),
              ),
            ),
            child: Center(child: MyPadding())),
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade400,
                  width: 0.5,
                ),
              ),
            ),
            child: Center(child: MyMargin())),
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade400,
                  width: 0.5,
                ),
              ),
            ),
            child: Center(child: MyAlign())),
        Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Center(
                child: SwitchWidgets(
              value: value,
            ))),
      ]),
    );
  }
}
