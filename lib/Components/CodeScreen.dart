import 'package:flutter/material.dart';

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
              alignment: Alignment(-1, -1),
              child: Text(
                "Code",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment(1, -1),
              child: IconButton(
                icon: Icon(Icons.copy),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
