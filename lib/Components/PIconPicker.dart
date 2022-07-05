import 'package:fluffy/Components/PInputFeild.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_iconpicker/flutter_iconpicker.dart';

class PIconPicker extends StatelessWidget {
  final Icon? icon;
  final ValueSetter<Icon>? onChanged;
  final String label;
  const PIconPicker({Key? key, this.icon, this.onChanged, required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Future<Icon> _pickIcon() async {
    //   IconData? icon = await FlutterIconPicker.showIconPicker(context,
    //       iconPackModes: [IconPack.cupertino]);
    //   return Icon(icon);
    // }

    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 40,
              width: 190,
              child: TextButton.icon(
                onPressed: () async {
                  // Icon? ico = await _pickIcon();
                  // onChanged?.call(ico);
                },
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                label:
                    icon != null ? Text(icon!.icon.toString()) : Text("none"),
                icon: Icon(icon?.icon ?? Icons.add),
              ),
            ),
          ],
        ),
      ),
      PInputFeild(width: 80, label: "Size", keyboardType: TextInputType.number),
    ]);
  }
}
