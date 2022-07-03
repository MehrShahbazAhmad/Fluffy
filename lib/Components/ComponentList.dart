import 'package:flutter/material.dart';

class ComponentList extends StatelessWidget {
  final List list;
  final onReorder;
  final onPressed;
  const ComponentList(
      {Key? key,
      required this.list,
      required this.onReorder,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ReorderableListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 20),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            key: ValueKey(list[index]["name"] + list[index]["count"]),
            child: ListTile(
                title: Text(list[index]["name"] + "-" + list[index]["count"]),
                leading: IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    onPressed(index);
                  },
                )),
          );
        },
        onReorder: onReorder,
      ),
    );
  }
}
