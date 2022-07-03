import 'package:fluffy/OutputCode/GenrateCode.dart';
import 'package:fluffy/WidgetClasses/TextClass.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CenterScreen extends StatefulWidget {
  final ValueSetter<int>? onChanged;
  const CenterScreen({Key? key, this.onChanged}) : super(key: key);

  @override
  State<CenterScreen> createState() => _CenterScreenState();
}

class _CenterScreenState extends State<CenterScreen> {
  List _dropDownList = [
    {
      "name": "iphone 12 pro",
      "width": "390",
      "height": "844",
    },
    {
      "name": "iphone SE",
      "width": "375",
      "height": "667",
    },
    {
      "name": "iphone XR",
      "width": "414",
      "height": "896",
    },
    {
      "name": "iphone X",
      "width": "375",
      "height": "812",
    },
    {
      "name": "iphone 5/SE",
      "width": "320",
      "height": "568",
    },
    {
      "name": "iphone 6/7/8",
      "width": "375",
      "height": "667",
    },
    {
      "name": "iphone 6/7/8 plus",
      "width": "414",
      "height": "736",
    },
    {
      "name": "pixel 5",
      "width": "393",
      "height": "851",
    },
    {
      "name": "samsung galaxy s8+",
      "width": "360",
      "height": "740",
    },
    {
      "name": "samsung galaxy s20 ultra",
      "width": "412",
      "height": "915",
    },
    {
      "name": "ipad pro",
      "width": "1024",
      "height": "1366",
    },
    {
      "name": "ipad air",
      "width": "820",
      "height": "1180",
    },
    {
      "name": "macbook pro",
      "width": "1080",
      "height": "720",
    },
    {
      "name": "macbook air",
      "width": "1080",
      "height": "720",
    },
  ];
  var _selectedItem = {
    "name": "iphone 12 pro",
    "width": "390",
    "height": "844",
  };
  MyService? code;

  @override
  Widget build(BuildContext context) {
    print(code?.myVariable);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 5, left: 5),
              child: Text(
                "Device",
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 35,
                child: DropdownButton(
                  value: _selectedItem["name"],
                  focusColor: Colors.white,
                  elevation: 0,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  icon: Icon(Icons.keyboard_arrow_down),
                  dropdownColor: Colors.white,
                  underline: Container(),
                  items: _dropDownList.map((item) {
                    return DropdownMenuItem(
                      child: Text(item["name"]),
                      value: item["name"],
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    var temp = _dropDownList.firstWhere(
                        (item) => item["name"] == newValue,
                        orElse: () => null);
                    setState(() {
                      _selectedItem = temp;
                    });
                  },
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Expanded(
                child: Center(
              child: DragTarget<int>(
                builder: (
                  BuildContext context,
                  List<dynamic> accepted,
                  List<dynamic> rejected,
                ) {
                  return Container(
                      width: double.parse(_selectedItem["width"].toString()),
                      height: double.parse(_selectedItem["height"].toString()),
                      child: Text("Hello"),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ));
                },
                onAccept: (int data) {
                  widget.onChanged?.call(data);
                },
              ),
            ))
          ]),
    );
  }
}
