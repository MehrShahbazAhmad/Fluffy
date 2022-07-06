import 'dart:html';

import 'package:flutter/material.dart';

class MyTextProvider extends ChangeNotifier {
  String _text = 'Hello World';
  String _color = 'Hello World';
  double _size = 12.0;
  String _fontFamily = 'Hello World';
  String _fontWeight = 'Hello World';

  Map _widgetsData = {
    "type": "text",
    "args": {
      "text": "I'm a Text Widget",
      "style": {
        "align": "left",
        "color": "0xff000000",
        "fontSize": 20,
        "fontStyle": "normal",
        "fontWeight": "w400",
        "fontFamily": "Arial",
        "decoration": "none",
      }
    }
  };

  String get text => _text;
  String get color => _color;
  double get size => _size;
  String get fontFamily => _fontFamily;
  String get fontWeight => _fontWeight;
  String get align => _widgetsData['args']['align'];
  Map get widgetsData => _widgetsData;

  void setText(String text) {
    print(text);
    _text = text;
    _widgetsData['args']['text'] = text;
    notifyListeners();
  }

  void reset() {
    _widgetsData = {
      "type": "text",
      "args": {
        "text": "I'm a Text Widget",
        "style": {
          "align": "left",
          "color": "0xff000000",
          "fontSize": 20,
          "fontStyle": "normal",
          "fontWeight": "w400",
          "fontFamily": "Arial",
          "decoration": "none",
        }
      }
    };
    notifyListeners();
  }

  void setAlign(String text) {
    print(text);
    _text = text;
    _widgetsData['args']['style']['align'] = text;
    notifyListeners();
  }

  void setColor(String color) {
    print(text);
    _color = color;
    _widgetsData['args']['style']['color'] = color;
    notifyListeners();
  }

  void setFontStyle(String style) {
    print(text);
    _color = color;
    _widgetsData['args']['style']['fontStyle'] = style;
    notifyListeners();
  }

  void setDecoration(String style) {
    print(text);
    _color = color;
    _widgetsData['args']['style']['decoration'] = style;
    notifyListeners();
  }

  void setSize(double size) {
    print(text);
    _size = size;
    _widgetsData['args']['style']['fontSize'] = size;
    notifyListeners();
  }

  void setFontFamily(String fontFamily) {
    print(text);
    _fontFamily = fontFamily;
    _widgetsData['args']['style']['fontFamily'] = fontFamily;
    notifyListeners();
  }

  void setFontWeight(String fontWeight) {
    print(text);
    _fontWeight = fontWeight;
    _widgetsData['args']['style']['fontWeight'] = fontWeight;
    notifyListeners();
  }
}
