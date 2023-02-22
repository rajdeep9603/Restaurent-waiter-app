import 'package:flutter/cupertino.dart';
import 'package:flutter_app_waiter_app/api/get_table_list_api.dart';
import 'package:flutter_app_waiter_app/model/get_table_list_model.dart';
import 'package:flutter_app_waiter_app/order_tab/order_tab_screen.dart';
import 'package:flutter_app_waiter_app/screens/menu/item_details_screen.dart';
import 'package:flutter_app_waiter_app/table_details/table_detail_screen.dart';
import 'package:flutter_app_waiter_app/utils/assets_images.dart';
import 'package:get/get.dart';

class TableScreenProvider extends ChangeNotifier{
String selectedMenu = "table";

GetTableListModel getTableListModel = GetTableListModel();

Future<void> init(String selecteMenutab) async {
   selectedMenu = selecteMenutab;
   await getTableListData();
   notifyListeners();
}
void selectedMenuBtn(String selected){
  selectedMenu = selected;
  notifyListeners();
}

void onMenu(){
  Get.offAll(()=>ItemDetailScreen(backredirectOrderListMap: [],type:"1",selectedMenu: "menu"));

}
void onOrder(){
  Get.to(()=>OrderTabScreen( orderTab: "order"));
}

void onTableGridTap(int index,String image){
  Get.to(()=>TableDetailScreen(index: index,image: ImageRes.bur2));
}








bool dataLoaded = false;

// Future<void> init(String selecteMenutab) async {
// Future<void> init() async {
//   await getTableListData();
//   // notifyListeners();
// }

getTableListData() {
  dataLoaded = true;
  GetTableApi.getTableListApi()!.then((value) {
    dataLoaded = false;
    if (value != null) {
      dataLoaded = false;
      getTableListModel = value;
      notifyListeners();
      print(getTableListModel);
      print("api calling success get table");
    } else {
      dataLoaded = false;
      notifyListeners();

      print("api calling error!");
    }
  });
}


// void onMenu() {
//   Get.offAll(() => ItemDetailScreen(
//     backredirectOrderListMap: [],displayPrice: 0.0,displayQuantity: 0.0,));
// }

// void onOrder() {
//   Get.to(() => OrderTabScreen(orderTab: "order"));
// }

// void onTableGridTap(int index, String image) {
//   Get.to(() => TableDetailScreen(index: index,));
// }

// void onDeliveryTap(){
//   Get.to(()=>ItemDetailScreen(displayQuantity: 0.0,displayPrice: 0.0,backredirectOrderListMap: [],));
// }

// void onSelfTap(){
//   Get.to(()=>ItemDetailScreen(displayQuantity: 0.0,displayPrice: 0.0,backredirectOrderListMap: [],));
// }



}