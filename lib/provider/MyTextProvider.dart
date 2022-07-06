import 'dart:ffi';
import 'dart:html';

import 'package:flutter/material.dart';

class MyTextProvider extends ChangeNotifier {
  String _text = 'Hello World';
  String _color = 'Hello World';
  double _size = 12.0;
  String _fontFamily = 'Hello World';
  String _fontWeight = 'Hello World';

  String get text => _text;
  String get color => _color;
  double get size => _size;
  String get fontFamily => _fontFamily;
  String get fontWeight => _fontWeight;

  void setText(String text) {
    print(text);
    _text = text;
    notifyListeners();
  }

  void setColor(String color) {
    print(text);
    _color = color;
    notifyListeners();
  }

  void setSize(double size) {
    print(text);
    _size = size;
    notifyListeners();
  }

  void setFontFamily(String fontFamily) {
    print(text);
    _fontFamily = fontFamily;
    notifyListeners();
  }

  void setFontWeight(String fontWeight) {
    print(text);
    _fontWeight = fontWeight;
    notifyListeners();
  }
}
