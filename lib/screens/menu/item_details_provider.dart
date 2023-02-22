import 'package:flutter/cupertino.dart';
import 'package:flutter_app_waiter_app/api/get_all_items.dart';
import 'package:flutter_app_waiter_app/cart/manage_item_quantity_screen.dart';
import 'package:flutter_app_waiter_app/model/get_all_items_model.dart';
import 'package:flutter_app_waiter_app/utils/assets_images.dart';
import 'package:get/get.dart';

class ItemDetailProvider with ChangeNotifier {
  GetAllProductsData allItems = GetAllProductsData();
  int selectedItem = 0;
  bool dataLoaded = false;
  bool onAddTap = false;
  List<bool> onOrderTapList = [];
  int currentPage = 0;
  int selectedtab = 0;
  int selectedBottem = 0;

  int averageRating = 0;

  double displayPrice = 0.0;
  double displayquantity = 0.0;
  bool onTapItem = false;
  String?  foodType;

  List<EmimList> selectedTabGridList = [];

  String selectedMenu = "menu";

  List<String> dropItems = ["Veg", "Non-veg", "Mix"];

  String dropdownvalueFoodType = "Veg";

  Future<void> dropdownChangeValue(String dropValue) async {
    dropdownvalueFoodType = dropValue;
    if (dropdownvalueFoodType == "Veg") {
      foodType = "1";
      await getAllItems(foodType!);
      // getMainListLength();
      notifyListeners();
    } else if (dropdownvalueFoodType == "Non-veg") {
      foodType = "2";
      await getAllItems(foodType!);
      // getMainListLength();
      notifyListeners();
    } else {
      foodType = "3";
      await getAllItems(foodType!);
      // getMainListLength();
      notifyListeners();
    }
    notifyListeners();
  }

  void selectedMenuBtn(String selected) {
    selectedMenu = selected;
    notifyListeners();
  }

  Future<void> init(
      String itemId,
      List<Map<String, List<Map<String, dynamic>>>> backredirectOrderListMap,
      String backselectedMenu) async {
    displayPrice = 0.0;
    displayquantity = 0.0;
    selectedMenu = backselectedMenu;
    foodType = itemId;
    // mainMainList = backredirectOrderListMap;

    // dropdownvalueFoodType = itemId;
    if (backredirectOrderListMap.isEmpty ||
        backredirectOrderListMap == null ||
        backredirectOrderListMap != [] ||
        backredirectOrderListMap.length != 0
    ) {

       getAllItems(itemId);


      //notifyListeners();
    }

    else{

      mainMainList = backredirectOrderListMap;
      mainMainList.forEach((element) {
        element['list']!.forEach((ele) {
          displayPrice = displayPrice + ele['p'];
          displayquantity = displayquantity + ele['q'];
          // notifyListeners();
          if (ele['q'] != 0) {
            orderList.forEach((order) {
              if (order['rId'] == ele['rId']) {
                order['value'] = 1;
              }
            });
          }
        });
      });

      print(
          "orderListorderListorderList= = = = = = = = = > > > >>  : $orderList");
      print("= = = = = = = = = > > > >>  : $mainMainList");
    }
  }

  getAllItems(String itemId) {
    dataLoaded = true;
    // orderList = [];
    GetAllItemsData.getAllItems(itemId: itemId).then((value) async {
      dataLoaded = false;
      if (value != null) {
        dataLoaded = false;
        allItems = value;
        print("=========>>>>>-------$allItems");
        selectedItem = 1;
        // selectedtab = 0;

        // if (mainMainList.isEmpty) {
          await getMainListLength();
          // getSubListLength();
        // }
        notifyListeners();
      } else {
        allItems = GetAllProductsData(data: null);
        dataLoaded = false;
      }
    });
    dataLoaded = false;
  }

  changeTab(int index) {
    selectedItem = allItems.data!.emcmList![index].categoryId!;
    selectedtab = index;
    notifyListeners();
  }

  List<Map<String, dynamic>> gridlist = [
    {"image1": ImageRes.bur1, "title": "Medium cheese berger", "price": "23"},
    {
      "image1": ImageRes.bur2,
      "title": "Spicy paneer veg berger",
      "price": "10"
    },
    {"image1": ImageRes.bur1, "title": "Medium cheese berger", "price": "15"},
    {
      "image1": ImageRes.bur2,
      "title": "Spicy paneer veg berger",
      "price": "20"
    },
    {"image1": ImageRes.bur1, "title": "Medium cheese berger", "price": "30"},
    {
      "image1": ImageRes.bur2,
      "title": "Spicy paneer veg berger",
      "price": "35"
    },
    {"image1": ImageRes.bur1, "title": "Medium cheese berger", "price": "45"},
    {
      "image1": ImageRes.bur2,
      "title": "Spicy paneer veg berger",
      "price": "50"
    },
    {"image1": ImageRes.bur1, "title": "Medium cheese berger", "price": "80"},
    {
      "image1": ImageRes.bur2,
      "title": "Spicy paneer veg berger",
      "price": "23"
    },
    {"image1": ImageRes.bur1, "title": "Medium cheese berger", "price": "23"},
  ];

  // List<Map<String, List<Map<String, dynamic>>>> mainList = [];
  List<Map<String, List<Map<String, dynamic>>>> mainMainList = [
    {
      'type': [
        {'t': '1'}
      ],
      'list': []
    },
    {
      'type': [
        {'t': '2'}
      ],
      'list': []
    },
  ];

  // var dq;

  void plus(int cId, String rId, double? pri) {
    onTapItem = true;
    var price = 0.0;
    var quantity = 0.0;

    displayPrice = 0.0;
    displayquantity = 0.0;

    mainMainList.forEach((Mainelement) {
      Mainelement['list']!.forEach((Listelement) {
        if (Listelement['rId'] == rId) {
          price = Listelement['p'];
          quantity = Listelement['q'];
          quantity = quantity + 1;
          price = (pri! * quantity);
          print('------------>$price');
          print('------------>$quantity');

          Listelement['p'] = price;
          Listelement['q'] = quantity;
          notifyListeners();
        }
      });
    });

    mainMainList.forEach((Mainelement) {
      Mainelement['list']!.forEach((ele) {
        displayPrice = displayPrice + ele['p'];
        displayquantity = displayquantity + ele['q'];
        notifyListeners();
      });
    });

    // mainList.forEach((element) {
    //   if (cId == element['id']!.first['id']) {
    //     element['list']!.forEach((ele) {
    //       if (ele['rId'] == rId) {
    //         price = ele['p'];
    //         quantity = ele['q'];
    //
    //         quantity = quantity + 1;
    //
    //         price = (pri! * quantity);
    //
    //         print('------------>$price');
    //         print('------------>$quantity');
    //
    //         ele['p'] = price;
    //         ele['q'] = quantity;
    //       }
    //     });
    //   }
    // });
    //
    // mainList.forEach((element) {
    //   element['list']!.forEach((ele) {
    //     displayPrice = displayPrice + ele['p'];
    //     displayquantity = displayquantity + ele['q'];
    //     notifyListeners();
    //   });
    // });

    print('---->after add $mainMainList');
    print('----->price $displayPrice');
    print('----->quantity $displayquantity');
  }

  void minus(int cId, String rId, double? pri) {
    var price = 0.0;
    var quantity = 0.0;

    displayPrice = 0.0;
    displayquantity = 0.0;

    mainMainList.forEach((element) {
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
        /*else if(ele['q']==0){
            onOrderTapMinusFun(rId);
          }*/
      });
    });

    mainMainList.forEach((element) {
      element['list']!.forEach((ele) {
        displayPrice = displayPrice + ele['p'];
        displayquantity = displayquantity + ele['q'];
        notifyListeners();
      });
    });

    if (displayPrice == 0.0) {
      // onOrderTapMinusFun(rId);
      onTapItem = false;
      // onOrderTap = false;
      notifyListeners();
    }

    print('----->price $displayPrice');
    print('----->quantity $displayquantity');
  }

  getMainListLength() {
    //* * *  mainList = [];
    mainMainList.forEach((mainElement) {
      List<Map<String, dynamic>> lol = [];
      Map<String, dynamic> orderValue = {};
      if (mainElement['type']!.first['t'] == foodType) {
        if (mainElement['list']!.isEmpty) {
          allItems.data!.emcmList!.forEach((P) {
            // lol =[];
            allItems.data!.emimList!.forEach((P1) {
              if (P.categoryId == P1.categoryId) {
                Map<String, dynamic> dummy = {
                  'p': 0.0,
                  'q': 0.0,
                  'rId': P1.randomId,
                  'itemName': P1.itemName,
                  'cName': P1.categoryName,
                  'rating': P1.averageRating,
                  'cId': P1.categoryId,
                  'foodType':P1.foodType
                };
                lol.add(dummy);

                orderValue = {'rId': P1.randomId!, 'value': 0};
                orderList.add(orderValue);
              }
            });
            mainElement['list'] = lol;
          });
        }
      }
    });
    print(
        "mainMainListFrom, - - - - - - - -- -- -- -- -- -- - > $mainMainList");
  }

  List<Map<String, dynamic>> orderList = [];

  // getSubListLength() {
  //   Map<String, dynamic> value = {};
  //   Map<String, dynamic> orderValue = {};
  //   List<Map<String, dynamic>> lol = [];
  //   mainList = [];
  //   mainList.forEach((ent) {
  //     lol = [];
  //     allItems.data!.emimList!.forEach((element) {
  //       if (element.categoryId == ent['id']!.first['id']) {
  //         value = {'p': 0.0, 'q': 0, 'rId': element.randomId};
  //         lol.add(value);
  //
  //         //for only check order nothing else
  //         orderValue = {'rId': element.randomId!, 'value': 0};
  //         orderList.add(orderValue);
  //
  //         //ent['list'] = value;
  //       }
  //     });
  //     ent['list'] = lol;
  //     print('----->$lol');
  //     print('orderlist----->$orderList');
  //   });
  //   // mainMainList.add(mainList);
  //   print("mainMainsubList - - ==========----------------->$mainMainList");
  // }

  void onPassData() {
    Get.to(() => ManageItemScreen(
          redirectOrderListMap: mainMainList,
          apiData: allItems,
          type: foodType,
          directHomeTotalAmount: displayPrice.toInt(),
          directHomeTotalQuantity: displayquantity.toInt(),
        ));
  }

  void onOrderTapFun(int cId, String rId, double? pri) {
    print("rId = = = = = = = => $rId");

    for (int i = 0; i < orderList.length; i++) {
      if (orderList[i]['rId'] == rId) {
        orderList[i]['value'] = 1;
        notifyListeners();
      }
    }
    plus(cId, rId, pri);
    print("==================> : $orderList");
  }

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

  void onGridImageTap() {
    // Get.to(()=>SelectItemDetailScreen(tapSelectedTabGridList: selectedTabGridList,type: foodType,apidata: allItems,tapSingleItemScreenBackredirectOrderListMap:mainList,orderListCheckAdd:orderList,));
  }
}
