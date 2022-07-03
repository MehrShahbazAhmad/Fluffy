import 'package:fluffy/Components/WidgetBTN.dart';
import 'package:fluffy/database/widgetsData.dart';
import 'package:fluffy/styles/theme.dart';
import 'package:flutter/material.dart';

import 'SearchBar.dart';

class MyWidgets extends StatelessWidget {
  const MyWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          SearchBar(hint: "Search Widget", icon: Icon(Icons.search)),
          Container(
            child: Container(
              padding: EdgeInsets.only(top: 80),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(
                        "Widgets",
                        style: TextStyle(
                          fontFamily: "Cocogoose",
                          fontSize: 25,
                          color: Primary_Color,
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: ListView.builder(
                          padding: EdgeInsets.only(
                              left: 20, right: 20, top: 5, bottom: 30),
                          // This creates two columns with two items in each column
                          itemCount: widgetsCategory.length,
                          itemBuilder: (BuildContext context, int index) {
                            List _temp;
                            _temp = widgetsData
                                .where((val) => val['CategoryId'] == index + 1)
                                .toList();
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 25, bottom: 8),
                                  child: Text(
                                    widgetsCategory[index],
                                    style: TextStyle(
                                        color: Primary_Color_Dark,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 14),
                                  ),
                                ),
                                GridView.count(
                                  crossAxisCount: 3,
                                  shrinkWrap: true,
                                  primary: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  children:
                                      List.generate(_temp.length, (index) {
                                    return Center(
                                        child: WidgetBTN(
                                      value: _temp[index]['id'],
                                      title: _temp[index]["name"].toString(),
                                      icon: _temp[index]["icon"].toString(),
                                    ));
                                  }),
                                ),
                              ],
                            );
                          }),
                    ))
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
