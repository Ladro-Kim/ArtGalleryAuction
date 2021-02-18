import 'package:art_gallery_auction/models/item.dart';
import 'package:art_gallery_auction/models/story.dart';

class CustomUser {
  String nickName;
  String userName;
  String phoneNumber;
  String emailAddress;
  String homeAddress;

  List<Item> salesItems;
  List<Item> purchaseItems;
  List<Story> myStories;
  List<String> myFavorites;
  List<Item> cart;

}