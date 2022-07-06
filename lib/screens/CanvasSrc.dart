import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluffy/Components/CenterScreen.dart';
import 'package:fluffy/Components/CodeScreen.dart';
import 'package:fluffy/Components/ComponentList.dart';
import 'package:fluffy/Components/MyButton.dart';
import 'package:fluffy/Components/MyWidgets.dart';
import 'package:fluffy/Components/WidgetProperties.dart';
import 'package:fluffy/database/widgetsData.dart';
import 'package:fluffy/provider/MyLsitProvider.dart';
import 'package:fluffy/styles/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'Login.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class CanvasSrc extends StatefulWidget {
  const CanvasSrc({Key? key}) : super(key: key);

  @override
  State<CanvasSrc> createState() => _CanvasSrcState();
}

class _CanvasSrcState extends State<CanvasSrc> {
  List _myWidgetsTree = [];
  int? _selectedIndex;
  int sideIndex = 0;
  void logOut() {
    FirebaseAuth.instance.signOut().then((uid) => {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const LoginSrc(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return child;
              },
            ),
          )
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget leftVerticalBar() {
      switch (sideIndex) {
        case 0:
          return MyWidgets();
        case 1:
          return ComponentList(
            list: _myWidgetsTree,
            onReorder: (int oldIndex, int newIndex) {
              final index = newIndex > oldIndex ? newIndex - 1 : newIndex;
              final name = _myWidgetsTree.removeAt(oldIndex);
              setState(() {
                _myWidgetsTree.insert(index, name);
              });
            },
            onPressed: (index) {
              context.read<MyListProvider>().removeWidget(index);
              setState(() {
                _myWidgetsTree.removeAt(index);
              });
            },
          );
        case 2:
          return CodeScreen();
        default:
          return Container();
      }
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(children: [
            Container(
              width: size.width,
              height: size.height,
              child: Row(
                children: [
                  Container(
                    height: size.height,
                    padding: const EdgeInsets.only(top: 80),
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xFFF7F7F7),
                      border: Border(
                          right: BorderSide(color: Colors.black, width: 0.3)),
                    ),
                    child: Container(
                      padding: EdgeInsets.only(top: 40, bottom: 20),
                      width: double.infinity,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  IconButton(
                                      padding: const EdgeInsets.all(0),
                                      onPressed: () {
                                        if (sideIndex != 0) {
                                          setState(() {
                                            sideIndex = 0;
                                          });
                                        }
                                      },
                                      color: sideIndex == 0
                                          ? Primary_Color
                                          : Colors.grey[400],
                                      icon: const Icon(
                                        Icons.layers,
                                        size: 40,
                                      )),
                                  const Padding(
                                      padding: EdgeInsets.only(
                                    bottom: 18,
                                  )),
                                  IconButton(
                                      padding: const EdgeInsets.all(0),
                                      onPressed: () {
                                        if (sideIndex != 1) {
                                          setState(() {
                                            sideIndex = 1;
                                          });
                                        }
                                      },
                                      color: sideIndex == 1
                                          ? Primary_Color
                                          : Colors.grey[400],
                                      icon: const Icon(
                                        Icons.line_style,
                                        size: 30,
                                      )),
                                  const Padding(
                                      padding: EdgeInsets.only(
                                    bottom: 18,
                                  )),
                                  IconButton(
                                      padding: const EdgeInsets.all(0),
                                      onPressed: () {
                                        if (sideIndex != 2) {
                                          setState(() {
                                            sideIndex = 2;
                                          });
                                        }
                                      },
                                      color: Colors.grey[400],
                                      icon: const Icon(
                                        Icons.code,
                                        size: 30,
                                      )),
                                  const Padding(
                                      padding: EdgeInsets.only(
                                    bottom: 18,
                                  )),
                                  IconButton(
                                      padding: const EdgeInsets.all(0),
                                      onPressed: () {},
                                      color: Colors.grey[400],
                                      icon: const Icon(
                                        Icons.photo_library,
                                        size: 30,
                                      )),
                                ]),
                            IconButton(
                                padding: const EdgeInsets.all(0),
                                onPressed: () {},
                                color: Primary_Color_Dark,
                                icon: const Icon(
                                  Icons.settings,
                                  size: 30,
                                )),
                          ]),
                    ),
                  ),
                  sideIndex == 2 ? Expanded(child: CodeScreen()) : Container(),
                  sideIndex != 2
                      ? Container(
                          padding: const EdgeInsets.only(top: 80),
                          height: size.height,
                          color: Colors.white,
                          width: 350,
                          child: leftVerticalBar())
                      : Container(),
                  sideIndex != 2
                      ? Container(
                          height: size.height,
                          padding: const EdgeInsets.only(top: 80),
                          width: size.width - 700 - 80,
                          color: Color(0xFFE4E4E4),
                          child: CenterScreen(
                            onChanged: (value) {
                              final name = widgetsData[value - 1]["name"];
                              int count = 0;
                              _myWidgetsTree.forEach((element) {
                                if (element["name"].toString() ==
                                    name.toString()) {
                                  count = int.parse(element["count"]) + 1;
                                }
                              });
                              setState(() {
                                _selectedIndex = value;
                                _myWidgetsTree.add({
                                  "name": name.toString(),
                                  "count": count.toString()
                                });
                              });
                            },
                          ),
                        )
                      : Container(),
                  sideIndex != 2
                      ? Container(
                          height: size.height,
                          padding: const EdgeInsets.only(top: 80),
                          width: 350,
                          color: Color(0xFFF7F7F7),
                          child: WidgetProperties(
                            value: _selectedIndex ?? -1,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              height: 70,
              child: Stack(children: [
                Positioned(
                  left: 20,
                  top: 16,
                  child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        minimumSize: Size(50, 50),
                        maximumSize: Size(50, 50),
                        padding: EdgeInsets.all(0),
                      ),
                      child: Icon(
                        Icons.home,
                        color: Colors.grey,
                        size: 38,
                      )),
                ),
                Positioned(
                  left: 100,
                  right: 80,
                  child: Container(
                      width: size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 140,
                                child:
                                    SvgPicture.asset('assets/images/logo.svg'),
                              ),
                            ],
                          ),
                          // ignore: prefer_const_constructors

                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 12),
                                child: TextButton(
                                    onPressed: () {},
                                    style: TextButton.styleFrom(
                                        backgroundColor: Primary_Color,
                                        minimumSize: Size(50, 50),
                                        maximumSize: Size(50, 50),
                                        padding: EdgeInsets.all(0),
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(50)),
                                        )),
                                    child:
                                        Icon(Icons.code, color: Colors.white)),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                      backgroundColor: Primary_Color,
                                      minimumSize: Size(50, 50),
                                      maximumSize: Size(50, 50),
                                      padding: EdgeInsets.all(0),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50)),
                                      )),
                                  child: Icon(Icons.play_arrow_rounded,
                                      color: Colors.white)),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 25),
                                child: MyButton(
                                  label: "Share",
                                  onPressed: () {},
                                  textColor: Colors.white,
                                  color: Primary_Color_Dark,
                                  fontSize: 16,
                                  width: 100,
                                  height: 50,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  logOut();
                                },
                                style: TextButton.styleFrom(
                                    backgroundColor: Primary_Color_Light,
                                    minimumSize: Size(45, 45),
                                    maximumSize: Size(45, 45),
                                    padding: EdgeInsets.all(0),
                                    primary: Primary_Color_Light,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    )),
                                child: Image.asset('assets/images/user.png'),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              ]),
            )
          ]),
        ),
      ),
    );
  }
}
