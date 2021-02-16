import 'package:art_gallery_auction/class/item.dart';
import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  bool switchValue;
  String title;
  String falseText;
  String trueText;

  CustomSwitch(
      {@required this.switchValue,
      @required this.title,
      @required this.falseText,
      @required this.trueText});

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(flex: 1, child: Text(widget.title)),
        Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(flex: 2, child: Text(widget.falseText, textAlign: TextAlign.end)),
                Expanded(
                  flex: 1,
                  child: Switch(
                      value: widget.switchValue,
                      onChanged: (value) {
                        setState(() {
                          widget.switchValue = value;
                        });
                      }),
                ),
                Expanded(flex: 2,child: Text(widget.trueText, textAlign: TextAlign.start,)),
              ],
            )),
      ],
    );
  }
}
