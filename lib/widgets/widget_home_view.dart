import 'package:art_gallery_auction/pages/page_detailed_item.dart';
import 'package:art_gallery_auction/utils/design_guide.dart';
import 'package:art_gallery_auction/utils/enums.dart';
import 'package:art_gallery_auction/utils/picker_data.dart';
import 'package:art_gallery_auction/widgets/widget_custom_title.dart';
import 'package:art_gallery_auction/widgets/widget_listview_horizontal.dart';
import 'package:art_gallery_auction/widgets/widget_sliver_persistent_header.dart';
import 'package:art_gallery_auction/widgets/widget_title_and_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';

class HomeView extends StatefulWidget {
  SalesType salesType;

  HomeView({@required this.salesType});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

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
          label: Text("picker"),
          onPressed: () {
            showPickerModal(context);
          }),
    ]);
  }

  showPickerModal(BuildContext context) {
    Picker(
        backgroundColor: designColorBrightGrey,
        textStyle: TextStyle(color: designColorDeepDarkBrown, fontSize: 17),
        title: Text(
          "Category",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        confirmText: 'Confirm',
        confirmTextStyle: TextStyle(fontSize: 15, color: Colors.blue),
        cancelText: 'Cancel',
        cancelTextStyle: TextStyle(fontSize: 15, color: Colors.red),
        headercolor: designColorDeepDarkBrown,
        adapter: PickerDataAdapter<String>(
          pickerdata: pickerDatas,
        ),
        changeToFirst: true,
        hideHeader: false,
        onConfirm: (Picker picker, List value) {
          print(value.toString());
          print(picker.adapter.text);
        }).showModal(this.context); //_scaffoldKey.currentState);
  }

}
