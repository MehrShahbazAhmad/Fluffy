import 'package:fluffy/OutputCode/GenrateCode.dart';
import 'package:fluffy/WidgetClasses/TextClass.dart';
import 'package:fluffy/provider/MyTextProvider.dart';
import 'package:fluffy/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';

class MyText extends StatefulWidget {
  const MyText({Key? key, this.onChangedText}) : super(key: key);
  final ValueSetter<String>? onChangedText;
  @override
  State<MyText> createState() => _MyTextState();
}

class _MyTextState extends State<MyText> {
  Map widgetsData = {
    "type": "text",
    "args": {
      "text": "I'm a Text Widget",
      "style": {
        "align": "center",
        "color": "#ff0000",
        "fontSize": 100,
        "fontWeight": "bold",
        "fontFamily": "Arial",
      }
    }
  };

  void changeText(mytext) {
    widgetsData['args']['text'] = mytext;
  }

  void changeColor(mycolor) {
    widgetsData['args']['style']['color'] = mycolor;
  }

  void changeFontSize(mysize) {
    widgetsData['args']['style']['fontSize'] = mysize;
  }

  void changeFontFamily(myfontfamily) {
    widgetsData['args']['style']['fontFamily'] = myfontfamily;
  }

  void changeFontWeight(myfontweight) {
    widgetsData['args']['style']['fontWeight'] = myfontweight;
  }

  MyService code = MyService();
  List<TextClass> _textClass = [TextClass(start: 5)];
  Color _color = Colors.black;
  double _horizontalSliderValue = 0;
  double _verticalSliderValue = 0;
  var _verticalControler = TextEditingController();
  var _horizontalControler = TextEditingController();
  List _dropDownFontList = [
    "Arial",
    "Helvetica",
    "Times New Roman",
    "Courier New",
    "Comic Sans MS",
    "Impact",
    "Georgia",
    "Lucida Sans Unicode",
    "Tahoma",
    "Trebuchet MS",
    "Verdana"
  ];
  List _dropDownFontWeightList = [
    "w100",
    "w200",
    "w300",
    "w400",
    "w500",
    "w600",
    "w700",
    "w800",
    "w900",
    "bold",
  ];
  List _dropDownFontStyleList = ["normal", "italic"];
  List _dropDownTextDecorationList = [
    "none",
    "underline",
    "overline",
    "lineThrough"
  ];

  String _selectedFont = "Arial";
  String _selectedFontWeight = "w400";
  String _selectedFontStyle = "normal";
  String _selectedTextDecoration = "none";
  List<bool> _selectionTextAlignList = [true, false, false];

  @override
  Widget build(BuildContext context) {
    print(_textClass[0].start);

    return Container(
      width: 280,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Text Properties',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
              Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Value',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 0.5,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      onChanged: (text) {
                        context.read<MyTextProvider>().setText(text);
                        // TextClass.setText(text);
                        // setState(() {
                        //   code.myVariable = _textClass[0].generateCode();
                        // });
                        // widget.onChangedText?.call(text);
                      },
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "text",
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                  ),
                  Text(
                    'Font Family',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 40,
                      width: 280,
                      child: DropdownButton(
                        isExpanded: true,
                        value: _selectedFont,
                        focusColor: Colors.transparent,
                        elevation: 0,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        icon: Icon(Icons.keyboard_arrow_down),
                        dropdownColor: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        underline: Container(),
                        items: _dropDownFontList.map((item) {
                          return DropdownMenuItem(
                            child: Text(item),
                            value: item,
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          context
                              .read<MyTextProvider>()
                              .setFontFamily(newValue.toString());
                          setState(() {
                            _selectedFont = newValue.toString();
                          });
                        },
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Font Decoration',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: 180,
                              margin: EdgeInsets.only(top: 8),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5, color: Colors.black),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Container(
                                height: 40,
                                child: DropdownButton(
                                  isExpanded: true,
                                  value: _selectedTextDecoration,
                                  focusColor: Colors.transparent,
                                  elevation: 0,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  icon: Icon(Icons.keyboard_arrow_down),
                                  dropdownColor: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  underline: Container(),
                                  items:
                                      _dropDownTextDecorationList.map((item) {
                                    return DropdownMenuItem(
                                      child: Text(item),
                                      value: item,
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    context
                                        .read<MyTextProvider>()
                                        .setDecoration(newValue.toString());
                                    setState(() {
                                      _selectedTextDecoration =
                                          newValue.toString();
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Font Size',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                            Container(
                              height: 40,
                              width: 90,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              margin: EdgeInsets.only(top: 8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  hintText: "16",
                                  hintStyle: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                  ),
                                  border: InputBorder.none,
                                ),
                                onChanged: (value) {
                                  context
                                      .read<MyTextProvider>()
                                      .setSize(double.parse(value));
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 180,
                        margin: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Font Weight',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  width: 85,
                                  margin: EdgeInsets.only(top: 8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5, color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Container(
                                    height: 40,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      value: _selectedFontWeight,
                                      focusColor: Colors.transparent,
                                      elevation: 0,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      dropdownColor: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      underline: Container(),
                                      items:
                                          _dropDownFontWeightList.map((item) {
                                        return DropdownMenuItem(
                                          child: Text(item),
                                          value: item,
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        setState(() {
                                          context
                                              .read<MyTextProvider>()
                                              .setFontWeight(
                                                  newValue.toString());
                                          _selectedFontWeight =
                                              newValue.toString();
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Font Style',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  width: 85,
                                  margin: EdgeInsets.only(top: 8),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.5, color: Colors.black),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Container(
                                    height: 40,
                                    child: DropdownButton(
                                      isExpanded: true,
                                      value: _selectedFontStyle,
                                      focusColor: Colors.transparent,
                                      elevation: 0,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      dropdownColor: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      underline: Container(),
                                      items: _dropDownFontStyleList.map((item) {
                                        return DropdownMenuItem(
                                          child: Text(item),
                                          value: item,
                                        );
                                      }).toList(),
                                      onChanged: (newValue) {
                                        context
                                            .read<MyTextProvider>()
                                            .setFontStyle(newValue.toString());
                                        setState(() {
                                          _selectedFontStyle =
                                              newValue.toString();
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 40),
                        child: ToggleButtons(
                          constraints: BoxConstraints(
                            minWidth: 29,
                            maxWidth: 29,
                            minHeight: 40,
                          ),
                          color: Colors.grey[400],
                          selectedColor: Colors.black,
                          children: [
                            Icon(
                              Icons.format_align_left,
                              size: 20,
                            ),
                            Icon(
                              Icons.format_align_center,
                              size: 20,
                            ),
                            Icon(
                              Icons.format_align_right,
                              size: 20,
                            ),
                          ],
                          isSelected: _selectionTextAlignList,
                          onPressed: (int index) {
                            switch (index) {
                              case 0:
                                context.read<MyTextProvider>().setAlign("left");
                                break;
                              case 1:
                                context
                                    .read<MyTextProvider>()
                                    .setAlign("center");
                                break;
                              case 2:
                                context
                                    .read<MyTextProvider>()
                                    .setAlign("right");
                                break;
                            }
                            setState(() {
                              for (int buttonIndex = 0;
                                  buttonIndex < _selectionTextAlignList.length;
                                  buttonIndex++) {
                                if (buttonIndex == index) {
                                  _selectionTextAlignList[buttonIndex] = true;
                                } else {
                                  _selectionTextAlignList[buttonIndex] = false;
                                }
                              }
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              )),
          Container(
            margin: EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Font Color',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                      fontWeight: FontWeight.w500),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 230,
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      margin: EdgeInsets.only(top: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "#",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                width: 150,
                                padding: EdgeInsets.only(bottom: 2.5),
                                child: TextField(
                                  controller: TextEditingController(
                                      text: _color
                                          .toString()
                                          .replaceAll("Color(", "")
                                          .replaceAll(")", "")),
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  onChanged: (String Value) {
                                    Color color = Color(int.parse(Value));
                                    context
                                        .read<MyTextProvider>()
                                        .setColor("00ffff");
                                    if (Value.length == 10) {
                                      setState(() {
                                        _color = Color(int.parse(Value));
                                      });
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: _color,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          icon: Icon(
                            Icons.color_lens,
                            size: 25,
                          ),
                          onPressed: () {
                            pickColor(context);
                          },
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void pickColor(BuildContext context) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              "Pick Your Color",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            content: Container(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildColorPicker(),
                  TextButton(
                    child: Text(
                      "Select",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ));

  Widget buildColorPicker() => ColorPicker(
        colorPickerWidth: 300,
        onColorChanged: (Color value) {
          setState(() {
            _color = value;
          });
          context
              .read<MyTextProvider>()
              .setColor(value.value.toRadixString(16));
        },
        pickerColor: _color,
      );
}
