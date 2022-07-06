import 'package:flutter/material.dart';

class MyListProvider extends ChangeNotifier {
  List _addedWidgets = <Map>[];
  int _index = -1;
  int _currentIndex = 0;
  List get addedWidgets => _addedWidgets;
  String _code = '';
  String get code => _code;

  String getWidgetString() {
    String t2 = '';
    if( _addedWidgets.length == 0)
    {
      t2 =
'       //Your widgets are added here\n';
    }
    else
    {
      for (var i = 0; i < _addedWidgets.length; i++) {
      String t1 =
'''
      Text(
        "${_addedWidgets[i]['args']['text']}",
        textAlign: TextAlign.${_addedWidgets[i]['args']['style']['align']},
        style: TextStyle(
          color: ${_addedWidgets[i]['args']['style']['color']},
          fontSize: ${_addedWidgets[i]['args']['style']['fontSize']},
          fontWeight: FontWeight.${_addedWidgets[i]['args']['style']['fontWeight']},
          fontFamily: ${_addedWidgets[i]['args']['style']['fontFamily']},
          fontStyle: FontStyle.${_addedWidgets[i]['args']['style']['fontStyle']},
          decoration: TextDecoration.${_addedWidgets[i]['args']['style']['decoration']}
        )
      ),
''';
      t2 = t2 + t1;
      }
    }
    return t2;
  }

  String getCode() {
    String temp2 = getWidgetString();
    String temp = '''
//Copy This file and Paste in lib/main.dart to use the Frontend Created

//Material Libarary for Flutter Provided Material
import 'package:flutter/material.dart';

//This is your main Function Which runs the App
void main() {
  runApp(const MyApp());
}

//Every Thing is a Widget
//Main Widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLUFFY WIDGET BUILDER',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

//Class which will work as Home Page
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

//Extanded class of Home Page Which is a Building Your Widget
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(children:[
${temp2}    ]);
  }
}
''';
    print(temp);
    return temp;
  }

  void addWidget(Map widgetData) {
    var tmp = {...widgetData};
    print("object: ${_addedWidgets}");
    _addedWidgets.add({
      "type": widgetData['type'],
      "args": {
        "text": widgetData['args']['text'],
        "style": {
          "align": widgetData['args']['style']['align'],
          "color": widgetData['args']['style']['color'],
          "fontSize": widgetData['args']['style']['fontSize'],
          "fontStyle": widgetData['args']['style']['fontStyle'],
          "fontWeight": widgetData['args']['style']['fontWeight'],
          "fontFamily": widgetData['args']['style']['fontFamily'],
          "decoration": widgetData['args']['style']['decoration'],
        }
      }
    });
    _index++;
    notifyListeners();
  }

  int get currentIndex => _currentIndex;
  void updateWidget(Map widgetData) {
    _addedWidgets[_index] = {
      "type": widgetData['type'],
      "args": {
        "text": widgetData['args']['text'],
        "style": {
          "align": widgetData['args']['style']['align'],
          "color": widgetData['args']['style']['color'],
          "fontSize": widgetData['args']['style']['fontSize'],
          "fontStyle": widgetData['args']['style']['fontStyle'],
          "fontWeight": widgetData['args']['style']['fontWeight'],
          "fontFamily": widgetData['args']['style']['fontFamily'],
          "decoration": widgetData['args']['style']['decoration'],
        }
      }
    };
    notifyListeners();
  }

  dynamic getWidget(int index) {
    return _addedWidgets[index];
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void removeWidget(int index) {
    _addedWidgets.removeAt(index);
    _index--;
    notifyListeners();
  }

  void getCodeShow() {
    if (_addedWidgets.length == 0) {
      _code = '//No Changes Made';
    }
    _code = getCode();
  }
}
