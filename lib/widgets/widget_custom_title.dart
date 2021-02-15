import 'package:art_gallery_auction/utils/design_guide.dart';
import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  String title;
  Color textColor;
  Color backgroundColor;

  CustomTitle(
      {@required this.title,
      @required this.textColor,
      @required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: designColorBrightGrey,
          ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
        child: Row(children: [
          Text(
            " ${title}",
            style: TextStyle(
                color: textColor, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
