import 'dart:ui';

import 'package:fluffy/Components/MyButton.dart';
import 'package:fluffy/Components/MyIconButton.dart';
import 'package:fluffy/Components/MyLabelInput.dart';
import 'package:fluffy/screens/CanvasSrc.dart';
import 'package:fluffy/styles/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewProject extends StatelessWidget {
  final Function onClose;
  const NewProject({Key? key, required this.onClose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
          ),
          child: Center(
            child: Container(
              width: 700,
              height: 700,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(children: [
                Positioned(
                  right: 0,
                  child: Container(
                    margin: EdgeInsets.all(25),
                    width: 35,
                    height: 35,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        )),
                    child: IconButton(
                      icon: Icon(
                        Icons.close_outlined,
                        color: Colors.black,
                        size: 20,
                      ),
                      onPressed: () {
                        onClose();
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 80),
                  padding: EdgeInsets.symmetric(horizontal: 70),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 90),
                        child: Text("New Project",
                            style: TextStyle(
                              fontSize: 32,
                              fontFamily: "Cocogoose",
                              color: Primary_Color,
                            )),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          MyLabelInput(
                            label: "Project Name",
                            width: 270,
                          ),
                          MyLabelInput(
                            label: "Project Type",
                            width: 270,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MyLabelInput(label: "Add Screen"),
                          Container(
                            margin: EdgeInsets.only(bottom: 12),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              color: Primary_Color,
                              minWidth: 70,
                              padding: EdgeInsets.symmetric(vertical: 27),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          MyLabelInput(label: "Add Member"),
                          Container(
                            margin: EdgeInsets.only(bottom: 12),
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              color: Primary_Color,
                              minWidth: 70,
                              padding: EdgeInsets.symmetric(vertical: 27),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 40),
                        child: MyButton(
                          label: "Create",
                          onPressed: () {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation, secondaryAnimation) =>
                                        const CanvasSrc(),
                                transitionsBuilder: (context, animation,
                                    secondaryAnimation, child) {
                                  return child;
                                },
                              ),
                            );
                          },
                          color: Primary_Color,
                          textColor: Colors.white,
                          roundness: 10,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
                )
              ]),
            ),
          ),
        ),
      );
    }
  }
}
