import 'dart:convert';

import 'package:flutter_app_waiter_app/model/get_pending_order_grid_model.dart';
import 'package:flutter_app_waiter_app/utils/api_Res.dart';
import 'package:http/http.dart' as http;

class PendingOrderGridTableApi{
  static Future<PendingOrderGridTableModel?>? pendingOrderGridApi({int? tableId}) async {
    // {required String username,required String password}
    try{
      String url = ApiRes.pendingOrder;
      Map<String,dynamic> bodyData={
          "Type":0,
          "Id":tableId,
          "TenantId":1,
          "CompanyId":1,
          "BranchId":1
      };
      Map<String,String> header={
        'Content-Type': 'application/json'
      };

      var body = json.encode(bodyData);
      http.Response response = await http.post(Uri.parse(url),body: body,headers:header);
      print(response.body);
      print(response.statusCode);

      if(response.statusCode == 200){
        if(jsonDecode(response.body)['status'] == "1"){
          return pendingOrderGridTableModelFromJson(response.body);
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