import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_waiter_app/order_tab/order_tab_provider.dart';
import 'package:flutter_app_waiter_app/screens/menu/item_details_screen.dart';
import 'package:flutter_app_waiter_app/screens/table/table_screen.dart';
import 'package:flutter_app_waiter_app/utils/assets_images.dart';
import 'package:flutter_app_waiter_app/utils/colors.dart';
import 'package:flutter_app_waiter_app/utils/common_widgets/common_styleRes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class OrderTabScreen extends StatefulWidget {
  String? orderTab;
  OrderTabScreen({this.orderTab});
  @override
  _OrderTabScreenState createState() => _OrderTabScreenState();
}

class _OrderTabScreenState extends State<OrderTabScreen> {

  OrderTabProvider? provider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<OrderTabProvider>(context, listen: false);
    provider!.init(widget.orderTab!);
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<OrderTabProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: ColorRes.whitebg,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 17,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
             children: [

               InkWell(
                 onTap: (){
                   Get.back();
                 },
                 child: Container(
                     width: 35.h,
                     height: 35.h,
                     decoration: BoxDecoration(
                       color: ColorRes.white,
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: Icon(
                       Icons.arrow_back_ios_sharp,
                       size: 18,
                     )),
               ),

               Spacer(),

               Text(
                 "Order Status",
                 style: appTextStyle(
                   textColor: ColorRes.black,
                   fontWeight: FontWeight.w700,
                   fontSize: 18,
                 ),
               ),
               Spacer(),
               Spacer(),
             ],
            ),
            SizedBox(
              height: Get.height / 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    provider!.selectedMenuBtn("menu");
                    Get.to(()=>ItemDetailScreen(selectedMenu: "menu",type: "1",backredirectOrderListMap: [],));
                  },
                  child: Container(
                      width: Get.width / 4,
                      // height: Get.height,
                      decoration: BoxDecoration(
                        color: provider!.selectedMenu == "menu" ? ColorRes.saff : ColorRes.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Menu",
                              style: appTextStyle(
                                textColor: provider!.selectedMenu == "menu" ? ColorRes.white : ColorRes.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(ImageRes.menuIcon,color: provider!.selectedMenu == "menu" ? ColorRes.white : ColorRes.grey.withOpacity(0.5),),
                          ],
                        ),
                      )),
                ),
                InkWell(
                  onTap: (){
                    provider!.selectedMenuBtn("table");
                    Get.to(()=>TableScreen(selectedMenu: "table"));
                  },
                  child: Container(
                      width: Get.width / 4,
                      decoration: BoxDecoration(
                        color: provider!.selectedMenu == "table" ? ColorRes.saff : ColorRes.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Table",
                              style: appTextStyle(
                                textColor: provider!.selectedMenu == "table" ? ColorRes.white : ColorRes.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(ImageRes.table,color: provider!.selectedMenu == "table" ? ColorRes.white : ColorRes.grey.withOpacity(0.5)),
                          ],
                        ),
                      )),
                ),
                InkWell(
                  onTap: (){
                    provider!.selectedMenuBtn("order");
                  },
                  child: Container(
                    width: Get.width / 4,
                    decoration: BoxDecoration(
                      color:provider!.selectedMenu == "order" ? ColorRes.saff : ColorRes.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Order",
                            style: appTextStyle(
                              textColor: provider!.selectedMenu == "order" ? ColorRes.white : ColorRes.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Image.asset(ImageRes.order,color: provider!.selectedMenu == "order" ? ColorRes.white : ColorRes.grey.withOpacity(0.54),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height / 40,
            ),
            InkWell(
              onTap: (){
                provider!.pendingOrder();
              },
              child: Container(
                width: Get.width,
                height:Get.height/10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        child: Image.asset(ImageRes.watch),
                      ),
                      Spacer(),
                      Text(
                        "Panding Orders",
                        style: appTextStyle(
                          textColor:ColorRes.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(flex: 5),
                      CircleAvatar(
                        radius: 15,
                        backgroundColor: ColorRes.saff,
                        child:  Text(
                          "3",
                          style: appTextStyle(
                            textColor: ColorRes.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 40,
            ),
            Container(
              width: Get.width,
              height:Get.height/10,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: (){
                    provider!.onTableStatus();
                  },
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          child: Image.asset(ImageRes.status),
                        ),
                        Spacer(),
                        Text(
                          "Table Status",
                          style: appTextStyle(
                            textColor:ColorRes.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Spacer(flex: 5),

                        Container(
                          alignment:Alignment.center,
                          width: 50.h,
                          height: 25,
                          decoration: BoxDecoration(
                            color: ColorRes.saff,
                            borderRadius:BorderRadius.circular(30),
                          ),
                          child: Text(
                            "15/7",
                            style: appTextStyle(
                              textColor:ColorRes.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),



          ],
        ),
      ),
    );
  }
}
