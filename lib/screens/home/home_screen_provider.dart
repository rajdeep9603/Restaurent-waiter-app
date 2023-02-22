import 'package:flutter/cupertino.dart';
import 'package:flutter_app_waiter_app/order_tab/order_tab_screen.dart';
import 'package:flutter_app_waiter_app/screens/menu/item_details_screen.dart';
import 'package:flutter_app_waiter_app/screens/table/table_screen.dart';
import 'package:get/get.dart';

class HomeScreenProvider extends ChangeNotifier{

  void onMenu(){
    Get.to(()=>ItemDetailScreen(
      backredirectOrderListMap: [],
      type: "1",
      selectedMenu: "menu",
    ));
  }

  void onTable(){
    Get.to(()=>TableScreen(selectedMenu: "table",));
  }

  void onOrder(){
    Get.to(()=>OrderTabScreen(orderTab: "order"));
  }
}