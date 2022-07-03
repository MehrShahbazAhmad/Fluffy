import 'dart:async';
import 'dart:io';

import 'package:fluffy/OutputCode/GenrateCode.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextClass {
  int start;
  int? end;
  String text = "";
  double fontSize = 12;
  String textCode = '''
  Text(
    '',
  )
  ''';
  TextClass({required this.start});
  void setText(String text) {
    this.text = text;
    generateCode();
  }

  void setFontSize(String text) {
    this.fontSize = double.parse(text);
    generateCode();
  }

  static Future<String> _getLocalPath() async {
    Directory directory = await getApplicationDocumentsDirectory();
    print(directory.path);
    return directory.path;
  }

  static Future<File> _getLocalFile() async {
    final localPath = await _getLocalPath();
    return File('$localPath/myText.txt');
  }

  String generateCode() {
    textCode = '''
    Text(
      '$text',
      style: TextStyle(
        fontSize: ${fontSize},
      ),
    )
    ''';
    return textCode;
    // print(textCode);
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('textCode', textCode);
    // await file.writeAsString(textCode);
    // myFile.writeAsStringSync(textCode);
  }
}
