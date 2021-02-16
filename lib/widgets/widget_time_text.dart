import 'package:flutter/material.dart';

class TimeText extends StatelessWidget {
  String title;
  String value;

  TimeText({@required this.title, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(title)),
        Expanded(flex: 3, child: Text(value, textAlign: TextAlign.end)),
      ],
    );
  }
}
