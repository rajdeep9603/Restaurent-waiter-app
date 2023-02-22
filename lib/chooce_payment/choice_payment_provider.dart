import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_waiter_app/api/post_order_data_api.dart';
import 'package:flutter_app_waiter_app/model/post_order_model.dart';
import 'package:flutter_app_waiter_app/screens/successfull/successfull_screen.dart';
import 'package:get/get.dart';

class ChoicePaymentProvider extends ChangeNotifier{
  bool downArrow = false;

  PostOrderDataModel postOrderDataModel = PostOrderDataModel();

  List<Map<String, List<Map<String, dynamic>>>>? newmainOrderListFinal = [];

  List<Map<String, List<Map<String, dynamic>>>>? paymentListMap;

  double showDisplayPrice = 0.0;
  double showDisplayquantity = 0.0;


   init(double displayPrice,double displayquantity,List<Map<String, List<Map<String, dynamic>>>>? newmainList,){
     newmainOrderListFinal = newmainList;
     changeTotalValue(displayPrice,displayquantity);
   orderDataFromMainList(newmainOrderListFinal);

  }
  changeTotalValue(double displayPrice,double displayquantity){
     showDisplayPrice = displayPrice;
     showDisplayquantity = displayquantity;
     notifyListeners();
  }

  void arrowTap(){
    downArrow =! downArrow;
    notifyListeners();
  }


  List<Map<String, dynamic>> orderApiListMap = [];


  String deviceType = "";



  void orderDataFromMainList(
      List<Map<String, List<Map<String, dynamic>>>>? newmainOrderListFinal) {
    orderApiListMap = [];
    newmainOrderListFinal!.forEach((mainElement) {
      mainElement['list']!.forEach((subList) {
        if (subList['q'] != 0) {
          Map<String, dynamic> lol = {
            'RandomId': subList['rId'],
            'ItemName': subList['itemName'],
            'ItemQty': subList['q'].toInt(),
            'ItemAmount': subList['p'],
            'ItemReview': subList['rating'],
            "ItemReviewDesc": null
          };
          orderApiListMap.add(lol);
        }
      });
    });
  }



  void payNow(){

    if (Platform.isAndroid) {
      deviceType = "Android";
      notifyListeners();
    } else {
      deviceType = "Ios";
      notifyListeners();
    }



    PostOrderDataAPi.postOrderApi(
        cName: "cusName",
        mNo: "mobileNo",
        OrderFromDesc: deviceType,
        orderApiListMap: orderApiListMap,
        PaymentTypeDesc: "COD",
        SubTotal: showDisplayPrice,
        tip: 30.0)!
        .then((value) {
      if (value != null) {
        postOrderDataModel = value;
        print(postOrderDataModel);

        Get.to(()=>SuccessFullScreen());

        print("order successfully");
      } else {
        print("order error!");
      }
    });




  }


}