// To parse this JSON data, do
//
//     final postOrderDataModel = postOrderDataModelFromJson(jsonString);

import 'dart:convert';

PostOrderDataModel postOrderDataModelFromJson(String str) => PostOrderDataModel.fromJson(json.decode(str));

String postOrderDataModelToJson(PostOrderDataModel data) => json.encode(data.toJson());

class PostOrderDataModel {
  PostOrderDataModel({
    this.message,
    this.messageCode,
    this.status,
    this.data,
  });

  String? message;
  int? messageCode;
  String? status;
  Data? data;

  factory PostOrderDataModel.fromJson(Map<String, dynamic> json) => PostOrderDataModel(
    message: json["message"] == null ? null : json["message"],
    messageCode: json["messageCode"] == null ? null : json["messageCode"],
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "messageCode": messageCode == null ? null : messageCode,
    "status": status == null ? null : status,
    "data": data == null ? null : data!.toJson(),
  };
}

class Data {
  Data({
    this.orderId,
  });

  int? orderId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    orderId: json["orderId"] == null ? null : json["orderId"],
  );

  Map<String, dynamic> toJson() => {
    "orderId": orderId == null ? null : orderId,
  };
}
