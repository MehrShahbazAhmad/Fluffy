import 'package:fluffy/OutputCode/GenrateCode.dart';
import 'package:fluffy/WidgetClasses/TextClass.dart';
import 'package:fluffy/provider/MyTextProvider.dart';
import 'package:flutter/material.dart';
import 'package:json_dynamic_widget/json_dynamic_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class CenterScreen extends StatefulWidget {
  final ValueSetter<int>? onChanged;
  final String? myText;
  const CenterScreen({Key? key, this.onChanged, this.myText}) : super(key: key);

  @override
  State<CenterScreen> createState() => _CenterScreenState();
}

class _CenterScreenState extends State<CenterScreen> {
  List<Widget> adds = [];
  ScrollController _scrollController = ScrollController();

  scrollToBottom() async {
    WidgetsBinding.instance!.addPostFrameCallback(
      (_) => _scrollController.jumpTo(
        _scrollController.position.maxScrollExtent,
      ),
    );
  }

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
  var registory = JsonWidgetRegistry.instance;
  @override
  Widget build(BuildContext context) {
    // useEffect(() {
    //   print("text:" + TextClass.text);
    // }, [TextClass.text]);
    var textWidgets = JsonWidgetData.fromDynamic(
        context.watch<MyTextProvider>().widgetsData,
        registry: registory);
    Widget rowWidget = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        styleText("I'm"),
        styleText("Row"),
        styleText("Widget"),
      ],
    );

    print("text:" + TextClass.text);
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${context.watch<MyTextProvider>().text}'),
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
                      child: Expanded(
                        child: Container(
                          child: RawScrollbar(
                            thickness: 4,
                            thumbColor: Colors.indigo,
                            radius: Radius.circular(15),
                            child: SingleChildScrollView(
                              controller: _scrollController,
                              child: textWidgets!.build(context: context),
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ));
                },
                onAccept: (int data) {
                  widget.onChanged?.call(data);
                  switch (data) {
                    case 14:
                      adds.add(containerWidget);
                      scrollToBottom();
                      setState(() {});
                      break;
                    case 1:
                      // adds.add(textWidgets!.build(context: context));

                      scrollToBottom();
                      setState(() {});
                      break;
                    case 15:
                      adds.add(columnWidget);
                      scrollToBottom();
                      setState(() {});
                      break;
                    case 16:
                      adds.add(rowWidget);
                      scrollToBottom();
                      setState(() {});
                      break;
                    case -1:
                      if (adds.length > 0) {
                        adds[0] = rowWidget;
                        scrollToBottom();
                        setState(() {});
                      }
                      break;
                    case -2:
                      if (adds.length > 0) {
                        adds.removeAt(0);
                        scrollToBottom();
                        setState(() {});
                      }
                      break;
                  }
                },
              ),
            ))
          ]),
    );
  }

  Widget containerWidget = Padding(
    padding: EdgeInsets.symmetric(vertical: 20),
    child: Container(
      height: 30,
      width: double.infinity,
      color: Colors.indigoAccent,
    ),
  );

  Widget textWidget = Padding(
    padding: EdgeInsets.symmetric(vertical: 30),
    child: Text(
      "I'm Text Widget",
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.indigo.shade600,
      ),
    ),
  );

  Widget columnWidget = Padding(
    padding: EdgeInsets.symmetric(vertical: 30),
    child: Column(
      children: [
        Text(
          "I'm",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.indigo.shade600,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Column",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.indigo.shade600,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Widget",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.indigo.shade600,
          ),
        ),
      ],
    ),
  );

  Widget styleText(text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.indigo.shade600,
      ),
    );
  }
}
