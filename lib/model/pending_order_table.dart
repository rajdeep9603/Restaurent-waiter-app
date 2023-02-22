// To parse this JSON data, do
//
//     final pendingOrderTableModel = pendingOrderTableModelFromJson(jsonString);

import 'dart:convert';

PendingOrderTableModel pendingOrderTableModelFromJson(String str) => PendingOrderTableModel.fromJson(json.decode(str));

String pendingOrderTableModelToJson(PendingOrderTableModel data) => json.encode(data.toJson());

class PendingOrderTableModel {
  PendingOrderTableModel({
    this.message,
    this.messageCode,
    this.status,
    this.data,
  });

  String? message;
  int? messageCode;
  String? status;
  Data? data;

  factory PendingOrderTableModel.fromJson(Map<String, dynamic> json) => PendingOrderTableModel(
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

  List<dynamic>? emodmList;
  List<EmtmList>? emtmList;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    emodmList: json["emodmList"] == null ? null : List<dynamic>.from(json["emodmList"].map((x) => x)),
    emtmList: json["emtmList"] == null ? null : List<EmtmList>.from(json["emtmList"].map((x) => EmtmList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "emodmList": emodmList == null ? null : List<dynamic>.from(emodmList!.map((x) => x)),
    "emtmList": emtmList == null ? null : List<dynamic>.from(emtmList!.map((x) => x.toJson())),
  };
}

class EmtmList {
  EmtmList({
    this.tableId,
    this.tableName,
    this.tableRid,
    this.isOccupie,
    this.noOfSitting,
    this.isActive,
    this.password,
    this.entryBy,
    this.entryDate,
    this.updateBy,
    this.updateDate,
    this.userName,
    this.entryFrom,
    this.updateFrom,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.noOfCustomer,
    this.isRepeat,
    this.isLogin,
    this.itemStatus,
  });

  int? tableId;
  String? tableName;
  String? tableRid;
  bool? isOccupie;
  int? noOfSitting;
  bool? isActive;
  String? password;
  String? entryBy;
  DateTime? entryDate;
  dynamic updateBy;
  DateTime? updateDate;
  String? userName;
  int? entryFrom;
  int? updateFrom;
  int? tenantId;
  int? companyId;
  int? branchId;
  int? noOfCustomer;
  int? isRepeat;
  bool? isLogin;
  int? itemStatus;

  factory EmtmList.fromJson(Map<String, dynamic> json) => EmtmList(
    tableId: json["tableId"] == null ? null : json["tableId"],
    tableName: json["tableName"] == null ? null : json["tableName"],
    tableRid: json["tableRID"] == null ? null : json["tableRID"],
    isOccupie: json["isOccupie"] == null ? null : json["isOccupie"],
    noOfSitting: json["noOfSitting"] == null ? null : json["noOfSitting"],
    isActive: json["isActive"] == null ? null : json["isActive"],
    password: json["password"] == null ? null : json["password"],
    entryBy: json["entryBy"] == null ? null : json["entryBy"],
    entryDate: json["entryDate"] == null ? null : DateTime.parse(json["entryDate"]),
    updateBy: json["updateBy"],
    updateDate: json["updateDate"] == null ? null : DateTime.parse(json["updateDate"]),
    userName: json["userName"] == null ? null : json["userName"],
    entryFrom: json["entryFrom"] == null ? null : json["entryFrom"],
    updateFrom: json["updateFrom"] == null ? null : json["updateFrom"],
    tenantId: json["tenantId"] == null ? null : json["tenantId"],
    companyId: json["companyId"] == null ? null : json["companyId"],
    branchId: json["branchId"] == null ? null : json["branchId"],
    noOfCustomer: json["noOfCustomer"] == null ? null : json["noOfCustomer"],
    isRepeat: json["isRepeat"] == null ? null : json["isRepeat"],
    isLogin: json["isLogin"] == null ? null : json["isLogin"],
    itemStatus: json["itemStatus"] == null ? null : json["itemStatus"],
  );

  Map<String, dynamic> toJson() => {
    "tableId": tableId == null ? null : tableId,
    "tableName": tableName == null ? null : tableName,
    "tableRID": tableRid == null ? null : tableRid,
    "isOccupie": isOccupie == null ? null : isOccupie,
    "noOfSitting": noOfSitting == null ? null : noOfSitting,
    "isActive": isActive == null ? null : isActive,
    "password": password == null ? null : password,
    "entryBy": entryBy == null ? null : entryBy,
    "entryDate": entryDate == null ? null : entryDate!.toIso8601String(),
    "updateBy": updateBy,
    "updateDate": updateDate == null ? null : updateDate!.toIso8601String(),
    "userName": userName == null ? null : userName,
    "entryFrom": entryFrom == null ? null : entryFrom,
    "updateFrom": updateFrom == null ? null : updateFrom,
    "tenantId": tenantId == null ? null : tenantId,
    "companyId": companyId == null ? null : companyId,
    "branchId": branchId == null ? null : branchId,
    "noOfCustomer": noOfCustomer == null ? null : noOfCustomer,
    "isRepeat": isRepeat == null ? null : isRepeat,
    "isLogin": isLogin == null ? null : isLogin,
    "itemStatus": itemStatus == null ? null : itemStatus,
  };
}
