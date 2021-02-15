import 'package:art_gallery_auction/pages/page_detailed_item.dart';
import 'package:art_gallery_auction/utils/design_guide.dart';
import 'package:art_gallery_auction/widgets/widget_custom_title.dart';
import 'package:art_gallery_auction/widgets/widget_listview_horizontal.dart';
import 'package:art_gallery_auction/widgets/widget_sliver_persistent_header.dart';
import 'package:art_gallery_auction/widgets/widget_title_and_dropdown.dart';
import 'package:flutter/material.dart';

class HomeGeneralPage extends StatefulWidget {
  @override
  _HomeGeneralPageState createState() => _HomeGeneralPageState();
}

class _HomeGeneralPageState extends State<HomeGeneralPage> {
  List<DropdownMenuItem> _dropDownItems = [
    DropdownMenuItem(value: "Menu1", child: Text("Menu1")),
    DropdownMenuItem(value: "Menu2", child: Text("Menu2")),
    DropdownMenuItem(value: "Menu3", child: Text("Menu3")),
  ];

  List<String> _dummyImages = [
    'assets/images/image_dummy.png',
    'assets/images/image_dummy.png',
    'assets/images/image_dummy.png',
    'assets/images/image_dummy.png',
    'assets/images/image_dummy.png',
    'assets/images/image_dummy.png',
    'assets/images/image_dummy.png',
    'assets/images/image_dummy.png',
    'assets/images/image_dummy.png',
  ];

  FixedExtentScrollController pickerController;
  String pickerValue = "select";

  @override
  void initState() {
    pickerController = FixedExtentScrollController();
    super.initState();
  }

  @override
  void dispose() {
    pickerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      slivers: [
        SliverList(
            delegate: SliverChildListDelegate([
          Column(
            children: [
              CustomTitle(
                  textColor: Colors.redAccent,
                  title: "Today's Hot",
                  backgroundColor: designColorBrightGrey),
              SizedBox(height: 8),
              HorizontalListview(items: _dummyImages),
            ],
          ),
          SizedBox(height: 8),
        ])),
        SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: SliverHeader(
                minHeight: 120,
                maxHeight: 120,
                child: Container(
                  decoration: BoxDecoration(
                    color: designColorBrightGrey,
                  ),
                  child: Column(
                    children: [
                      TitleAndDropdown(
                          title: "Artworks",
                          items: _dropDownItems,
                          color: Colors.blueAccent,
                          icon: Icon(
                            Icons.sort,
                            color: Colors.grey,
                            size: 20,
                          )),
                      _buildCategories(),
                    ],
                  ),
                ))),
        SliverGrid.count(
          childAspectRatio: 1,
          crossAxisCount: 2,
          children: List.generate(
            _dummyImages.length,
            (index) => InkWell(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Image.asset(_dummyImages[index]),
                      Text(index.toString()),
                    ],
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return DetailedItemPage();
                  }),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCategories() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      DropdownButton(
          onChanged: (index) {}, items: _dropDownItems, hint: Text(" ")),
      DropdownButton(
          onChanged: (index) {}, items: _dropDownItems, hint: Text(" ")),
      ElevatedButton.icon(
          icon: Icon(Icons.nature_outlined),
          label: Text(pickerValue),
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Color.fromARGB(0, 255, 255, 255),
                isScrollControlled: false,
                context: context,
                builder: (context) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                    ),
                    height: 400,
                    child: Column(
                      children: [Text("test1"), Text("Test2")],
                    ),
                  );
                });
          }),
    ]);
  }
}
