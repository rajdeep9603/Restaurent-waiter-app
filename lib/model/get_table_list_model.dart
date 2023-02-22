// To parse this JSON data, do
//
//     final getTableListModel = getTableListModelFromJson(jsonString);

import 'dart:convert';

GetTableListModel getTableListModelFromJson(String str) => GetTableListModel.fromJson(json.decode(str));

String getTableListModelToJson(GetTableListModel data) => json.encode(data.toJson());

class GetTableListModel {
  GetTableListModel({
    this.message,
    this.messageCode,
    this.status,
    this.data,
  });

  String? message;
  int? messageCode;
  String? status;
  Map<String, List<Datum>>? data;

  factory GetTableListModel.fromJson(Map<String, dynamic> json) => GetTableListModel(
    message: json["message"] == null ? null : json["message"],
    messageCode: json["messageCode"] == null ? null : json["messageCode"],
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : Map.from(json["data"]).map((k, v) => MapEntry<String, List<Datum>>(k, v == null ? [] : List<Datum>.from(v.map((x) => Datum.fromJson(x))))),
  );

  Map<String, dynamic> toJson() => {
    "message": message == null ? null : message,
    "messageCode": messageCode == null ? null : messageCode,
    "status": status == null ? null : status,
    "data": data == null ? null : Map.from(data!).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : List<dynamic>.from(v.map((x) => x.toJson())))),
  };
}

class Datum {
  Datum({
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
  dynamic? updateBy;
  DateTime? updateDate;
  String? userName;
  int? entryFrom;
  int? updateFrom;
  int? tenantId;
  int? companyId;
  int? branchId;
  int? noOfCustomer;
  bool? isLogin;
  int? itemStatus;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
    "isLogin": isLogin == null ? null : isLogin,
    "itemStatus": itemStatus == null ? null : itemStatus,
  };
}
