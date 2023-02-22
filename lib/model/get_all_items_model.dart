// To parse this JSON data, do
//
//     final getAllProductsData = getAllProductsDataFromJson(jsonString);

import 'dart:convert';

GetAllProductsData getAllProductsDataFromJson(String str) => GetAllProductsData.fromJson(json.decode(str));

String getAllProductsDataToJson(GetAllProductsData data) => json.encode(data.toJson());

class GetAllProductsData {
  GetAllProductsData({
    this.message,
    this.messageCode,
    this.status,
    this.data,
  });

  String? message;
  int? messageCode;
  String? status;
  Data? data;

  factory GetAllProductsData.fromJson(Map<String, dynamic> json) => GetAllProductsData(
    message: json["message"],
    messageCode: json["messageCode"],
    status: json["status"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "messageCode": messageCode,
    "status": status,
    "data": data!.toJson(),
  };
}

class Data {
  Data({
    this.emimList,
    this.emipmList,
    this.emcmList,
    this.emamList,
  });

  List<EmimList>? emimList;
  List<dynamic>? emipmList;
  List<EmcmList>? emcmList;
  List<dynamic>? emamList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    emimList: List<EmimList>.from(json["emimList"].map((x) => EmimList.fromJson(x))),
    emipmList: List<dynamic>.from(json["emipmList"].map((x) => x)),
    emcmList: List<EmcmList>.from(json["emcmList"].map((x) => EmcmList.fromJson(x))),
    emamList: List<dynamic>.from(json["emamList"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "emimList": List<dynamic>.from(emimList!.map((x) => x.toJson())),
    "emipmList": List<dynamic>.from(emipmList!.map((x) => x)),
    "emcmList": List<dynamic>.from(emcmList!.map((x) => x.toJson())),
    "emamList": List<dynamic>.from(emamList!.map((x) => x)),
  };
}

class EmcmList {
  EmcmList({
    this.categoryId,
    this.categoryName,
    this.foodType,
    this.foodTypeDesc,
    this.isActive,
    this.entryBy,
    this.entryDate,
    this.updateBy,
    this.updateDate,
  });

  int? categoryId;
  String? categoryName;
  int? foodType;
  String? foodTypeDesc;
  bool? isActive;
  String? entryBy;
  DateTime? entryDate;
  dynamic? updateBy;
  DateTime? updateDate;

  factory EmcmList.fromJson(Map<String, dynamic> json) => EmcmList(
    categoryId: json["categoryId"],
    categoryName: json["categoryName"],
    foodType: json["foodType"],
    foodTypeDesc: json["foodTypeDesc"],
    isActive: json["isActive"],
    entryBy: json["entryBy"],
    entryDate: DateTime.parse(json["entryDate"]),
    updateBy: json["updateBy"],
    updateDate: DateTime.parse(json["updateDate"]),
  );

  Map<String, dynamic> toJson() => {
    "categoryId": categoryId,
    "categoryName": categoryName,
    "foodType": foodType,
    "foodTypeDesc": foodTypeDesc,
    "isActive": isActive,
    "entryBy": entryBy,
    "entryDate": entryDate!.toIso8601String(),
    "updateBy": updateBy,
    "updateDate": updateDate!.toIso8601String(),
  };
}

class EmimList {
  EmimList({
    this.itemId,
    this.randomId,
    this.itemName,
    this.itemDescription,
    this.mainImage,
    this.itemAnimationName,
    this.categoryId,
    this.categoryName,
    this.itemType,
    this.itemTypeDesc,
    this.foodType,
    this.foodTypeDesc,
    this.cookingTime,
    this.averageRating,
    this.price,
    this.offerPrice,
    this.isActive,
    this.entryBy,
    this.entryDate,
    this.updateBy,
    this.updateDate,
  });

  int? itemId;
  String? randomId;
  String? itemName;
  String? itemDescription;
  String? mainImage;
  dynamic? itemAnimationName;
  int? categoryId;
  String? categoryName;
  int? itemType;
  String? itemTypeDesc;
  int? foodType;
  String? foodTypeDesc;
  Map<String, double>? cookingTime;
  int? averageRating;
  double? price;
  double? offerPrice;
  bool? isActive;
  String? entryBy;
  DateTime? entryDate;
  dynamic? updateBy;
  DateTime? updateDate;

  factory EmimList.fromJson(Map<String, dynamic> json) => EmimList(
    itemId: json["itemId"],
    randomId: json["randomId"],
    itemName: json["itemName"],
    itemDescription: json["itemDescription"],
    mainImage: json["mainImage"],
    itemAnimationName: json["itemAnimationName"],
    categoryId: json["categoryId"],
    categoryName: json["categoryName"],
    itemType: json["itemType"],
    itemTypeDesc: json["itemTypeDesc"],
    foodType: json["foodType"],
    foodTypeDesc: json["foodTypeDesc"],
    cookingTime: Map.from(json["cookingTime"]).map((k, v) => MapEntry<String, double>(k, v.toDouble())),
    averageRating: json["averageRating"],
    price: json["price"],
    offerPrice: json["offerPrice"],
    isActive: json["isActive"],
    entryBy: json["entryBy"],
    entryDate: DateTime.parse(json["entryDate"]),
    updateBy: json["updateBy"],
    updateDate: DateTime.parse(json["updateDate"]),
  );

  Map<String, dynamic> toJson() => {
    "itemId": itemId,
    "randomId": randomId,
    "itemName": itemName,
    "itemDescription": itemDescription,
    "mainImage": mainImage,
    "itemAnimationName": itemAnimationName,
    "categoryId": categoryId,
    "categoryName": categoryName,
    "itemType": itemType,
    "itemTypeDesc": itemTypeDesc,
    "foodType": foodType,
    "foodTypeDesc": foodTypeDesc,
    "cookingTime": Map.from(cookingTime!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "averageRating": averageRating,
    "price": price,
    "offerPrice": offerPrice,
    "isActive": isActive,
    "entryBy": entryBy,
    "entryDate": entryDate!.toIso8601String(),
    "updateBy": updateBy,
    "updateDate": updateDate!.toIso8601String(),
  };
}
