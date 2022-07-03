import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PBorder extends StatelessWidget {
  final String label;
  final String? top;
  final String? bottom;
  final String? left;
  final String? right;
  final double? width;
  final double? height;
  final ValueChanged? onTopChanged;
  final ValueChanged? onBottomChanged;
  final ValueChanged? onLeftChanged;
  final ValueChanged? onRightChanged;
  const PBorder(
      {Key? key,
      this.top,
      this.bottom,
      this.left,
      this.right,
      this.width,
      this.height,
      this.onTopChanged,
      this.onBottomChanged,
      this.onLeftChanged,
      this.onRightChanged,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 280,
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  width: height ?? 40,
                  height: height ?? 40,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: TextEditingController(text: top),
                    onChanged: onTopChanged,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                    keyboardType: TextInputType.number,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "T",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  width: height ?? 40,
                  height: height ?? 40,
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: TextEditingController(text: bottom),
                    onChanged: onBottomChanged,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                    keyboardType: TextInputType.number,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "B",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  width: height ?? 40,
                  height: height ?? 40,
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: TextEditingController(text: left),
                    onChanged: onLeftChanged,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                    keyboardType: TextInputType.number,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "L",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Container(
                  width: height ?? 40,
                  height: height ?? 40,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextField(
                    controller: TextEditingController(text: right),
                    onChanged: onRightChanged,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[0-9.,]')),
                    ],
                    keyboardType: TextInputType.number,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "R",
                      hintStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.grey[400],
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                      size: 25,
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
