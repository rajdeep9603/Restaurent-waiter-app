import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_waiter_app/order_tab/order_tab_screen.dart';
import 'package:flutter_app_waiter_app/screens/home/home_screen.dart';
import 'package:flutter_app_waiter_app/screens/menu/item_details_provider.dart';
import 'package:flutter_app_waiter_app/screens/table/table_screen.dart';
import 'package:flutter_app_waiter_app/utils/assets_images.dart';
import 'package:flutter_app_waiter_app/utils/colors.dart';
import 'package:flutter_app_waiter_app/utils/common_widgets/common_styleRes.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:getwidget/types/gf_button_type.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget detailAppBar(ItemDetailProvider provider) {
  return Padding(
    padding:  EdgeInsets.symmetric(horizontal: 5.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: (){
            Get.offAll(()=>HomeScreen());
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
        Spacer(flex: 2),
        Text(
          "Menu",
          style: appTextStyle(
              textColor: ColorRes.black,
              fontWeight: FontWeight.w700,
              fontSize: 18),
        ),
        Spacer(),


        DropdownButton(
          isExpanded: false,
           alignment: Alignment.center,
          underline: Container(),

          // Initial Value

          // value: provider.dropdownvalueFoodType,

          // Down Arrow Icon
          icon: const Icon(Icons.menu,color: Colors.black,),

          // Array list of items
          items: provider.dropItems.map((String items) {
            return DropdownMenuItem(

              value: items,
              child: Text(items,style: appTextStyle(textColor: ColorRes.black),),
            );
          }).toList(),
          // After selecting the desired option,it will
          // change button value to selected value

          onChanged: (String? newValue) {
           provider.dropdownChangeValue(newValue!);
          },
        ),
      ],
    ),
  );
}

Widget detailImageSliderWithFullBofy(ItemDetailProvider provider, String type) {
  return Container(
    width: Get.width,
    // height: Get.height/2,
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          // provider!.allItems.data != null ?

          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 6.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    provider.selectedMenuBtn("menu");
                  },
                  child: Container(
                      width: Get.width / 4,
                      // height: Get.height,
                      decoration: BoxDecoration(
                        color: provider.selectedMenu == "menu" ? ColorRes.saff : ColorRes.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Menu",
                              style: appTextStyle(
                                textColor: provider.selectedMenu == "menu" ? ColorRes.white : ColorRes.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(ImageRes.menuIcon,color: provider.selectedMenu == "menu" ? ColorRes.white : ColorRes.grey.withOpacity(0.5),),
                          ],
                        ),
                      )),
                ),

                InkWell(
                  onTap: (){
                    provider.selectedMenuBtn("table");
                    Get.to(()=>TableScreen(selectedMenu: "table"));
                  },
                  child: Container(
                      width: Get.width / 4,
                      decoration: BoxDecoration(
                        color: provider.selectedMenu == "table" ? ColorRes.saff : ColorRes.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Table",
                              style: appTextStyle(
                                textColor: provider.selectedMenu == "table" ? ColorRes.white : ColorRes.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(ImageRes.table,color: provider.selectedMenu == "table" ? ColorRes.white : ColorRes.grey.withOpacity(0.5)),
                          ],
                        ),
                      )),
                ),

                InkWell(
                  onTap: (){
                    provider.selectedMenuBtn("order");
                    Get.to(()=>OrderTabScreen(orderTab: "order"));
                  },
                  child: Container(
                    width: Get.width / 4,
                    decoration: BoxDecoration(
                      color:provider.selectedMenu == "order" ? ColorRes.saff : ColorRes.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Order",
                            style: appTextStyle(
                              textColor: provider.selectedMenu == "order" ? ColorRes.white : ColorRes.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Image.asset(ImageRes.order,color: provider.selectedMenu == "order" ? ColorRes.white : ColorRes.grey.withOpacity(0.54),),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 12.h),


          Text(
            "Categories",
            style: appTextStyle(
                textColor: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 5.h),
          Container(
            width: Get.width,
            height: Get.height / 9,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: provider.allItems.data!.emcmList!.length,
                itemBuilder: (context, int index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
                    child: InkWell(
                      onTap: () {
                        // provider!.selectedItem = provider!.allItems.data!.emcmList![index].categoryId!;
                        provider.changeTab(index);
                      },
                      child: Container(
                        width: Get.width / 5.5,
                        // height: Get.height/5,
                        // padding: EdgeInsets.all(5),
                        alignment: Alignment.center,
                        // width: Get.width/5,
                        decoration: BoxDecoration(
                          // color: provider!.selectedtab == index
                          //     ? ColorRes.green
                          //     : ColorRes.white,
                          border: Border.all(
                              color: provider.selectedtab == index &&
                                      provider.allItems.data!.emcmList![index]
                                              .foodType ==
                                          1
                                  ? ColorRes.green
                                  : provider.selectedtab == index &&
                                          provider.allItems.data!
                                                  .emcmList![index].foodType ==
                                              2
                                      ? ColorRes.red
                                      : provider.allItems.data!.emcmList![index]
                                                  .foodType ==
                                              3
                                          ? provider
                                                      .allItems
                                                      .data!
                                                      .emcmList![index]
                                                      .foodType ==
                                                  1
                                              ? ColorRes.green
                                              : provider
                                                          .allItems
                                                          .data!
                                                          .emcmList![index]
                                                          .foodType ==
                                                      2
                                                  ? ColorRes.red
                                                  : ColorRes.yell
                                          : ColorRes.yell,
                              // index &&
                              // widget.type ==
                              //     "mix"
                              // ? ColorRes
                              // .purple
                              // : ColorRes.grey
                              // .withOpacity(
                              // 0.5),
                              width: 2),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: Get.height / 150,
                            ),
                            // SizedBox(height: Get.height/180,),
                            Container(
                              height: Get.height / 10.7,
                              // height: 91,
                              // height: Get.height/11,
                              width: Get.width / 7,
                              decoration: BoxDecoration(
                                color: provider.allItems.data!.emcmList![index]
                                            .foodType ==
                                        1
                                    ? Color(0xFFA9E88B).withOpacity(0.2)
                                    : provider.allItems.data!.emcmList![index]
                                                .foodType ==
                                            2
                                        ? Color(0xFFFBE7E7).withOpacity(0.5)
                                        : Color(0xFFFBE7E7),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: Get.height / 70,
                                  ),
                                  Container(
                                    height: Get.height / 23,
                                    // padding: EdgeInsets.all(10),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        // provider.tabbar[index]["image"]
                                        //     .toString(),

                                        ImageRes.pizza,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height / 150,
                                  ),
                                  Text(
                                    provider.allItems.data!.emcmList![index]
                                        .categoryName
                                        .toString(),
                                    maxLines: 1,
                                    style: appTextStyle(
                                        textColor: provider.selectedtab == index
                                            ? ColorRes.black
                                            : ColorRes.grey,
                                        fontSize: 10.h,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(height: 10.h),
          Text(
            "Recent item ",
            style: appTextStyle(
                textColor: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 5.h),
          detailGridList(provider),

          // type == "1"
          //      ? vegcategoryGrid(provider)
          //      : type == "2"
          //      ? nonvegcategoryGrid(provider)
          //      : mixcategoryGrid(provider),

          provider.onTapItem == true
              ? SizedBox(
                  height: Get.height / 8,
                )
              : SizedBox(),
        ],
      ),
    ),
  );
}

detailGridList(ItemDetailProvider provider) {
  provider.selectedTabGridList = [];
  // provider.onOrderTapList = [];
  // provider.totalCount=[];
  provider.allItems.data!.emimList!.forEach((element) {
    if (element != null) {
      if (element.categoryId == provider.selectedItem) {
        provider.selectedTabGridList.add(element);
        // provider.onOrderTapList.add(false);
        // provider.totalCount.add(0);
      }
    }
  });

  return SingleChildScrollView(
    physics: NeverScrollableScrollPhysics(),
    child: GridView.builder(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.85,
          crossAxisSpacing: 10,
          mainAxisSpacing: 15,
        ),
        itemCount: provider.selectedTabGridList.length,
        itemBuilder: (BuildContext ctx, index) {
          var dq;
          provider.mainMainList.forEach((element) {
            element['list']!.forEach((ele) {
                if (ele['rId'] ==
                    provider.selectedTabGridList[index].randomId) {
                  dq = ele['q'];
              }
            });
          });

          var checkorder;
          provider.orderList.forEach((element) {
            if (element['rId'] ==
                provider.selectedTabGridList[index].randomId) {
              checkorder = element['value'];
            }
          });

          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
            },
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    print(provider.allItems.data!.emimList![index].itemName
                        .toString());
                    // provider.passData(index);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      // color: isSelectedTheme == "Dark"
                      //     ? Themes.lightDark
                      //
                      //     : Colors.white,
                      color: ColorRes.white,
                      // boxShadow: <BoxShadow>[
                      //   BoxShadow(
                      //     color: Colors.white,
                      //     offset: Offset(1, 1),
                      //     blurRadius: 3,
                      //   ),
                      // ],

                      borderRadius: BorderRadius.circular(25),
                    ),
                    // elevation: 1,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width/30.0,vertical: Get.height/100),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Center(
                              child: InkWell(
                                onTap: (){
                                  provider.onGridImageTap();
                                },
                                child: Container(
                                  // width: Get.width / 2,
                                  height: Get.height /6,
                                  padding: EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      provider.gridlist[index]["image1"].toString(),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // // itemTypeDesc
                                  // Text(
                                  //   // provider!.allItems.data!.emimList![index].itemName
                                  //   //     .toString(),
                                  //   provider.selectedTabGridList[index].itemTypeDesc.toString(),
                                  //   textAlign: TextAlign.center,
                                  //   // maxLines: 2,
                                  //   overflow: TextOverflow.ellipsis,
                                  //   style: appTextStyle(
                                  //     fontSize: 15,
                                  //     textColor: ColorRes.black,
                                  //     fontWeight: FontWeight.w600,
                                  //   ),
                                  // ),
                                  //
                                  //
                                  //
                                  // // categoryName
                                  //

                                  Text(
                                    // provider!.allItems.data!.emimList![index].itemName
                                    //     .toString(),

                                    provider.selectedTabGridList[index].itemName
                                        .toString(),

                                    // textAlign: TextAlign.center,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: appTextStyle(
                                      fontSize: 12,
                                      textColor: ColorRes.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        // provider!.allItems.data!.emimList![index].itemName
                                        //     .toString(),
                                        provider.selectedTabGridList[index]
                                            .categoryName
                                            .toString(),

                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: appTextStyle(
                                          fontSize: 10,
                                          textColor: ColorRes.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Container(
                                        // width: Get.width/3,
                                        // height: Get.height/10,
                                        child: GFRating(
                                          color: ColorRes.green,
                                          defaultIcon: Icon(
                                            Icons.star,
                                            size: 12 ,
                                            color: ColorRes.grey.withOpacity(0.7),
                                          ),
                                          size: 15,
                                          // value: 2,
                                          value: provider.allItems.data!
                                              .emimList![index].averageRating!
                                              .toDouble(),
                                          // showTextForm: true,
                                          // controller: _ratingController,
                                          onChanged: (double rating) {},
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(
                                    height: Get.height/150,
                                  ),
                                  Container(
                                    width: Get.width,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "\$" +
                                              "${provider.selectedTabGridList[index].price.toString()}",
                                          textAlign: TextAlign.start,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: appTextStyle(
                                            fontSize: 16,
                                            textColor: ColorRes.saff,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // SizedBox(height: 20,),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 0,
                    right: 5,
                    left: Get.width / 4.3,
                    child: InkWell(
                      onTap: () {
                        provider.onOrderTapFun(
                            provider.selectedTabGridList[index].categoryId!,
                            provider.selectedTabGridList[index].randomId
                                .toString(),
                            provider.selectedTabGridList[index].price);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorRes.saff,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15)),
                        ),
                        width: Get.width / 2.5,
                        height: Get.height / 22,



                        child: checkorder == 1
                            ? Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Column(
                                    children: [
                                      InkWell(
                                        child: Icon(
                                          Icons.minimize,
                                          size: 25,
                                          color: ColorRes.white,
                                        ),
                                        onTap: () async {
                                          provider.minus(
                                              provider
                                                  .selectedTabGridList[index]
                                                  .categoryId!,
                                              provider
                                                  .selectedTabGridList[index]
                                                  .randomId
                                                  .toString(),
                                              provider
                                                  .selectedTabGridList[index]
                                                  .price);
                                          // var index = index;

                                          // await provider.minus(index);

                                          // provider!.onlytotalminus(index);
                                          // provider.minusoperationMapB(index);
                                        },
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(height: 10),
                                      InkWell(
                                        onTap: () {
                                          // provider.boolAddList[index] = true;
                                          // provider.onTapItem = true;

                                          // print(provider.boolAddList);
                                          provider.notifyListeners();
                                        },
                                        child: Text(
                                          // provider.totalCount[index] > 0
                                          //     ? provider.totalCount[index].toString()
                                          //     : "ADD",

                                          // provider.displayquantity > 0 ? provider.displayquantity.toString() : "ADD",
                                          // dq > 0
                                          //     ? dq.toString()
                                          //     :
                                        dq.toString(),
                                          style: appTextStyle(
                                              textColor: ColorRes.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13),
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                      onTap: () async {
                                        provider.plus(
                                            provider.selectedTabGridList[index]
                                                .categoryId!,
                                            provider.selectedTabGridList[index]
                                                .randomId
                                                .toString(),
                                            provider.selectedTabGridList[index]
                                                .price);

                                        // await provider.plus(index,provider.selectedTabGridList[index].randomId.toString());

                                        // provider!.onlytotalplus(index);

                                        // provider.plusoperationMapB(index, provider.selectedTabGridList[index].randomId.toString());
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: ColorRes.white,
                                        size: 22,
                                      )),
                                ],
                              )
                            : Text("ADD",
                                style: appTextStyle(
                                    textColor: ColorRes.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13)),
                      ),
                    ))
              ],
            ),
          );
        }),
  );
}

// nonvegcategoryGrid(HomeScreenProvider provider) {
//   provider!.selectedTabGridList=[];
//   provider!.allItems.data!.emimList!.forEach((element) {
//     if(element!=null){
//       if(element.categoryId == provider!.selectedItem){
//         provider!.selectedTabGridList.add(element);
//       }
//     }
//   });
//   return SingleChildScrollView(
//     physics: NeverScrollableScrollPhysics(),
//     child: GridView.builder(
//         padding: EdgeInsets.zero,
//         physics: NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: 200,
//           childAspectRatio: 0.80,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 15,
//         ),
//         itemCount: provider!.selectedTabGridList.length,
//         itemBuilder: (BuildContext ctx, index) {
//           return InkWell(
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//             onTap: () {
//               // _showInterstitialAd();
//               // Get.to(
//               //       () => QuizLevelScreen(
//               //     id: model.allCategoryData.data![index].id!,
//               //     historyPage: false,
//               //   ),
//               // );
//             },
//             child: Stack(
//               children: [
//                 Container(
//                   margin: EdgeInsets.symmetric(
//                     horizontal: 7,
//                     vertical: 5,
//                   ),
//                   decoration: BoxDecoration(
//                     // color: isSelectedTheme == "Dark"
//                     //     ? Themes.lightDark
//                     //     : Colors.white,
//                     boxShadow: <BoxShadow>[
//                       BoxShadow(
//                         color: Colors.white,
//                         offset: Offset(1, 1),
//                         blurRadius: 3,
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   // elevation: 1,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         flex: 3,
//                         child: Center(
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(vertical: 5),
//                             child: Container(
//                               height: Get.height / 6,
//                               padding: EdgeInsets.all(10),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(20),
//                                 child: Image.asset(
//                                   provider!.nonvegGridlist[index]["image1"]
//                                       .toString(),
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 2,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               width: Get.width,
//                               child: Center(
//                                 child: Text(
//                                   provider!.selectedTabGridList[index].itemName
//                                       .toString(),
//                                   textAlign: TextAlign.center,
//                                   // maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: appTextStyle(
//                                     fontSize: 15,
//                                     textColor: ColorRes.black,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                             ),
//
//                             Container(
//                               width: Get.width,
//                               child: Padding(
//                                 padding:
//                                 EdgeInsets.only(left: Get.width / 30),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "\$" +
//                                           "${provider!.nonvegGridlist[index]["price"].toString()}",
//                                       textAlign: TextAlign.start,
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: appTextStyle(
//                                         fontSize: 15,
//                                         textColor: ColorRes.black,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xFFF5A62E),
//                                       size: 15,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xFFF5A62E),
//                                       size: 15,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xFFF5A62E),
//                                       size: 15,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xFFF5A62E),
//                                       size: 15,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Colors.grey,
//                                       size: 15,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             // SizedBox(height: 20,),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                     bottom: 0,
//                     right: 5,
//                     left: Get.width / 5,
//                     child: Container(
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: ColorRes.saff,
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(15),
//                             bottomRight: Radius.circular(15)),
//                       ),
//                       width: Get.width / 2.5,
//                       height: Get.height / 22,
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Column(
//                             children: [
//                               InkWell(
//                                 child: Icon(
//                                   Icons.minimize,
//                                   size: 25,
//                                   color: ColorRes.white,
//                                 ),
//                                 onTap: () async {
//                                   // var index = index;
//                                   await provider!.minus(index);
//                                   // provider!.onlytotalminus(index);
//                                   provider!.minusoperationMapB(index);
//
//                                 },
//                               ),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               SizedBox(height: 10),
//                               Text(
//                                 provider!.totalCount[index] > 0
//                                     ? provider!.totalCount[index].toString()
//                                     : "ADD",
//                                 style: appTextStyle(
//                                     textColor: ColorRes.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 13),
//                               ),
//                             ],
//                           ),
//                           InkWell(
//                               onTap: () async {
//                                 await provider!.plus(index,provider.allItems.data!.emimList![index].randomId.toString());
//                                 // provider!.onlytotalplus(index);
//
//                                 provider!.plusoperationMapB(index,provider.allItems.data!.emimList![index].randomId.toString());
//                               },
//                               child: Icon(
//                                 Icons.add,
//                                 color: ColorRes.white,
//                                 size: 22,
//                               )),
//                         ],
//                       ),
//                     ))
//               ],
//             ),
//           );
//         }),
//   );
// }
//
// mixcategoryGrid(HomeScreenProvider provider) {
//   provider!.selectedTabGridList=[];
//   provider!.allItems.data!.emimList!.forEach((element) {
//     if(element!=null){
//       if(element.categoryId == provider!.selectedItem){
//         provider!.selectedTabGridList.add(element);
//       }
//     }
//   });
//   return SingleChildScrollView(
//     physics: NeverScrollableScrollPhysics(),
//     child: GridView.builder(
//         padding: EdgeInsets.zero,
//         physics: NeverScrollableScrollPhysics(),
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//           maxCrossAxisExtent: 200,
//           childAspectRatio: 0.80,
//           crossAxisSpacing: 10,
//           mainAxisSpacing: 15,
//         ),
//         itemCount: provider!.selectedTabGridList.length,
//         itemBuilder: (BuildContext ctx, index) {
//           return InkWell(
//             splashColor: Colors.transparent,
//             highlightColor: Colors.transparent,
//             onTap: () {
//               // _showInterstitialAd();
//               // Get.to(
//               //       () => QuizLevelScreen(
//               //     id: model.allCategoryData.data![index].id!,
//               //     historyPage: false,
//               //   ),
//               // );
//             },
//             child: Stack(
//               children: [
//                 Container(
//                   margin: EdgeInsets.symmetric(
//                     horizontal: 7,
//                     vertical: 5,
//                   ),
//                   decoration: BoxDecoration(
//                     // color: isSelectedTheme == "Dark"
//                     //     ? Themes.lightDark
//                     //     : Colors.white,
//                     boxShadow: <BoxShadow>[
//                       BoxShadow(
//                         color: Colors.white,
//                         offset: Offset(1, 1),
//                         blurRadius: 3,
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   // elevation: 1,
//                   child: Column(
//                     children: [
//                       Expanded(
//                         flex: 3,
//                         child: Center(
//                           child: Padding(
//                             padding: EdgeInsets.symmetric(vertical: 5),
//                             child: Container(
//                               height: Get.height / 6,
//                               padding: EdgeInsets.all(10),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(20),
//                                 child: Image.asset(
//                                   provider!.mixGridlist[index]["image1"]
//                                       .toString(),
//                                   fit: BoxFit.fill,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         flex: 2,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               width: Get.width,
//                               child: Center(
//                                 child: Text(
//                                   provider!.selectedTabGridList[index].itemName
//                                       .toString(),
//                                   textAlign: TextAlign.center,
//                                   // maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                   style: appTextStyle(
//                                     fontSize: 15,
//                                     textColor: ColorRes.black,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 ),
//                               ),
//                             ),
//
//                             Container(
//                               width: Get.width,
//                               child: Padding(
//                                 padding:
//                                 EdgeInsets.only(left: Get.width / 30),
//                                 child: Row(
//                                   children: [
//                                     Text(
//                                       "\$" +
//                                           "${provider!.mixGridlist[index]["price"].toString()}",
//                                       textAlign: TextAlign.start,
//                                       maxLines: 1,
//                                       overflow: TextOverflow.ellipsis,
//                                       style: appTextStyle(
//                                         fontSize: 15,
//                                         textColor: ColorRes.black,
//                                         fontWeight: FontWeight.w700,
//                                       ),
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xFFF5A62E),
//                                       size: 15,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xFFF5A62E),
//                                       size: 15,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xFFF5A62E),
//                                       size: 15,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Color(0xFFF5A62E),
//                                       size: 15,
//                                     ),
//                                     Icon(
//                                       Icons.star,
//                                       color: Colors.grey,
//                                       size: 15,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             // SizedBox(height: 20,),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Positioned(
//                     bottom: 0,
//                     right: 5,
//                     left: Get.width / 5,
//                     child: Container(
//                       alignment: Alignment.center,
//                       decoration: BoxDecoration(
//                         color: ColorRes.saff,
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(15),
//                             bottomRight: Radius.circular(15)),
//                       ),
//                       width: Get.width / 2.5,
//                       height: Get.height / 22,
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Column(
//                             children: [
//                               InkWell(
//                                 child: Icon(
//                                   Icons.minimize,
//                                   size: 25,
//                                   color: ColorRes.white,
//                                 ),
//                                 onTap: () async {
//                                   // var index = index;
//                                   await provider!.minus(index);
//                                   // provider!.onlytotalminus(index);
//                                   provider!.minusoperationMapB(index);
//
//                                 },
//                               ),
//                             ],
//                           ),
//                           Column(
//                             children: [
//                               SizedBox(height: 10),
//                               Text(
//                                 provider.totalCount[index] > 0
//                                     ? provider.totalCount[index].toString()
//                                     : "ADD",
//                                 style: appTextStyle(
//                                     textColor: ColorRes.white,
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 13),
//                               ),
//                             ],
//                           ),
//                           InkWell(
//                               onTap: () async {
//                                 await provider.plus(index,provider.allItems.data!.emimList![index].randomId.toString());
//                                 // provider!.onlytotalplus(index);
//
//                                 provider.plusoperationMapB(index,provider.allItems.data!.emimList![index].randomId.toString());
//                               },
//                               child: Icon(
//                                 Icons.add,
//                                 color: ColorRes.white,
//                                 size: 22,
//                               )),
//                         ],
//                       ),
//                     ))
//               ],
//             ),
//           );
//         }),
//   );
// }
