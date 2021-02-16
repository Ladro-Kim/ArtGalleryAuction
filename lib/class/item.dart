import 'package:firebase_auth/firebase_auth.dart';

class Item {
  DateTime uploadDate;
  DateTime expireDate;

  List<String> imagesUris = [];   // user input

  String sItemIndex;
  String sItemName;   // user input
  String sCountry;
  String sCategory1, sCategory2, sCategory3;    // user input
  String sDescription;    // user input
  String sHashTag;    // user input

  int iSalesIndex = 0; // enum type, get value using SalesIndex.value.index,   user input
  int iViewCount = 0;
  int iCreateYear;    // user input

  num dPrice = 0;   // user input
  num dDiscountPercent = 0;   // user input
  num dDeliveryPay = 0;   // user input

  bool isVisible = false;   // user input
  bool isHot = false;
  bool isAuction = false; // general, auction,    user input
  bool isDeliveryPay = false;

  Item() {
    uploadDate = DateTime.now();
    expireDate = uploadDate.add(Duration(days: 7));
    sItemIndex = FirebaseAuth.instance.currentUser.email + uploadDate.toString();
  } // user input


}
