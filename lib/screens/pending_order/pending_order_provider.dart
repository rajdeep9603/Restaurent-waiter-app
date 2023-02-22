import 'package:flutter/cupertino.dart';
import 'package:flutter_app_waiter_app/api/get_pending_order_grid.dart';
import 'package:flutter_app_waiter_app/api/pending_order_api.dart';
import 'package:flutter_app_waiter_app/model/get_pending_order_grid_model.dart';
import 'package:flutter_app_waiter_app/model/pending_order_table.dart';
import 'package:flutter_app_waiter_app/utils/assets_images.dart';


class WaiterPendingOrderProvider extends ChangeNotifier{

  PendingOrderTableModel pendingOrderTableModel = PendingOrderTableModel();
  PendingOrderGridTableModel pendingOrderGridTableModel = PendingOrderGridTableModel();

  int index1 = 0;
  bool dataLoaded = false;
  bool dataLoaded2 = true;

   tabChange(int index,int tableId){
    index1 = index;
    dataLoaded2 = true;
    PendingOrderGridTableApi.pendingOrderGridApi(tableId:tableId)!.then((value){
      dataLoaded2 = false;
      if(value != null){
        dataLoaded2 = false;
        pendingOrderGridTableModel = value;
        notifyListeners();
        print(pendingOrderTableModel);
      }
      else{
        dataLoaded2 = false;
        notifyListeners();
        print("api no calling");
      }
    });
    // notifyListeners();
  }


  List<Map<String,dynamic>> list = [
    {"count" : "1","image" : ImageRes.status},
    {"count" : "2","image" : ImageRes.status},
    {"count" : "3","image" : ImageRes.status},
    {"count" : "4","image" : ImageRes.status},
    {"count" : "5","image" : ImageRes.status},
    {"count" : "6","image" : ImageRes.status},
    {"count" : "7","image" : ImageRes.status},
    {"count" : "8","image" : ImageRes.status},
    {"count" : "9","image" : ImageRes.status},
  ];

  List<Map<String,dynamic>> list2 = [
    {"count" : "1","image" : ImageRes.bur2},
    {"count" : "2","image" : ImageRes.pizza},
    {"count" : "3","image" : ImageRes.bur2},
    {"count" : "4","image" : ImageRes.bur2},
    {"count" : "5","image" : ImageRes.bur1},
    {"count" : "6","image" : ImageRes.pizza},
    {"count" : "7","image" : ImageRes.bur1},
    {"count" : "8","image" : ImageRes.pizza},
    {"count" : "9","image" : ImageRes.bur1},
  ];

  List<Map<String,dynamic>> proceesDoneBoolList =[
    {"count" : "1","bool" : "0"},
    {"count" : "2","bool":"0"},
    {"count" : "3","bool" : "0"},
    {"count" : "4","bool" : "0"},
    {"count" : "5","bool" : "0"},
    {"count" : "6","bool" : "0"},
    {"count" : "7","bool" : "0"},
    {"count" : "8","bool" : "0"},
    {"count" : "9","bool" :"0"},
  ];

  void init(){
    dataLoaded = true;
    PendingOrderTableApi.pendingOrderApi()!.then((value){
      dataLoaded = false;
      if(value != null){
        pendingOrderTableModel = value;
        notifyListeners();
       print(pendingOrderTableModel);
      }
      else{
        dataLoaded = false;
        notifyListeners();
        print("api no calling");
      }
    });
  }

   checkProcessDoneBoolList(String count){
    proceesDoneBoolList.forEach((element) {
      if(element['count'] == count){
        element['bool'] = 1;
        notifyListeners();
      }
    });
  }

}