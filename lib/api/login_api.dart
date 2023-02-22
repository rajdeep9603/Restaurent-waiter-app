import 'dart:convert';

import 'package:flutter_app_waiter_app/model/login_model.dart';
import 'package:flutter_app_waiter_app/utils/api_Res.dart';
import 'package:http/http.dart' as http;

class ApiLogin{
  static Future<LoginModel?>? loginApi({required String username,required String password}) async {
   try{
     String url = ApiRes.login;
     Map<String,dynamic> bodyData={
       "UserName":"StaffW001",
       "Password":"Staff@001",
       "AppType" : 3,

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
         return loginModelFromJson(response.body);
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