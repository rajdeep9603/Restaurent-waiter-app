import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app_waiter_app/chooce_payment/choice_payment_screen.dart';
import 'package:flutter_app_waiter_app/model/get_all_items_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ManageItemQuantityProvider extends ChangeNotifier {
  List<Map<String, dynamic>> orderdata = [];

  SlidableController? slidableController;

  //List<Map<String,List<Map<String,dynamic>>>> mainList = [];

  double displayPrice = 0.0;
  double displayquantity = 0.0;
  bool onTapItem = false;
  bool onBottemSheet = false;
  String foodType = "";

  // double displayquantity = 0.0;

  List<Map<String, List<Map<String, dynamic>>>>? newmainList = [];

  GetAllProductsData? newApiData;

  onSwipeDelete(
    int index,
    int cId,
    String rId,
  ) {
    displayPrice = 0.0;
    displayquantity = 0.0;
    orderdata.removeAt(index);

// for display price and quantity make 0..
    newmainList!.forEach((element) {
      element['list']!.forEach((ele) {
        if (ele['rId'] == rId) {
          ele['p'] = 0.0;
          ele['q'] = 0;
        }
      });
    });

    //for reoperation count of display price and display quantity
    newmainList!.forEach((element) {
      element['list']!.forEach((ele) {
        displayPrice = displayPrice + ele['p'];
        displayquantity = displayquantity + ele['q'];
        notifyListeners();
      });
    });

    // notifyListeners();
  }

  void init(
    List<Map<String, List<Map<String, dynamic>>>> mainList,
    GetAllProductsData? apiData,
    int directHomeTotalAmount,
    int directHomeTotalQuantity,
    String type,
  ) {
    // for direct home total amount //

    displayPrice = directHomeTotalAmount.toDouble();
    displayquantity = directHomeTotalQuantity.toDouble();
    print("$mainList");
    orderdata = [];
    newmainList = mainList;
    newApiData = apiData;
    foodType = type;
    Map<String, dynamic> orderValue = {};
    //for show display price and quanity

    newmainList!.forEach((mainElement) {
      mainElement['list']!.forEach((subelement) {
        if (subelement["q"] != 0) {
          //for maintain orderlist of 0 & 1 here

          // if (jsonData.randomId == subelement['rId']) {
          // for when quantity become 0 at that time card will be remove from screen ...

          orderValue = {'rId': subelement['rId'], 'value': 1};
          orderList.add(orderValue);

          //
          orderdata.add({
            'rId': subelement['rId'],
            'p': subelement['p'], //subelement['p'],
            'q': subelement['q'],
            'itemName': subelement['itemName'],
            'cName': subelement['cName'],
            'rating': subelement['rating'],
            'cId': subelement['cId'],
            'foodType': subelement['foodType']
          });
          // }
        }
      });
    });

//----
//     newmainList!.forEach((mainElement) {
//       mainElement['list']!.forEach((subelement) {
//         if (subelement["p"] != 0) {
//           apiData!.data!.emimList!.forEach((jsonData) {
//             //for maintain orderlist of 0 & 1 here
//
//             if (jsonData.randomId == subelement['rId']) {
//               // for when quantity become 0 at that time card will be remove from screen ...
//               orderValue = {'rId': jsonData.randomId!, 'value': 1};
//               orderList.add(orderValue);
//
//
//               orderdata.add({
//                 'rId': jsonData.randomId,
//                 'p': jsonData.price, //subelement['p'],
//                 'q': subelement['q'],
//                 'itemName': jsonData.itemName,
//                 'cName': jsonData.categoryName,
//                 'rating': jsonData.averageRating,
//                 'cId': jsonData.categoryId
//               });
//             }
//           });
//         }
//       });
//     });
    print("===============================.............:$orderdata");
  }

  void plus(int cId, String rId, double? pri, int index, String iName,
      String cName, int rating, int foodType) {
    // each and every time this function call when user tap on plus and get data and make addition of regular data..
    // onTapItem = true;
    var price = 0.0;
    var quantity = 0.0;
    displayPrice = 0.0;
    displayquantity = 0.0;

    newmainList!.forEach((element) {
      // if (cId == element['id']!.first['id']) {
      element['list']!.forEach((ele) {
        if (ele['rId'] == rId) {
          price = ele['p'];
          quantity = ele['q'];

          quantity = quantity + 1;

          price = (pri! * quantity);

          print('------------>$price');
          print('------------>$quantity');

          ele['p'] = price;
          ele['q'] = quantity;
        }
      });
      // }
    });

    Map<String, dynamic> value = {
      'rId': rId,
      'p': pri, //subelement['p'],
      'q': quantity,
      'itemName': iName,
      'cName': cName,
      'rating': rating,
      'cId': cId,
      'foodType': foodType
    };

    orderdata[index] = value;
    notifyListeners();

    print('-------------new order list $orderdata');

    newmainList!.forEach((element) {
      element['list']!.forEach((ele) {
        displayPrice = displayPrice + ele['p'];
        displayquantity = displayquantity + ele['q'];
        notifyListeners();
      });
    });

    print('---->after add $newmainList');
    print('----->price $displayPrice');
    print('----->quantity $displayquantity');
  }

  minus(int cId, String rId, double? pri, int index, String iName, String cName,
      int rating) {
    var price = 0.0;
    var quantity = 0.0;

    displayPrice = 0.0;
    displayquantity = 0.0;

    newmainList!.forEach((element) {
      // if (cId == element['id']!.first['id']) {
      element['list']!.forEach((ele) {
        if (ele['rId'] == rId) {
          if (ele['q'] > 0) {
            price = ele['p'];
            quantity = ele['q'];

            quantity = quantity - 1;

            price = (pri! * quantity);

            print('------------>$price');
            print('------------>$quantity');

            ele['p'] = price;
            ele['q'] = quantity;
          } else if (ele['q'] < 1) {
            onOrderTapMinusFun(rId);
          }
        }
      });
      // }
    });

    Map<String, dynamic> value = {
      'rId': rId,
      'p': pri, //subelement['p'],
      'q': quantity,
      'itemName': iName,
      'cName': cName,
      'rating': rating,
      'cId': cId
    };

    orderdata[index] = value;
    notifyListeners();

    newmainList!.forEach((element) {
      element['list']!.forEach((ele) {
        displayPrice = displayPrice + ele['p'];
        displayquantity = displayquantity + ele['q'];
        notifyListeners();
      });
    });

    if (displayPrice == 0.0) {
      onTapItem = false;
      notifyListeners();
    }

    print('---->after add $newmainList');
    print('----->price $displayPrice');
    print('----->quantity $displayquantity');
  }

  List<Map<String, dynamic>> orderList = [];

  // void onOrderTapFun(int cId, String rId, double? pri){
  //
  //   print("rId = = = = = = = => $rId");
  //
  //   for(int i=0;i<orderList.length;i++){
  //     if(orderList[i]['rId'] == rId){
  //       orderList[i]['value'] = 1;
  //       notifyListeners();
  //     }
  //   }
  //   // plus(cId,rId,pri);
  //   print("==================> : $orderList");
  // }

  void onOrderTapMinusFun(String rId) {
    print("rId = = = = = = = => $rId");

    for (int i = 0; i < orderList.length; i++) {
      if (orderList[i]['rId'] == rId) {
        orderList[i]['value'] = 0;
        notifyListeners();
      }
    }
    print("==================> : $orderList");
  }

  void onDelete(
    int index,
    int cId,
    String rId,
  ) {
    orderdata.removeAt(index);
    // newmainList!.forEach((element) {
    //   if(cId == element['id']!.first['id']){
    //     element['list']!.forEach((ele) {
    //       if(ele['rId'] == rId){
    //           ele['p'] = 0.0;
    //           ele['q'] = 0;
    //       }
    //     });
    //   }
    // });
    print("====newmain lis : $newmainList");
    notifyListeners();
  }

  void onPlaceOrderData() {
    Get.to(() => ChoicePaymentScreen(
          displayPrice: displayPrice,
          displayquantity: displayquantity,
          newmainList:newmainList,
        ));
  }

  final formKey = GlobalKey<FormState>();
  TextEditingController tipController = TextEditingController();
  String selectedTip = "30";
  String otherTip = "";
  bool other = false;
  bool isSwitched1 = false;
  bool isSwitched2 = false;

  void SelectedOnTap(String selected) {
    selectedTip = selected;
    otherTip = "";
    tipController.text = "";
    notifyListeners();
  }

  onSwitchChange1(bool value) {
    isSwitched1 = value;
    notifyListeners();
  }

  onSwitchChange2(bool value) {
    isSwitched2 = value;
    notifyListeners();
  }

  void onOtherChange(String value) {
    // selectedTip = "";
    otherTip = tipController.text;
    notifyListeners();
  }

  void ontrueCheck() {
    selectedTip = tipController.text;
    print("- - - - - - - - >>>>> selectedTip : $selectedTip");
    notifyListeners();
  }

  void otherOnTap() {
    other = true;
    selectedTip = "0";
    tipController.text = "";
    notifyListeners();
  }

  void otherOnTapFalse() {
    other = false;
    notifyListeners();
  }

// void onPay(){
//   Get.to(()=>SuccessFullScreen());
// }

}
