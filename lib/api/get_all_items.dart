import 'dart:convert';
import 'package:flutter_app_waiter_app/model/get_all_items_model.dart';
import 'package:flutter_app_waiter_app/utils/api_Res.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class GetAllItemsData{
  static Future<GetAllProductsData?> getAllItems({required String itemId}) async {
    try {
      String url = ApiRes.getAllProducts;
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };

      Map<String, dynamic> bodyData = {
          "Type":itemId,
          "PageNo":"0"
      };

      var body = jsonEncode(bodyData);
      http.Response response =
      await http.post(Uri.parse(url), body: body, headers: headers);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        return getAllProductsDataFromJson(response.body);
      }
      else {
        // var errorMsg = jsonDecode(response.body)['message'];
    // Get.snackbar("error".tr, errorMsg);
    return null;
    }
  } catch (e) {
      print(e);
    }
  }
}
