import 'package:fluffy/screens/Login.dart';
import 'package:fluffy/screens/SignUp.dart';
import 'package:fluffy/styles/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fluffy',
      theme: ThemeData(
        primaryColor: Primary_Color,
      ),
      home: LoginSrc(),
    );
  }
}
