class Book {
  String status;
  String message;
  List<Data> data;

  Book({this.status, this.message, this.data});

  Book.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String merchantId;
  String name;
  String email;
  bool status;
  String address;
  String phone;
  String businessName;
  String image;
  String backgroundTheme;
  String fontColor;
  String cityId;
  String stateId;
  int countryId;
  String categoryId;
  String ipAddress;
  String countryName;
  String stateName;
  String cityName;
  String merchantCatName;
  String sId;

  Data(
      {this.merchantId,
      this.name,
      this.email,
      this.status,
      this.address,
      this.phone,
      this.businessName,
      this.image,
      this.backgroundTheme,
      this.fontColor,
      this.cityId,
      this.stateId,
      this.countryId,
      this.categoryId,
      this.ipAddress,
      this.countryName,
      this.stateName,
      this.cityName,
      this.merchantCatName,
      this.sId});

  Data.fromJson(Map<String, dynamic> json) {
    merchantId = json['merchantId'];
    name = json['name'];
    email = json['email'];
    status = json['status'];
    address = json['address'];
    phone = json['phone'];
    businessName = json['businessName'];
    image = json['image'];
    backgroundTheme = json['backgroundTheme'];
    fontColor = json['fontColor'];
    cityId = json['cityId'];
    stateId = json['stateId'];
    countryId = json['countryId'];
    categoryId = json['categoryId'];
    ipAddress = json['ipAddress'];
    countryName = json['countryName'];
    stateName = json['stateName'];
    cityName = json['cityName'];
    merchantCatName = json['merchantCatName'];
    sId = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['merchantId'] = this.merchantId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['status'] = this.status;
    data['address'] = this.address;
    data['phone'] = this.phone;
    data['businessName'] = this.businessName;
    data['image'] = this.image;
    data['backgroundTheme'] = this.backgroundTheme;
    data['fontColor'] = this.fontColor;
    data['cityId'] = this.cityId;
    data['stateId'] = this.stateId;
    data['countryId'] = this.countryId;
    data['categoryId'] = this.categoryId;
    data['ipAddress'] = this.ipAddress;
    data['countryName'] = this.countryName;
    data['stateName'] = this.stateName;
    data['cityName'] = this.cityName;
    data['merchantCatName'] = this.merchantCatName;
    data['_id'] = this.sId;
    return data;
  }
}
