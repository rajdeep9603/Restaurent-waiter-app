// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.message,
    this.messageCode,
    this.status,
    this.data,
  });

  String? message;
  int? messageCode;
  String? status;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
    this.emum,
    this.apiKey,
  });

  Emum? emum;
  String? apiKey;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    emum: json["emum"] == null ? null : Emum.fromJson(json["emum"]),
    apiKey: json["apiKey"] == null ? null : json["apiKey"],
  );

  Map<String, dynamic> toJson() => {
    "emum": emum == null ? null : emum!.toJson(),
    "apiKey": apiKey == null ? null : apiKey,
  };
}

class Emum {
  Emum({
    this.userId,
    this.userName,
    this.password,
    this.userType,
    this.userTypeDesc,
    this.lastLoginDate,
    this.isActive,
    this.isEmailConfirmed,
    this.confirmationCode,
    this.emailCode,
    this.otp,
    this.otpConfirmed,
    this.emailCodeConfirmed,
    this.entryBy,
    this.entryDate,
    this.updateBy,
    this.updateDate,
    this.email,
    this.mobileNo,
    this.entryFrom,
    this.updateFrom,
    this.tenantId,
    this.companyId,
    this.branchId,
    this.fotp,
  });

  int? userId;
  String? userName;
  String? password;
  String? userType;
  dynamic? userTypeDesc;
  DateTime? lastLoginDate;
  bool? isActive;
  bool? isEmailConfirmed;
  String? confirmationCode;
  dynamic? emailCode;
  String? otp;
  bool? otpConfirmed;
  bool? emailCodeConfirmed;
  String? entryBy;
  DateTime? entryDate;
  dynamic? updateBy;
  DateTime? updateDate;
  dynamic? email;
  dynamic? mobileNo;
  int? entryFrom;
  int? updateFrom;
  int? tenantId;
  int? companyId;
  int? branchId;
  dynamic? fotp;

  factory Emum.fromJson(Map<String, dynamic> json) => Emum(
    userId: json["userId"] == null ? null : json["userId"],
    userName: json["userName"] == null ? null : json["userName"],
    password: json["password"] == null ? null : json["password"],
    userType: json["userType"] == null ? null : json["userType"],
    userTypeDesc: json["userTypeDesc"],
    lastLoginDate: json["lastLoginDate"] == null ? null : DateTime.parse(json["lastLoginDate"]),
    isActive: json["isActive"] == null ? null : json["isActive"],
    isEmailConfirmed: json["isEmailConfirmed"] == null ? null : json["isEmailConfirmed"],
    confirmationCode: json["confirmationCode"] == null ? null : json["confirmationCode"],
    emailCode: json["emailCode"],
    otp: json["otp"] == null ? null : json["otp"],
    otpConfirmed: json["otpConfirmed"] == null ? null : json["otpConfirmed"],
    emailCodeConfirmed: json["emailCodeConfirmed"] == null ? null : json["emailCodeConfirmed"],
    entryBy: json["entryBy"] == null ? null : json["entryBy"],
    entryDate: json["entryDate"] == null ? null : DateTime.parse(json["entryDate"]),
    updateBy: json["updateBy"],
    updateDate: json["updateDate"] == null ? null : DateTime.parse(json["updateDate"]),
    email: json["email"],
    mobileNo: json["mobileNo"],
    entryFrom: json["entryFrom"] == null ? null : json["entryFrom"],
    updateFrom: json["updateFrom"] == null ? null : json["updateFrom"],
    tenantId: json["tenantId"] == null ? null : json["tenantId"],
    companyId: json["companyId"] == null ? null : json["companyId"],
    branchId: json["branchId"] == null ? null : json["branchId"],
    fotp: json["fotp"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "userName": userName == null ? null : userName,
    "password": password == null ? null : password,
    "userType": userType == null ? null : userType,
    "userTypeDesc": userTypeDesc,
    "lastLoginDate": lastLoginDate == null ? null : lastLoginDate!.toIso8601String(),
    "isActive": isActive == null ? null : isActive,
    "isEmailConfirmed": isEmailConfirmed == null ? null : isEmailConfirmed,
    "confirmationCode": confirmationCode == null ? null : confirmationCode,
    "emailCode": emailCode,
    "otp": otp == null ? null : otp,
    "otpConfirmed": otpConfirmed == null ? null : otpConfirmed,
    "emailCodeConfirmed": emailCodeConfirmed == null ? null : emailCodeConfirmed,
    "entryBy": entryBy == null ? null : entryBy,
    "entryDate": entryDate == null ? null : entryDate!.toIso8601String(),
    "updateBy": updateBy,
    "updateDate": updateDate == null ? null : updateDate!.toIso8601String(),
    "email": email,
    "mobileNo": mobileNo,
    "entryFrom": entryFrom == null ? null : entryFrom,
    "updateFrom": updateFrom == null ? null : updateFrom,
    "tenantId": tenantId == null ? null : tenantId,
    "companyId": companyId == null ? null : companyId,
    "branchId": branchId == null ? null : branchId,
    "fotp": fotp,
  };
}
