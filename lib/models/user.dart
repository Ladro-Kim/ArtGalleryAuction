class CustomUser {
  String nickName;
  String userName;
  String phoneNumber;
  String emailAddress;
  String homeAddress;
  String country;


  CustomUser(
      {this.nickName,
      this.userName,
      this.phoneNumber,
      this.emailAddress,
      this.homeAddress,
      this.country});

  factory CustomUser.fromJson(Map<String, dynamic> json) {
    return CustomUser(
      nickName: json['nickName'] as String,
      userName: json['userName'] as String,
    );
  }

}

// List<Item> salesItems;
// List<Item> purchaseItems;
// List<Story> myStories;
// List<String> myFavorites;
// List<Item> cart;
