import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_waiter_app/cart/manage_item_provider.dart';
import 'package:flutter_app_waiter_app/cart/widgets.dart';
import 'package:flutter_app_waiter_app/model/get_all_items_model.dart';
import 'package:flutter_app_waiter_app/screens/menu/item_details_screen.dart';
import 'package:flutter_app_waiter_app/utils/colors.dart';
import 'package:flutter_app_waiter_app/utils/common_widgets/common_styleRes.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:provider/provider.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ManageItemScreen extends StatefulWidget {
  int? directHomeTotalAmount;
  int? directHomeTotalQuantity;
  String? type;
  List<Map<String, List<Map<String, dynamic>>>>? redirectOrderListMap;
  GetAllProductsData? apiData;

  ManageItemScreen(
      {this.type,
      this.redirectOrderListMap,
      this.apiData,
      this.directHomeTotalAmount,
      this.directHomeTotalQuantity});

  @override
  _ManageItemScreenState createState() => _ManageItemScreenState();
}

class _ManageItemScreenState extends State<ManageItemScreen> {
  ManageItemQuantityProvider? provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("mainlist=============>>>>>>>>>>>>>${widget.redirectOrderListMap}");
    provider = Provider.of<ManageItemQuantityProvider>(context, listen: false);
    provider!.init(widget.redirectOrderListMap!, widget.apiData,
        widget.directHomeTotalAmount!, widget.directHomeTotalQuantity!,widget.type!);
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ManageItemQuantityProvider>(context, listen: true);
    return WillPopScope(
      onWillPop: () async {
        /*Get.dialog(AlertDialog(
          content: Text("Are you sure want to exit ?"),
          actions: [
            // ignore: deprecated_member_use
            RaisedButton(
              color: ColorRes.red,
              child: Text("Exit",style: appTextStyle(textColor: ColorRes.white),),
              onPressed: (){
                // provider!.finalDisplayPrice = 0;
                // provider!.totalamountList.clear();
                // provider!.totalCount=[0,0,0,0,0,0,0,0,0,0,0];
                // provider!.displayquantity = 0;
                // provider!.onTapItem = false;
                // provider!.currentPage = 0;
                // provider!.selectedtab = 0;
                Get.offAll(()=>HomeScreen(type: widget.type,backredirectOrderListMap:provider!.newmainList));
              },
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              color: ColorRes.green,
              child: Text("close",style: appTextStyle(textColor: ColorRes.white),),
              onPressed: (){
                Get.back();
              },
            ),
          ],
        ));*/
        Get.offAll(() => ItemDetailScreen(
            type: widget.type,
            backredirectOrderListMap: provider!.newmainList,
        selectedMenu: "Menu",
        ));
        return true;
      },
      child: Scaffold(
        backgroundColor: ColorRes.whitebg,
        body: Column(
          children: [
            SizedBox(
              height: Get.height / 20,
            ),
            cartAppBar(widget.type!),
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: provider!.formKey,
                  child: Column(
                    children: [
                      // dainingDeliveryTime(),
                      // offerBox(),
                      // tipBox(provider!),
                      cartOrderList(provider!),
                      SizedBox(
                        height: 10,
                      ),
                      // billAmount(provider!),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: InkWell(
          onTap: () {
            provider!.onPlaceOrderData();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
            child: Container(
              alignment: Alignment.center,
              width: Get.width,
              height: Get.height / 15,
              decoration: BoxDecoration(
                color: ColorRes.saff,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),

                // child: Text(
                //   "Payment Now",
                //   style: appTextStyle(
                //       textColor: ColorRes.white,
                //       fontWeight: FontWeight.w700,
                //       fontSize: 17),
                // ),


                // for total display price and total quantity display here..

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // "55",
                          "${provider!.displayquantity.toInt()}"+" Items",style: appTextStyle(textColor: ColorRes.white,fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height:5,),
                        Row(
                          children: [
                            // Text("\$ " + "${provider!.displayPrice.toInt() + 5.toInt() + 1.toInt() + int.parse(provider!.selectedTip)}",style: appTextStyle(textColor: ColorRes.white,fontSize: 15,fontWeight: FontWeight.bold)),
                            Text("\$ " + "${provider!.displayPrice.toInt()}",style: appTextStyle(textColor: ColorRes.white,fontSize: 15,fontWeight: FontWeight.bold)),

                              SizedBox(width:5),
                            Text(
                              "plus taxes",style: appTextStyle(textColor: ColorRes.white,fontSize: 12,fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Place Order",style: appTextStyle(textColor: ColorRes.white,fontSize: 14,fontWeight: FontWeight.w700)),
                        Icon(Icons.arrow_forward_ios_rounded,color: ColorRes.white,size:20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
