import 'dart:convert';


import 'package:flutter_app_waiter_app/model/post_order_model.dart';
import 'package:flutter_app_waiter_app/utils/api_Res.dart';
import 'package:http/http.dart' as http;

class PostOrderDataAPi{
  static Future<PostOrderDataModel?>? postOrderApi({String? mNo,String? cName,double? tip,String? OrderFromDesc,double?SubTotal, String? PaymentTypeDesc , List<Map<String,dynamic>>? orderApiListMap}) async {
    // {required String username,required String password}
    try{
      String url = ApiRes.postorder;
      Map<String,dynamic> bodyData={
          "EMOHM" : {
            "OrderInstruction" : "",
            "AddTableId" : 0,
            "IsPayment" :false,
            "TransactionId" : null,
            "SubTotal" : SubTotal,
            "TaxAmount" : 30.00,
            "Amount" : double.parse(SubTotal.toString()) + double.parse(30.toString()),
            "TipAmount" : tip,
            "CoupenCode" : "sd12sd",
            "CoupenBenefitAmount" : 120.00,
            "PaymentType" : 1,
            "PaymentTypeDesc" : PaymentTypeDesc,
            "OrderType" : 0,
            "OrderTypeDesc" : null,
            "EntryFrom" : 1,
            "OrderFromDesc" : OrderFromDesc,
            "EntryBy" : "Username",
            "OrderFrom" : 2,
            "TenantId" : 1,
            "CompanyId" : 1,
            "BranchId" : 1,
            "OrdStatus" : 1,
            "CustomerName" : cName,
            "CustomerNo" : mNo,
            "RemainingAmount" : double.parse(SubTotal.toString()) + double.parse(30.toString()),
          },
          "EMODMList" : orderApiListMap,
          "Type" : 1,
          "Id" : 0
      };
      Map<String,String> header={
        'Content-Type': 'application/json'
      };

      print("post order - $orderApiListMap");

      var body = json.encode(bodyData);
      http.Response response = await http.post(Uri.parse(url),body: body,headers:header);
      print(response.body);
      print(response.statusCode);

      if(response.statusCode == 200){
        if(jsonDecode(response.body)['status'] == "1"){
          return postOrderDataModelFromJson(response.body);
        }
        return null;
      }
      return null;
    }
    catch(e){
      print(e);
      throw Exception(e);
    }
  }
}