import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class PColorPicker extends StatelessWidget {
  final String label;
  final double? height;
  final double? width;
  final ValueChanged<String>? onChanged;
  final Color? color;
  final ValueChanged<Color>? onColorChanged;
  const PColorPicker({
    Key? key,
    required this.label,
    this.height,
    this.width,
    this.onChanged,
    this.color,
    this.onColorChanged,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: height ?? 40,
                width: width ?? 230,
                padding: EdgeInsets.symmetric(horizontal: 10),
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "#",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Container(
                          width: 150,
                          padding: EdgeInsets.only(bottom: 2.5),
                          child: TextField(
                            controller: TextEditingController(
                                text: color
                                    .toString()
                                    .replaceAll("Color(", "")
                                    .replaceAll(")", "")),
                            textAlignVertical: TextAlignVertical.center,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                              border: InputBorder.none,
                            ),
                            onChanged: onChanged,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  height: height ?? 40,
                  width: height ?? 40,
                  margin: EdgeInsets.only(top: 8),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: IconButton(
                    icon: Icon(
                      Icons.color_lens,
                      size: 25,
                    ),
                    onPressed: () => pickColor(context, onColorChanged),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  void pickColor(BuildContext context, onColorChanged) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              "Pick Your Color",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            content: Container(
              height: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  buildColorPicker(onColorChanged, color),
                  TextButton(
                    child: Text(
                      "Select",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ));

  Widget buildColorPicker(onColorChanged, color) => ColorPicker(
        colorPickerWidth: 300,
        onColorChanged: onColorChanged,
        pickerColor: color,
      );
}
