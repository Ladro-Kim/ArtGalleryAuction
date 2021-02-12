import 'package:flutter/material.dart';

class TitleAndDropdown extends StatefulWidget {
  String title;
  List<DropdownMenuItem> items;
  Color color;
  Icon icon;

  TitleAndDropdown({@required this.title, @required this.items, @required this.color, @required this.icon});

  @override
  _TitleAndDropdownState createState() => _TitleAndDropdownState();
}

class _TitleAndDropdownState extends State<TitleAndDropdown> {
  String selectedItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(" ${widget.title}",
              style: TextStyle(
                  color: widget.color,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
          Expanded(
              child: Text("")),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: widget.icon,
          ),
          DropdownButton(
            value: selectedItem,
            items: widget.items,
            onChanged: (index) {
              setState(() {
                selectedItem = widget.items[index].value;
              });
            },
          ),
        ],
      ),
    );
  }
}
