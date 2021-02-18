import 'package:art_gallery_auction/utils/enums.dart';
import 'package:art_gallery_auction/widgets/widget_home_view.dart';
import 'package:flutter/material.dart';

class HomeGeneralPage extends StatefulWidget {
  @override
  _HomeGeneralPageState createState() => _HomeGeneralPageState();
}

class _HomeGeneralPageState extends State<HomeGeneralPage> {


  String pickerValue = "select";


  @override
  Widget build(BuildContext context) {
    return HomeView(salesType: SalesType.general,);
  }

}
//
// showModalBottomSheet(
// backgroundColor: Color.fromARGB(0, 255, 255, 255),
// isScrollControlled: false,
// context: context,
// builder: (context) {
// return Container(
// decoration: BoxDecoration(
// color: Colors.lightBlueAccent,
// borderRadius: BorderRadius.only(
// topLeft: Radius.circular(30),
// topRight: Radius.circular(30)),
// ),
// height: 400,
// child: Column(
// children: [Text("test1"), Text("Test2")],
// ),
// );
// });
