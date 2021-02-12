import 'package:art_gallery_auction/utils/design_guide.dart';
import 'package:flutter/material.dart';

class HorizontalListview extends StatefulWidget {
  List<String> items;

  HorizontalListview({@required this.items});

  @override
  _HorizontalListviewState createState() => _HorizontalListviewState();
}

class _HorizontalListviewState extends State<HorizontalListview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
          shrinkWrap: true,
          reverse: false,
          itemCount: widget.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return InkWell(
              highlightColor: Colors.blueAccent,
              child: Card(
                elevation: 1,
                shadowColor: designColorGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(widget.items[index], fit: BoxFit.cover),
                ),
              ),
              onTap: (){},
            );
          }),
    );
  }
}
