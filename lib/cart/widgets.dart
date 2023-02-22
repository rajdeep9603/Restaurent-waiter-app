import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_waiter_app/cart/manage_item_provider.dart';
import 'package:flutter_app_waiter_app/screens/home/home_screen.dart';
import 'package:flutter_app_waiter_app/utils/assets_images.dart';
import 'package:flutter_app_waiter_app/utils/colors.dart';
import 'package:flutter_app_waiter_app/utils/common_widgets/common_styleRes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/rating/gf_rating.dart';

Widget cartAppBar(String type) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            // Get.offAll(() => HomeScreen(
            //       type: type,
            //       // backredirectOrderListMap: provider!.newmainList
            //     ));
          },
          child: Container(
              width: 35.h,
              height: 35.h,
              decoration: BoxDecoration(
                color: ColorRes.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Icon(
                Icons.arrow_back_ios_sharp,
                size: 20,
              )),
        ),
        Spacer(
          flex: 2,
        ),
        Text(
          "La Pino'z Pizza",
          style: appTextStyle(
              textColor: ColorRes.black,
              fontWeight: FontWeight.w700,
              fontSize: 18),
        ),
        Spacer(
          flex: 3,
        ),
      ],
    ),
  );
}

Widget dainingDeliveryTime() {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: Get.width / 20.0, vertical: Get.height / 100),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: Get.width,
      // height: Get.height / 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorRes.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                ImageRes.time,
                width: 30,
                height: 30,
                fit: BoxFit.fill,
              ),
              SizedBox(
                width: 12,
              ),
              Text("Daining Delivery ",
                  style: appTextStyle(textColor: ColorRes.black, fontSize: 12)),
              Text("in 20 Mins",
                  style: appTextStyle(
                      textColor: ColorRes.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700)),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: Get.width,
            height: Get.height / 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: ColorRes.saff, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your total saving",
                    style: appTextStyle(
                        textColor: ColorRes.saff,
                        fontSize: 12,
                        fontWeight: FontWeight.w700),
                  ),
                  Text("\$" + "20.00",
                      style: appTextStyle(
                          textColor: ColorRes.saff,
                          fontSize: 12,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget offerBox() {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: Get.width / 20.0, vertical: Get.height / 100),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      width: Get.width,
      // height: Get.height / 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorRes.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("Offers ",
                  style: appTextStyle(
                      textColor: ColorRes.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
              SizedBox(
                width: 12,
              ),
              Image.asset(
                ImageRes.offer,
                width: 20,
                height: 20,
                fit: BoxFit.fill,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text("Select a coupon code ",
              style: appTextStyle(
                  textColor: ColorRes.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w500)),
          Row(
            children: [
              Text("Save" + " \$" + "20 with code",
                  style: appTextStyle(
                      textColor: ColorRes.cusgrey,
                      fontSize: 11,
                      fontWeight: FontWeight.w500)),
              Spacer(),
              DottedBorder(
                color: ColorRes.saff,
                borderType: BorderType.RRect,
                padding: EdgeInsets.all(6),
                radius: Radius.circular(12),
                child: Container(
                  child: Text("WELCOME20",
                      style: appTextStyle(
                          textColor: ColorRes.saff,
                          fontSize: 11,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              Spacer(
                flex: 3,
              ),
              Column(
                children: [
                  Text("View Offers",
                      style: appTextStyle(
                          textColor: ColorRes.saff,
                          fontSize: 12,
                          fontWeight: FontWeight.w500)),
                  Container(
                    width: Get.width / 5,
                    height: 2,
                    color: ColorRes.saff,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget tipBox(ManageItemQuantityProvider provider) {
  return Padding(
    padding: EdgeInsets.symmetric(
        horizontal: Get.width / 20.0, vertical: Get.height / 100),
    child: Container(
      width: Get.width,
      // height: Get.height / 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorRes.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Please tip your delivery partner",
              style: appTextStyle(
                  textColor: ColorRes.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            // Text("\$ " + "${widget.totalAmount!.toInt().toString()}",style: appTextStyle(textColor: ColorRes.black)),
            SizedBox(
              height: 5,
            ),
            Text(
              "Support your delivery partner and make their day 100% of ",
              maxLines: 1,
              style: appTextStyle(
                  textColor: ColorRes.cusgrey,
                  fontSize: 10,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "your tip wil be transfered to them ",
              maxLines: 1,
              style: appTextStyle(
                  textColor: ColorRes.cusgrey,
                  fontWeight: FontWeight.w700,
                  fontSize: 10),
            ),
            // Text("\$ " + "${5.toString()}",style: appTextStyle(textColor: ColorRes.black)),
            SizedBox(height: 10),
            Row(
              children: [
                provider!.other == true
                    ? InkWell(
                        onTap: () {
                          provider!.otherOnTapFalse();
                        },
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                provider!.ontrueCheck();
                              },
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  border: Border.all(color: ColorRes.green),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(Icons.check),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: ColorRes.red),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Icon(Icons.clear_rounded),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15),
                              child: Container(
                                  width: Get.width / 3,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    controller: provider!.tipController,
                                    onChanged: (value) {
                                      provider!.onOtherChange;
                                    },
                                  )),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        width: 200,
                        height: 50,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                provider!.SelectedOnTap("30");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: Get.width / 6,
                                height: Get.height / 20,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: provider!.selectedTip == "30"
                                          ? ColorRes.red
                                          : ColorRes.saff),
                                  color: provider!.selectedTip == "30"
                                      ? ColorRes.saff
                                      : ColorRes.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        ImageRes.tip,
                                        width: 17,
                                        height: 17,
                                        fit: BoxFit.fill,
                                        color: provider!.selectedTip == "30"
                                            ? ColorRes.white
                                            : ColorRes.saff,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "\$" + "30",
                                        style: appTextStyle(
                                            textColor:
                                                provider!.selectedTip == "30"
                                                    ? ColorRes.white
                                                    : ColorRes.saff,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                provider!.SelectedOnTap("50");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: Get.width / 6,
                                height: Get.height / 20,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: provider!.selectedTip == "50"
                                          ? ColorRes.red
                                          : ColorRes.saff),
                                  color: provider!.selectedTip == "50"
                                      ? ColorRes.saff
                                      : ColorRes.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        ImageRes.tip,
                                        width: 17,
                                        height: 17,
                                        fit: BoxFit.fill,
                                        color: provider!.selectedTip == "50"
                                            ? ColorRes.white
                                            : ColorRes.saff,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "50",
                                        style: appTextStyle(
                                            textColor:
                                                provider!.selectedTip == "50"
                                                    ? ColorRes.white
                                                    : ColorRes.saff,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () {
                                provider!.SelectedOnTap("80");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: Get.width / 6,
                                height: Get.height / 20,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: provider!.selectedTip == "80"
                                          ? ColorRes.red
                                          : ColorRes.saff),
                                  color: provider!.selectedTip == "80"
                                      ? ColorRes.saff
                                      : ColorRes.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        ImageRes.tip,
                                        width: 17,
                                        height: 17,
                                        fit: BoxFit.fill,
                                        color: provider!.selectedTip == "80"
                                            ? ColorRes.white
                                            : ColorRes.saff,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "80",
                                        style: appTextStyle(
                                            textColor:
                                                provider!.selectedTip == "80"
                                                    ? ColorRes.white
                                                    : ColorRes.saff,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                Spacer(),
                InkWell(
                  onTap: () {
                    provider!.SelectedOnTap("other");
                    provider!.otherOnTap();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width / 4.5,
                    height: Get.height / 20,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: provider!.selectedTip == "other"
                              ? ColorRes.red
                              : ColorRes.saff),
                      color: provider!.selectedTip == "other"
                          ? ColorRes.saff
                          : ColorRes.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      "other",
                      style: appTextStyle(
                          textColor: provider!.selectedTip == "other"
                              ? ColorRes.white
                              : ColorRes.saff),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    CupertinoSwitch(
                      onChanged: (bool value) {
                        provider!.onSwitchChange1(value);
                      },
                      value: provider!.isSwitched1,
                      activeColor: ColorRes.saff,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Save tip for naxt order",
                      style: appTextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          textColor: ColorRes.cusgrey),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: [
                    CupertinoSwitch(
                      onChanged: (bool value) {
                        provider!.onSwitchChange2(value);
                      },
                      value: provider!.isSwitched2,
                      activeColor: ColorRes.saff,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Takeout your order",
                      style: appTextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          textColor: ColorRes.cusgrey),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget cartOrderList(ManageItemQuantityProvider provider) {
  return Container(
    width: Get.width,
    // height: Get.height/4,
    decoration: BoxDecoration(),
    child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        itemCount: provider.orderdata.length,
        itemBuilder: (context, int index) {
          // for checkorder is used for check into the cart order if order quantity become zero then after remove from cart order list..
          var checkorder;
          provider.orderList.forEach((element) {
            if (element['rId'] == provider.orderdata[index]["rId"]) {
              checkorder = element['value'];
            }
          });



          return checkorder == 1
              ? SwipeActionCell(
                  key: ObjectKey(provider!.orderdata[index]),
                  firstActionWillCoverAllSpaceOnDeleting: true,
                  trailingActions: <SwipeAction>[
                    SwipeAction(
                        onTap: (CompletionHandler handler) async {
                          await handler(true);
                          provider!.onSwipeDelete(
                              index,
                              provider!.orderdata[index]["cId"],
                              provider!.orderdata[index]["rId"].toString());
                        },
                        icon: Icon(
                          Icons.delete,
                          color: ColorRes.white,
                        )),
                  ],
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Get.width / 20.0,
                        vertical: Get.height / 100),
                    child: Container(
                      width: Get.width,
                      // height: Get.height / 9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorRes.white,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: Get.width / 30,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: Get.height / 70,
                              ),
                              InkWell(
                                onTap: () {
                                  // showModalBottomSheet(
                                  //     context: context,
                                  //     builder: (BuildContext context) {
                                  //       return StatefulBuilder(
                                  //         builder: (BuildContext context,
                                  //             StateSetter setState) {
                                  //           return Container(
                                  //             width: Get.width,
                                  //             height: Get.height,
                                  //             decoration: BoxDecoration(
                                  //               color: ColorRes.whitebg,
                                  //               borderRadius: BorderRadius.only(
                                  //                 topLeft: Radius.circular(100),
                                  //                 topRight:
                                  //                     Radius.circular(100),
                                  //               ),
                                  //             ),
                                  //             child: Column(
                                  //               crossAxisAlignment:
                                  //                   CrossAxisAlignment.start,
                                  //               children: [
                                  //                 Container(
                                  //                   width: Get.width,
                                  //                   height: Get.height / 6,
                                  //                   child: ClipRRect(
                                  //                       borderRadius:
                                  //                           BorderRadius
                                  //                               .circular(15),
                                  //                       child: Image.asset(
                                  //                         provider!
                                  //                             .orderdata[index]
                                  //                                 ["q"]
                                  //                             .toString(),
                                  //                         fit: BoxFit.cover,
                                  //                       )),
                                  //                 ),
                                  //                 Padding(
                                  //                   padding: const EdgeInsets
                                  //                           .symmetric(
                                  //                       horizontal: 15.0,
                                  //                       vertical: 12),
                                  //                   child: Column(
                                  //                     crossAxisAlignment:
                                  //                         CrossAxisAlignment
                                  //                             .start,
                                  //                     children: [
                                  //                       Text(
                                  //                         "Double Cheese Margerita Pizza",
                                  //                         style: appTextStyle(
                                  //                             fontSize: 16,
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .w700,
                                  //                             textColor:
                                  //                                 ColorRes
                                  //                                     .black),
                                  //                       ),
                                  //                       SizedBox(
                                  //                         height: 10,
                                  //                       ),
                                  //
                                  //                       Container(
                                  //                         // width: Get.width/3,
                                  //                         // height: Get.height/10,
                                  //
                                  //                         decoration:
                                  //                             BoxDecoration(
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(
                                  //                                       20),
                                  //                           border: Border.all(
                                  //                               color: ColorRes
                                  //                                   .saff),
                                  //                         ),
                                  //                         child: GFRating(
                                  //                           color:
                                  //                               ColorRes.green,
                                  //                           defaultIcon: Icon(
                                  //                             Icons.star,
                                  //                             size: 13,
                                  //                             color: ColorRes
                                  //                                 .grey
                                  //                                 .withOpacity(
                                  //                                     0.7),
                                  //                           ),
                                  //                           size: 15,
                                  //                           // value: 2,
                                  //                           value: provider!
                                  //                               .orderdata[
                                  //                                   index]
                                  //                                   ['rating']
                                  //                               .toDouble(),
                                  //                           // showTextForm: true,
                                  //                           // controller: _ratingController,
                                  //                           onChanged: (double
                                  //                               rating) {},
                                  //                         ),
                                  //                       ),
                                  //                       SizedBox(
                                  //                         height: 10,
                                  //                       ),
                                  //
                                  //                       Divider(
                                  //                         color: ColorRes.saff,
                                  //                         thickness: 2,
                                  //                       ),
                                  //                       SizedBox(
                                  //                         height: 10,
                                  //                       ),
                                  //
                                  //                       Text(
                                  //                         "Cusomize your order",
                                  //                         style: appTextStyle(
                                  //                             fontSize: 16,
                                  //                             fontWeight:
                                  //                                 FontWeight
                                  //                                     .w700,
                                  //                             textColor:
                                  //                                 ColorRes
                                  //                                     .black),
                                  //                       ),
                                  //
                                  //                       Container(
                                  //                         width: Get.width,
                                  //                         // height: Get.height/4,
                                  //                         decoration:
                                  //                             BoxDecoration(
                                  //                           color:
                                  //                               ColorRes.white,
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .circular(
                                  //                                       20),
                                  //                         ),
                                  //                         child: Padding(
                                  //                           padding:
                                  //                               const EdgeInsets
                                  //                                   .all(15.0),
                                  //                           child: TextField(
                                  //                             keyboardType:
                                  //                                 TextInputType
                                  //                                     .multiline,
                                  //                             minLines: 3,
                                  //                             maxLines: 3,
                                  //                             decoration: InputDecoration(
                                  //                                 border:
                                  //                                     InputBorder
                                  //                                         .none,
                                  //                                 hintText:
                                  //                                     'Enter text here...'),
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                       // SizedBox(height: 10),
                                  //                       Row(
                                  //                         children: [
                                  //                           Container(
                                  //                             decoration:
                                  //                                 BoxDecoration(
                                  //                               border: Border.all(
                                  //                                   color: ColorRes
                                  //                                       .saff),
                                  //                               borderRadius:
                                  //                                   BorderRadius
                                  //                                       .circular(
                                  //                                           20),
                                  //                             ),
                                  //                             child: Row(
                                  //                               children: [
                                  //                                 Column(
                                  //                                   children: [
                                  //                                     Column(
                                  //                                       children: [
                                  //                                         SizedBox(
                                  //                                           height:
                                  //                                               5,
                                  //                                         ),
                                  //                                         Container(
                                  //                                           child:
                                  //                                               InkWell(
                                  //                                             onTap: () {
                                  //                                               print("minus");
                                  //                                               setState(() {
                                  //                                                 provider!.minus(provider!.orderdata[index]["cId"], provider!.orderdata[index]["rId"].toString(), provider!.orderdata[index]['p'], index, provider!.orderdata[index]['itemName'], provider!.orderdata[index]['cName'], provider!.orderdata[index]['rating']);
                                  //                                               });
                                  //                                             },
                                  //                                             child: Column(
                                  //                                               children: [
                                  //                                                 Icon(
                                  //                                                   Icons.minimize,
                                  //                                                   size: 22,
                                  //                                                   color: ColorRes.saff,
                                  //                                                 ),
                                  //                                                 SizedBox(
                                  //                                                   height: 8,
                                  //                                                 ),
                                  //                                               ],
                                  //                                             ),
                                  //                                           ),
                                  //                                           // width: 20,
                                  //                                           // height: 25,
                                  //                                         ),
                                  //                                       ],
                                  //                                     ),
                                  //                                     SizedBox(
                                  //                                       height:
                                  //                                           5,
                                  //                                     ),
                                  //                                   ],
                                  //                                 ),
                                  //                                 Column(
                                  //                                   children: [
                                  //                                     SizedBox(
                                  //                                         height:
                                  //                                             10),
                                  //                                     Text(
                                  //                                       // widget.redirectMap![index]["total"] > 0 ?  widget.redirectMap![index]["total"].toString() : "ADD",
                                  //                                       provider!
                                  //                                           .orderdata[index]['q']
                                  //                                           .toInt()
                                  //                                           .toString(),
                                  //
                                  //                                       // "sd",
                                  //                                       style: appTextStyle(
                                  //                                           textColor:
                                  //                                               ColorRes.black,
                                  //                                           fontWeight: FontWeight.bold,
                                  //                                           fontSize: 13),
                                  //                                     ),
                                  //                                   ],
                                  //                                 ),
                                  //                                 InkWell(
                                  //                                   onTap: () {
                                  //                                     setState(
                                  //                                         () {
                                  //                                       provider!.plus(
                                  //                                           provider!.orderdata[index]["cId"],
                                  //                                           provider!.orderdata[index]["rId"].toString(),
                                  //                                           provider!.orderdata[index]['p'],
                                  //                                           index,
                                  //                                           provider!.orderdata[index]['itemName'],
                                  //                                           provider!.orderdata[index]['cName'],
                                  //                                           provider!.orderdata[index]['rating']);
                                  //                                     });
                                  //                                     print(
                                  //                                         "add");
                                  //                                     // provider!.plus(index);
                                  //                                   },
                                  //                                   child:
                                  //                                       Column(
                                  //                                     children: [
                                  //                                       SizedBox(
                                  //                                         height:
                                  //                                             8,
                                  //                                       ),
                                  //                                       Container(
                                  //                                         child:
                                  //                                             Icon(
                                  //                                           Icons.add,
                                  //                                           color:
                                  //                                               ColorRes.saff,
                                  //                                           size:
                                  //                                               22,
                                  //                                         ),
                                  //
                                  //                                         // width: 30,
                                  //                                         // height: 30,
                                  //                                       ),
                                  //                                     ],
                                  //                                   ),
                                  //                                 ),
                                  //                                 // InkWell(
                                  //                                 //     onTap: (){
                                  //                                 //       // provider!.onDelete(index,provider!.orderdata[index]["cId"],provider!.orderdata[index]["rId"].toString());
                                  //                                 //     },
                                  //                                 //     child: Icon(Icons.delete,color: ColorRes.red,))
                                  //                               ],
                                  //                             ),
                                  //                           ),
                                  //                           SizedBox(width: 10),
                                  //                           Expanded(
                                  //                             child: Container(
                                  //                               alignment:
                                  //                                   Alignment
                                  //                                       .center,
                                  //                               height:
                                  //                                   Get.height /
                                  //                                       15,
                                  //                               decoration:
                                  //                                   BoxDecoration(
                                  //                                 color:
                                  //                                     ColorRes
                                  //                                         .saff,
                                  //                                 borderRadius:
                                  //                                     BorderRadius
                                  //                                         .circular(
                                  //                                             12),
                                  //                               ),
                                  //                               child: Padding(
                                  //                                 padding: const EdgeInsets
                                  //                                         .symmetric(
                                  //                                     horizontal:
                                  //                                         10),
                                  //                                 child: Row(
                                  //                                   mainAxisSize:
                                  //                                       MainAxisSize
                                  //                                           .min,
                                  //                                   children: [
                                  //                                     Text(
                                  //                                       "Add Items ",
                                  //                                       style: appTextStyle(
                                  //                                           textColor: ColorRes
                                  //                                               .white,
                                  //                                           fontSize:
                                  //                                               15,
                                  //                                           fontWeight:
                                  //                                               FontWeight.bold),
                                  //                                     ),
                                  //                                     Text(
                                  //                                         "\$" +
                                  //                                             "${provider!.orderdata[index]['p'].toInt().toString()}",
                                  //                                         style: appTextStyle(
                                  //                                             textColor: ColorRes.white,
                                  //                                             fontSize: 15,
                                  //                                             fontWeight: FontWeight.bold)),
                                  //                                     SizedBox(
                                  //                                       height:
                                  //                                           5,
                                  //                                     ),
                                  //                                   ],
                                  //                                 ),
                                  //                               ),
                                  //                             ),
                                  //                           ),
                                  //                         ],
                                  //                       )
                                  //                     ],
                                  //                   ),
                                  //                 ),
                                  //               ],
                                  //             ),
                                  //           );
                                  //         },
                                  //       );
                                  //     });
                                },
                                child: Container(
                                  width: Get.width / 6,
                                  height: Get.height / 12,
                                  child: CachedNetworkImage(
                                    imageUrl: "http://via.placeholder.com/200x150",
                                    imageBuilder: (context, imageProvider) => Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: provider!.orderdata[index]["foodType"] == 1 ? AssetImage(ImageRes.vegIcon) : AssetImage(ImageRes.nonvegIcon),
                                            fit: BoxFit.fill,
                                            // colorFilter:
                                            // ColorFilter.mode(Colors.red, BlendMode.colorBurn)
                                          ),
                                      ),
                                    ),
                                    placeholder: (context, url) => Container(),
                                    errorWidget: (context, url, error) =>  Container(),
                                  ),
                                  // child: ClipRRect(
                                  //     borderRadius: BorderRadius.circular(15),
                                  //     child: Image.asset(
                                  //       provider!.orderdata[index]["q"]
                                  //           .toString(),
                                  //       fit: BoxFit.cover,
                                  //     )),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: Get.width / 40),
                          Column(
                            children: [
                              SizedBox(
                                height: Get.height / 100,
                              ),
                              Container(
                                child: Text(
                                  provider!.orderdata[index]["itemName"]
                                      .toString(),
                                  style: appTextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                width: Get.width / 3,
                              ),
                              Text(
                                "\$" +
                                    "${provider!.orderdata[index]['p'].toString()}",
                                style: appTextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    textColor: ColorRes.saff),
                              ),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          Column(
                            children: [
                              // SizedBox(height:Get.height/40,),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        child: InkWell(
                                          onTap: () {
                                            print("minus");
                                            provider!.minus(
                                                provider!.orderdata[index]
                                                    ["cId"],
                                                provider!.orderdata[index]
                                                        ["rId"]
                                                    .toString(),
                                                provider!.orderdata[index]['p'],
                                                index,
                                                provider!.orderdata[index]
                                                    ['itemName'],
                                                provider!.orderdata[index]
                                                    ['cName'],
                                                provider!.orderdata[index]
                                                    ['rating']);
                                          },
                                          child: Column(
                                            children: [
                                              Icon(
                                                Icons.minimize,
                                                size: 20,
                                                color: ColorRes.white,
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                            ],
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorRes.saff,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        width: 30,
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(height: 10),
                                      Text(
                                        // widget.redirectMap![index]["total"] > 0 ?  widget.redirectMap![index]["total"].toString() : "ADD",
                                        provider.orderdata[index]['q']
                                            .toString(),

                                        // "sd",
                                        style: appTextStyle(
                                            textColor: ColorRes.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      print("add");
                                      provider!.plus(
                                          provider!.orderdata[index]["cId"],
                                          provider!.orderdata[index]["rId"]
                                              .toString(),
                                          provider!.orderdata[index]['p'],
                                          index,
                                          provider!.orderdata[index]
                                              ['itemName'],
                                          provider!.orderdata[index]['cName'],
                                          provider!.orderdata[index]['rating'],
                                          provider!.orderdata[index]['foodType'],
                                      );
                                      // provider!.plus(index);
                                    },
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Container(
                                          child: Icon(
                                            Icons.add,
                                            color: ColorRes.white,
                                            size: 20,
                                          ),
                                          decoration: BoxDecoration(
                                            color: ColorRes.saff,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          width: 30,
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                                  // InkWell(
                                  //     onTap: (){
                                  //       // provider!.onDelete(index,provider!.orderdata[index]["cId"],provider!.orderdata[index]["rId"].toString());
                                  //     },
                                  //     child: Icon(Icons.delete,color: ColorRes.red,))
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Container();
        }),
  );
}

Widget billAmount(ManageItemQuantityProvider provider) {
  return Container(
    width: Get.width,
    // height: Get.height / 5.5,
    decoration: BoxDecoration(
      color: ColorRes.saff.withOpacity(0.1),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Item Total",
                style: appTextStyle(
                    textColor: ColorRes.saff, fontWeight: FontWeight.w700),
              ),
              Text("\$ " + "${provider!.displayPrice.toInt().toString()}",
                  style: appTextStyle(
                      textColor: ColorRes.saff, fontWeight: FontWeight.w700)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Texes & charges",
                style: appTextStyle(
                    textColor: ColorRes.paymentText,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              Text("\$ " + "${5.toString()}",
                  style: appTextStyle(
                      textColor: ColorRes.paymentText,
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Donate" + " \$1 " + "to feeding world",
                style: appTextStyle(
                    textColor: ColorRes.paymentText,
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
              Text("\$ " + "${1}",
                  style: appTextStyle(
                      textColor: ColorRes.paymentText,
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Tip your delivery Partner",
                  style: appTextStyle(
                      textColor: ColorRes.paymentText,
                      fontSize: 14,
                      fontWeight: FontWeight.w700)),
              provider!.other == false
                  ? Text("\$ " + "${provider!.selectedTip.toString()}",
                      style: appTextStyle(
                          textColor: ColorRes.paymentText,
                          fontSize: 14,
                          fontWeight: FontWeight.w700))
                  : Text("\$ " + "${provider!.tipController.text.toString()}",
                      style: appTextStyle(
                          textColor: ColorRes.paymentText,
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Grand Total",
                style: appTextStyle(
                    textColor: ColorRes.saff,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                  "\$ " +
                      "${provider!.displayPrice.toInt() + 5.toInt() + 1.toInt() + int.parse(provider!.selectedTip)}",
                  style: appTextStyle(
                      textColor: ColorRes.saff,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
            ],
          ),
        ],
      ),
    ),
  );
}
