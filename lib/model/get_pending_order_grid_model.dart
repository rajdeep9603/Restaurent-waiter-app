// To parse this JSON data, do
//
//     final pendingOrderGridTableModel = pendingOrderGridTableModelFromJson(jsonString);

import 'dart:convert';

PendingOrderGridTableModel pendingOrderGridTableModelFromJson(String str) => PendingOrderGridTableModel.fromJson(json.decode(str));

String pendingOrderGridTableModelToJson(PendingOrderGridTableModel data) => json.encode(data.toJson());

class PendingOrderGridTableModel {
PendingOrderGridTableModel({
this.message,
this.messageCode,
this.status,
this.data,
});

String? message;
int? messageCode;
String? status;
Data? data;

factory PendingOrderGridTableModel.fromJson(Map<String, dynamic> json) => PendingOrderGridTableModel(
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
this.emodmList,
this.emtmList,
});

List<EmodmList>? emodmList;
List<dynamic>? emtmList;

factory Data.fromJson(Map<String, dynamic> json) => Data(
emodmList: json["emodmList"] == null ? null : List<EmodmList>.from(json["emodmList"].map((x) => EmodmList.fromJson(x))),
emtmList: json["emtmList"] == null ? null : List<dynamic>.from(json["emtmList"].map((x) => x)),
);

Map<String, dynamic> toJson() => {
"emodmList": emodmList == null ? null : List<dynamic>.from(emodmList!.map((x) => x.toJson())),
"emtmList": emtmList == null ? null : List<dynamic>.from(emtmList!.map((x) => x)),
};
}

class EmodmList {
EmodmList({
this.itemReviewDesc,
this.itemName,
this.itemReview,
this.itemQty,
this.orderId,
this.orderDid,
this.itemAmount,
this.itemId,
this.itemStatus,
this.remainingQty,
this.randomId,
this.mainImage,
});

dynamic itemReviewDesc;
String? itemName;
int? itemReview;
int? itemQty;
int? orderId;
int? orderDid;
double? itemAmount;
int? itemId;
int? itemStatus;
int? remainingQty;
dynamic randomId;
String? mainImage;


factory EmodmList.fromJson(Map<String, dynamic> json) => EmodmList(
itemReviewDesc: json["itemReviewDesc"],
itemName: json["itemName"] == null ? null : json["itemName"],
itemReview: json["itemReview"] == null ? null : json["itemReview"],
itemQty: json["itemQty"] == null ? null : json["itemQty"],
orderId: json["orderId"] == null ? null : json["orderId"],
orderDid: json["orderDID"] == null ? null : json["orderDID"],
itemAmount: json["itemAmount"] == null ? null : json["itemAmount"],
itemId: json["itemId"] == null ? null : json["itemId"],
itemStatus: json["itemStatus"] == null ? null : json["itemStatus"],
remainingQty: json["remainingQty"] == null ? null : json["remainingQty"],
randomId: json["randomId"],
mainImage: json["mainImage"] == null ? null : json["mainImage"],
);

Map<String, dynamic> toJson() => {
"itemReviewDesc": itemReviewDesc,
"itemName": itemName == null ? null : itemName,
"itemReview": itemReview == null ? null : itemReview,
"itemQty": itemQty == null ? null : itemQty,
"orderId": orderId == null ? null : orderId,
"orderDID": orderDid == null ? null : orderDid,
"itemAmount": itemAmount == null ? null : itemAmount,
"itemId": itemId == null ? null : itemId,
"itemStatus": itemStatus == null ? null : itemStatus,
"remainingQty": remainingQty == null ? null : remainingQty,
"randomId": randomId,
"mainImage": mainImage == null ? null : mainImage,
};
}
