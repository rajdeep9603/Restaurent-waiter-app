import 'package:flutter/cupertino.dart';
import 'package:flutter_app_waiter_app/screens/menu/item_details_screen.dart';
import 'package:flutter_app_waiter_app/screens/pending_order/pending_order_screen.dart';
import 'package:flutter_app_waiter_app/screens/table/table_screen.dart';
import 'package:get/get.dart';

class OrderTabProvider extends ChangeNotifier{

  void init(String selected){
    selectedMenuBtn(selected);
  }

  String selectedMenu = "order";

  void selectedMenuBtn(String selected) {
    selectedMenu = selected;
    notifyListeners();
  }


  void onMenu(){
    Get.to(()=>ItemDetailScreen(
      backredirectOrderListMap: [],
      type: "1",
      selectedMenu: "menu",
    ));
  }

  void pendingOrder(){
    Get.to(()=>PendingOrderScreen());
  }

  void onTableStatus(){
    Get.to(()=>TableScreen(selectedMenu: "table",));
  }



  // void onOrder(){
  //   Get.to(()=>OrderTab());
  // }
}