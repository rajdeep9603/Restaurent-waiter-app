import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_waiter_app/screens/table/table_screen.dart';
import 'package:flutter_app_waiter_app/utils/assets_images.dart';
import 'package:flutter_app_waiter_app/utils/colors.dart';
import 'package:flutter_app_waiter_app/utils/common_widgets/common_styleRes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TableDetailScreenCoustmer extends StatefulWidget {
  @override
  _TableDetailScreenCoustmerState createState() => _TableDetailScreenCoustmerState();
}

class _TableDetailScreenCoustmerState extends State<TableDetailScreenCoustmer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorRes.whitebg,
      body:Column(
        children: [
          SizedBox(height: 40.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.h),
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    Get.offAll(()=>TableScreen(selectedMenu: 'table'));
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
              ],
            ),
          ),
          SizedBox(height: 10.h,),
          Padding(
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
              child: Padding(
                padding: EdgeInsets.all(5.0),
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
                          },
                          child: Container(
                            width: Get.width / 8,
                            height: Get.height / 15,
                            child: CachedNetworkImage(
                              imageUrl: "http://via.placeholder.com/200x150",
                              imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:AssetImage(ImageRes.vegIcon),
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
                            "burger",
                            style: appTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          width: Get.width / 3,
                        ),
                        Text(
                          "\$" +
                              "${50.00.toString()}",
                          style: appTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              textColor: ColorRes.saff),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    SizedBox(width: Get.width / 20),
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
                                      // print("minus");
                                      // provider!.minus(
                                      //     provider!.orderdata[index]
                                      //     ["cId"],
                                      //     provider!.orderdata[index]
                                      //     ["rId"]
                                      //         .toString(),
                                      //     provider!.orderdata[index]['p'],
                                      //     index,
                                      //     provider!.orderdata[index]
                                      //     ['itemName'],
                                      //     provider!.orderdata[index]
                                      //     ['cName'],
                                      //     provider!.orderdata[index]
                                      //     ['rating']);
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
                                  "5",

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
                                // provider!.plus(
                                //   provider!.orderdata[index]["cId"],
                                //   provider!.orderdata[index]["rId"]
                                //       .toString(),
                                //   provider!.orderdata[index]['p'],
                                //   index,
                                //   provider!.orderdata[index]
                                //   ['itemName'],
                                //   provider!.orderdata[index]['cName'],
                                //   provider!.orderdata[index]['rating'],
                                //   provider!.orderdata[index]['foodType'],
                                // );
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
          ),

          Padding(
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
              child: Padding(
                padding: EdgeInsets.all(5.0),
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
                          },
                          child: Container(
                            width: Get.width / 8,
                            height: Get.height / 15,
                            child: CachedNetworkImage(
                              imageUrl: "http://via.placeholder.com/200x150",
                              imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:AssetImage(ImageRes.vegIcon),
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
                          "burger",
                            style: appTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          width: Get.width / 3,
                        ),
                        Text(
                          "\$" +
                              "${50.00.toString()}",
                          style: appTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              textColor: ColorRes.saff),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    SizedBox(width: Get.width / 20),
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
                                      // print("minus");
                                      // provider!.minus(
                                      //     provider!.orderdata[index]
                                      //     ["cId"],
                                      //     provider!.orderdata[index]
                                      //     ["rId"]
                                      //         .toString(),
                                      //     provider!.orderdata[index]['p'],
                                      //     index,
                                      //     provider!.orderdata[index]
                                      //     ['itemName'],
                                      //     provider!.orderdata[index]
                                      //     ['cName'],
                                      //     provider!.orderdata[index]
                                      //     ['rating']);
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
                                 "5",

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
                                // provider!.plus(
                                //   provider!.orderdata[index]["cId"],
                                //   provider!.orderdata[index]["rId"]
                                //       .toString(),
                                //   provider!.orderdata[index]['p'],
                                //   index,
                                //   provider!.orderdata[index]
                                //   ['itemName'],
                                //   provider!.orderdata[index]['cName'],
                                //   provider!.orderdata[index]['rating'],
                                //   provider!.orderdata[index]['foodType'],
                                // );
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
          ),

          Padding(
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
              child: Padding(
                padding: EdgeInsets.all(5.0),
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
                          },
                          child: Container(
                            width: Get.width / 8,
                            height: Get.height / 15,
                            child: CachedNetworkImage(
                              imageUrl: "http://via.placeholder.com/200x150",
                              imageBuilder: (context, imageProvider) => Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:AssetImage(ImageRes.vegIcon),
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
                            "burger",
                            style: appTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          width: Get.width / 3,
                        ),
                        Text(
                          "\$" +
                              "${50.00.toString()}",
                          style: appTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              textColor: ColorRes.saff),
                        ),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                    SizedBox(width: Get.width / 20),
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
                                      // print("minus");
                                      // provider!.minus(
                                      //     provider!.orderdata[index]
                                      //     ["cId"],
                                      //     provider!.orderdata[index]
                                      //     ["rId"]
                                      //         .toString(),
                                      //     provider!.orderdata[index]['p'],
                                      //     index,
                                      //     provider!.orderdata[index]
                                      //     ['itemName'],
                                      //     provider!.orderdata[index]
                                      //     ['cName'],
                                      //     provider!.orderdata[index]
                                      //     ['rating']);
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
                                  "5",

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
                                // provider!.plus(
                                //   provider!.orderdata[index]["cId"],
                                //   provider!.orderdata[index]["rId"]
                                //       .toString(),
                                //   provider!.orderdata[index]['p'],
                                //   index,
                                //   provider!.orderdata[index]
                                //   ['itemName'],
                                //   provider!.orderdata[index]['cName'],
                                //   provider!.orderdata[index]['rating'],
                                //   provider!.orderdata[index]['foodType'],
                                // );
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
          ),

          SizedBox(height: Get.height/3.h,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
            child: Container(
              alignment: Alignment.center,
              width: Get.width,
              height: Get.height / 13,
              decoration: BoxDecoration(
                color: ColorRes.saff,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.h,vertical: 2.h),

                // for total display price and total quantity display here..

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          // "55",
                          "Items",style: appTextStyle(textColor: ColorRes.white,fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height:5,),
                        Row(
                          children: [
                            // Text("\$ " + "${provider!.displayPrice.toInt() + 5.toInt() + 1.toInt() + int.parse(provider!.selectedTip)}",style: appTextStyle(textColor: ColorRes.white,fontSize: 15,fontWeight: FontWeight.bold)),
                            Text("\$ " + "${50.00.toInt()}",style: appTextStyle(textColor: ColorRes.white,fontSize: 15,fontWeight: FontWeight.bold)),

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
          SizedBox(height: 5.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: Container(
              alignment: Alignment.center,
              width: Get.width,
              height: Get.height/16,
              decoration: BoxDecoration(
                border: Border.all(color: ColorRes.saff),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.h,vertical: 10.h),
                  child:Text("Add Item",style: appTextStyle(fontWeight: FontWeight.w700,fontSize: 16,textColor: ColorRes.saff))
              ),
            ),
          ),

        ],
      ),
    );
  }
}
