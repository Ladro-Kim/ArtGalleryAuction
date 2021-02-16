import 'package:art_gallery_auction/class/user.dart';

class Item {
  User user;

  int itemNo;
  String itemName;
  bool isAuction; // general, auction
  int salesStatus; // 0: Done, 1 : OnSale, 2 : Reserved
  bool isHot;
  List<String> imagesUris;
  String country;
  DateTime loadDate;
  DateTime expireDate;
  DateTime createdDate;
  double price = 0;
  double discountPercent = 0.0;
  bool isVisible;
  String category1, category2, category3;
  bool isDeliveryPay;
  double deliveryPay;
  int viewCount;
  String description;
  String hashTag;

}
