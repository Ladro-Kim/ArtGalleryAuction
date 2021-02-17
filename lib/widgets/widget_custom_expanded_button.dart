import 'package:flutter/material.dart';

class CustomExpandedButton extends StatelessWidget {
  IconData icon;
  String content;
  Color _color = Colors.blue;

  CustomExpandedButton({@required this.icon, @required  this.content});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Expanded(flex: 1, child: Container(alignment: Alignment.center, child: Icon(icon, color: _color))),
          Expanded(flex: 8, child: Text("  ${content}", style: TextStyle(color: _color),)),
        ],
      ),
    );
  }
}
