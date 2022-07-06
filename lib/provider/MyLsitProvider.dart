import 'package:flutter/material.dart';

class MyListProvider extends ChangeNotifier {
  List _addedWidgets = <Map>[];
  int _index = -1;
  int _currentIndex = 0;
  List get addedWidgets => _addedWidgets;
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
}
