import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluffy/WidgetsComponents/MyText.dart';
import 'package:fluffy/provider/MyTextProvider.dart';
import 'package:fluffy/screens/CanvasSrc.dart';
import 'package:fluffy/screens/DashBoard.dart';
import 'package:fluffy/screens/Login.dart';
import 'package:fluffy/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => MyTextProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool show = false;
  bool _isLoagin = true;
  // This widget is the root of your application.
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        if (user == null) {
          _isLoagin = false;
        } else {
          print('User is signed in!');
        }
        show = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fluffy',
      theme: ThemeData(
        primaryColor: Primary_Color,
      ),
      home: show
          ? _isLoagin
              ? CanvasSrc()
              : LoginSrc()
          : Container(),
    );
  }
}
