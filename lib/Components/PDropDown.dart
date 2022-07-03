import 'package:flutter/material.dart';

class PDropDown extends StatelessWidget {
  final String label;
  final double? height;
  final double? width;
  final ValueChanged? onChanged;
  final List<String> dropDownList;
  final String? selected;
  const PDropDown({
    Key? key,
    required this.label,
    this.height,
    this.width,
    this.onChanged,
    required this.dropDownList,
    this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
                fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
                border: Border.all(width: 0.5, color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: height ?? 40,
              width: width ?? double.infinity,
              child: DropdownButton(
                isExpanded: true,
                value: selected,
                focusColor: Colors.transparent,
                elevation: 0,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                icon: Icon(Icons.keyboard_arrow_down),
                dropdownColor: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
                underline: Container(),
                items: dropDownList.map((item) {
                  return DropdownMenuItem(
                    child: Text(item),
                    value: item,
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
