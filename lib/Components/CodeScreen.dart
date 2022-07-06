import 'package:fluffy/provider/MyLsitProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluffy/provider/MyLsitProvider.dart';
import 'package:clipboard/clipboard.dart';

class CodeScreen extends StatefulWidget {
  const CodeScreen({Key? key}) : super(key: key);

  @override
  State<CodeScreen> createState() => _CodeScreenState();
}

class _CodeScreenState extends State<CodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 120, left: 60, right: 60, bottom: 60),
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              alignment: Alignment(-1, -1),
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Text(
                    context.read<MyListProvider>().code,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment(1, -1),
              child: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {
                  var temp = context.read<MyListProvider>().code;
                  FlutterClipboard.copy(temp).then((temp) => print('copied'));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
