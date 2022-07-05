import 'package:flutter/material.dart';

class MyTextProvider extends ChangeNotifier {
  String _text = 'Hello World';

  String get text => _text;

  void setText(String text) {
    print(text);
    _text = text;
    notifyListeners();
  }
}
