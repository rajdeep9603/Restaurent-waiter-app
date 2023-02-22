import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_waiter_app/screens/home/home_screen.dart';
import 'package:flutter_app_waiter_app/screens/menu/item_details_screen.dart';
import 'package:flutter_app_waiter_app/screens/table/table_screen_provider.dart';
import 'package:flutter_app_waiter_app/utils/assets_images.dart';
import 'package:flutter_app_waiter_app/utils/colors.dart';
import 'package:flutter_app_waiter_app/utils/common_widgets/common_styleRes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class TableScreen extends StatefulWidget {
  String? selectedMenu;
  TableScreen({this.selectedMenu});
  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  TableScreenProvider? provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<TableScreenProvider>(context, listen: false);
    provider!.init(widget.selectedMenu.toString());
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<TableScreenProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: ColorRes.whitebg,
      body:provider!.dataLoaded == true ? Center(child: CircularProgressIndicator()) : Column(
        children: [
          SizedBox(height: Get.height/17,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.h),
            child: Row(
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
            Spacer(),
            Text(
              "Table Situations",
              style: appTextStyle(
                  textColor: ColorRes.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
            Spacer(flex: 2,),
        ],
      ),
          ),
          SizedBox(height: Get.height/45,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                    provider!.selectedMenuBtn("menu");
                    provider!.onMenu();

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
                    // provider!.selectedMenuBtn("table");
                    // Get.to(()=>TableScreen());
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
                    provider!..selectedMenuBtn("order");
                    provider!.onOrder();
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
                            "order",
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
          ),
          // SizedBox(height: Get.height/45,),
          //
          // Expanded(
          //   child: SingleChildScrollView(
          //     child: Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: GridView.builder(
          //           padding: EdgeInsets.zero,
          //           physics: NeverScrollableScrollPhysics(),
          //           shrinkWrap: true,
          //           scrollDirection: Axis.vertical,
          //           gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //             maxCrossAxisExtent: 150,
          //             childAspectRatio: 0.85,
          //             crossAxisSpacing: 10,
          //             mainAxisSpacing: 15,
          //           ),
          //           itemCount: 25,
          //           itemBuilder: (BuildContext ctx, index) {
          //
          //             return InkWell(
          //               onTap: () {
          //                 // print(provider.allItems.data!.emimList![index].itemName
          //                 //     .toString());
          //                 // provider.passData(index);
          //                 provider!.onTableGridTap(index,ImageRes.bur2);
          //
          //               },
          //               child: Container(
          //                 margin: EdgeInsets.symmetric(
          //                   horizontal: 7,
          //                   vertical: 5,
          //                 ),
          //                 decoration: BoxDecoration(
          //                   color: ColorRes.white,
          //                   // color: isSelectedTheme == "Dark"
          //                   //     ? Themes.lightDark
          //                   //     : Colors.white,
          //                   // boxShadow: <BoxShadow>[
          //                   //   BoxShadow(
          //                   //     color: Colors.white,
          //                   //     offset: Offset(1, 1),
          //                   //     blurRadius: 1,
          //                   //   ),
          //                   // ],
          //                   borderRadius: BorderRadius.circular(10),
          //                 ),
          //                 // elevation: 1,
          //                 child: Padding(
          //                   padding: EdgeInsets.symmetric(horizontal: Get.width/30.0,vertical: Get.height/100),
          //                   child: Column(
          //                     children: [
          //                       Expanded(
          //                         flex: 3,
          //                         child: Center(
          //                           child: InkWell(
          //                             onTap: (){
          //                               // provider.onGridImageTap();
          //                             },
          //                             child: Container(
          //                               // width: Get.width / 2,
          //                               height: Get.height /6,
          //                               padding: EdgeInsets.all(10),
          //                               child: ClipRRect(
          //                                 borderRadius: BorderRadius.circular(20),
          //                                 child: Image.asset(
          //                                   ImageRes.bur2,
          //                                   fit: BoxFit.cover,
          //                                 ),
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                       ),
          //                       Expanded(
          //                         flex: 2,
          //                         child: SingleChildScrollView(
          //                           child: Column(
          //                             crossAxisAlignment: CrossAxisAlignment.start,
          //                             children: [
          //                               Row(
          //                                 children: [
          //                                   Text(
          //                                     // provider!.allItems.data!.emimList![index].itemName
          //                                     //     .toString(),
          //
          //                                     index.toString(),
          //
          //                                     textAlign: TextAlign.center,
          //                                     // maxLines: 2,
          //                                     overflow: TextOverflow.ellipsis,
          //                                     style: appTextStyle(
          //                                       fontSize: 14,
          //                                       textColor: ColorRes.black,
          //                                       fontWeight: FontWeight.w600,
          //                                     ),
          //                                   ),
          //                                   SizedBox(width: 5),
          //                                 ],
          //                               ),
          //                               // SizedBox(height: 20,),
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             );
          //           }),
          //     ),
          //   ),
          // ),



          SizedBox(height: Get.height/45,),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 150,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 18,
                      mainAxisSpacing: 15,
                    ),
                    // isOccupie
                    itemCount: provider!.getTableListModel.data!['emtrmList']!.length,
                    itemBuilder: (BuildContext ctx, index) {
                      return InkWell(
                        onTap: () {

                          // provider!.getTableListModel.data!['emtrmList']![index].isOccupie == true ?
                          // showDialog(
                          //   context: context,
                          //   builder: (ctx) => AlertDialog(
                          //     // titlePadding: EdgeInsets.only(left: 14.0, bottom: 4),
                          //     insetPadding: EdgeInsets.zero,
                          //     shape: RoundedRectangleBorder(
                          //         borderRadius:
                          //         BorderRadius.all(
                          //             Radius.circular(10.0))),
                          //     backgroundColor: ColorRes.white,
                          //     title:Column(
                          //       children: [
                          //         Container(
                          //             child: Image.asset(ImageRes.imoji,)),
                          //         Text("Sorry !!", style: appTextStyle(
                          //           fontSize: 25,
                          //           textColor: ColorRes.black,
                          //           fontWeight: FontWeight.w600,
                          //         ),),
                          //         Column(
                          //           mainAxisSize: MainAxisSize.min,
                          //           children: [
                          //             Text("All tables are booked now please select", style: appTextStyle(
                          //               fontSize: 10,
                          //               textColor: ColorRes.grey,
                          //               fontWeight: FontWeight.w500,
                          //             ),),
                          //             Text("following options", style: appTextStyle(
                          //               fontSize: 10,
                          //               textColor: ColorRes.grey,
                          //               fontWeight: FontWeight.w500,
                          //             ),),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //     actions: <Widget>[
                          //       Container(
                          //         width: Get.width/1.1,
                          //         height: Get.height/6,
                          //         child: Padding(
                          //           padding: EdgeInsets.symmetric(horizontal:10,vertical: 10),
                          //           child: Row(
                          //             children: [
                          //               Spacer(),
                          //               InkWell(
                          //                 child: Container(
                          //                   child: Padding(
                          //                     padding: const EdgeInsets.all(15.0),
                          //                     child: Column(
                          //                       children: [
                          //                         Image.asset(ImageRes.tNew,color: ColorRes.black,),
                          //                         SizedBox(height: 10,),
                          //                         Text(
                          //                           "Take out",
                          //
                          //                           textAlign: TextAlign.center,
                          //                           // maxLines: 2,
                          //                           overflow: TextOverflow.ellipsis,
                          //                           style: appTextStyle(
                          //                             fontSize: 14,
                          //                             textColor: ColorRes.black,
                          //                             fontWeight: FontWeight.w500,
                          //                           ),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                   decoration: BoxDecoration(
                          //                     color: ColorRes.greybg,
                          //                     borderRadius: BorderRadius.circular(12),
                          //                   ),
                          //                 ),
                          //                 onTap: (){
                          //                   Get.back();
                          //                   showDialog(
                          //                     context: context,
                          //                     builder: (ctx) => AlertDialog(
                          //                       insetPadding: EdgeInsets.zero,
                          //                       shape: RoundedRectangleBorder(
                          //                           borderRadius: BorderRadius.all(Radius.circular(10))),
                          //                       backgroundColor: ColorRes.white,
                          //                       title:Column(
                          //                         children: [
                          //                           Container(
                          //                               child: Image.asset(ImageRes.imoji,)),
                          //                           Text("Excellent !!", style: appTextStyle(
                          //                             fontSize: 25,
                          //                             textColor: ColorRes.black,
                          //                             fontWeight: FontWeight.w600,
                          //                           ),),
                          //                           Column(
                          //                             mainAxisSize: MainAxisSize.min,
                          //                             children: [
                          //                               Text("Take out your order with our Delivery boy", style: appTextStyle(
                          //                                 fontSize: 10,
                          //                                 textColor: ColorRes.grey,
                          //                                 fontWeight: FontWeight.w500,
                          //                               ),),
                          //                               Text(" or Self Service.", style: appTextStyle(
                          //                                 fontSize: 10,
                          //                                 textColor: ColorRes.grey,
                          //                                 fontWeight: FontWeight.w500,
                          //                               ),),
                          //                             ],
                          //                           ),
                          //                         ],
                          //                       ),
                          //                       actions: <Widget>[
                          //                         Container(
                          //                           width: Get.width/1.1,
                          //                           height: Get.height/6,
                          //                           child:  Padding(
                          //                             padding: EdgeInsets.symmetric(horizontal:10,vertical: 10),
                          //                             child: Row(
                          //                               children: [
                          //                                 Column(
                          //                                   children: [
                          //                                     Container(
                          //                                       child: Padding(
                          //                                         padding: const EdgeInsets.all(20.0),
                          //                                         child: Column(
                          //                                           children: [
                          //                                             Image.asset(ImageRes.tNew,color: ColorRes.black,),
                          //                                             SizedBox(height: 10,),
                          //                                             Text(
                          //                                               "Take out",
                          //
                          //                                               textAlign: TextAlign.center,
                          //                                               // maxLines: 2,
                          //                                               overflow: TextOverflow.ellipsis,
                          //                                               style: appTextStyle(
                          //                                                 fontSize: 14,
                          //                                                 textColor: ColorRes.black,
                          //                                                 fontWeight: FontWeight.w500,
                          //                                               ),
                          //                                             ),
                          //                                           ],
                          //                                         ),
                          //                                       ),
                          //                                       decoration: BoxDecoration(
                          //                                         color: ColorRes.greybg,
                          //                                         borderRadius: BorderRadius.circular(12),
                          //                                       ),
                          //                                     ),
                          //                                   ],
                          //                                 ),
                          //                                 SizedBox(width:10),
                          //                                 Expanded(
                          //                                   child: Column(
                          //                                     children: [
                          //                                       InkWell(
                          //                                         child: Container(
                          //                                           child: Padding(
                          //                                             padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                          //                                             child: Row(
                          //                                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //                                               children: [
                          //                                                 Image.asset(ImageRes.timeNew,color: ColorRes.black,),
                          //                                                 SizedBox(height: 10,),
                          //                                                 Text(
                          //                                                   "Delivery boy",
                          //
                          //                                                   textAlign: TextAlign.center,
                          //                                                   // maxLines: 2,
                          //                                                   overflow: TextOverflow.ellipsis,
                          //                                                   style: appTextStyle(
                          //                                                     fontSize: 14,
                          //                                                     textColor: ColorRes.black,
                          //                                                     fontWeight: FontWeight.w500,
                          //                                                   ),
                          //                                                 ),
                          //                                               ],
                          //                                             ),
                          //                                           ),
                          //                                           decoration: BoxDecoration(
                          //                                             color: ColorRes.greybg,
                          //                                             borderRadius: BorderRadius.circular(12),
                          //                                           ),
                          //                                         ),
                          //                                         onTap: (){
                          //                                           provider!.onDeliveryTap();
                          //                                         },
                          //                                       ),
                          //                                       SizedBox(height: 5),
                          //                                       InkWell(
                          //                                         onTap: (){
                          //                                           provider!.onSelfTap();
                          //                                         },
                          //                                         child: Container(
                          //                                           child: Padding(
                          //                                             padding:  EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                          //                                             child: Row(
                          //                                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          //
                          //                                               children: [
                          //                                                 Image.asset(ImageRes.timeNew,color: ColorRes.black,),
                          //                                                 SizedBox(height: 10,),
                          //                                                 Text(
                          //                                                   "Self Serevice",
                          //                                                   textAlign: TextAlign.center,
                          //                                                   // maxLines: 2,
                          //                                                   overflow: TextOverflow.ellipsis,
                          //                                                   style: appTextStyle(
                          //                                                     fontSize: 14,
                          //                                                     textColor: ColorRes.black,
                          //                                                     fontWeight: FontWeight.w500,
                          //                                                   ),
                          //                                                 ),
                          //                                               ],
                          //                                             ),
                          //                                           ),
                          //                                           decoration: BoxDecoration(
                          //                                             color: ColorRes.greybg,
                          //                                             borderRadius: BorderRadius.circular(12),
                          //                                           ),
                          //                                         ),
                          //                                       ),
                          //                                     ],
                          //                                   ),
                          //                                 ),
                          //                               ],
                          //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //                             ),
                          //                           ),
                          //                         )
                          //                       ],
                          //                     ),
                          //                   );
                          //                 },
                          //               ),
                          //               Spacer(flex: 2),
                          //               Spacer(),
                          //               InkWell(
                          //                 onTap: (){
                          //                   Get.to(()=>NextSlotBookingScreen());
                          //                 },
                          //                 child: Container(
                          //                   child: Padding(
                          //                     padding: const EdgeInsets.all(15.0),
                          //                     child: Column(
                          //                       children: [
                          //                         Image.asset(ImageRes.timeNew,color: ColorRes.black,),
                          //                         SizedBox(height: 10,),
                          //                         Text(
                          //                           "Next slot",
                          //                           textAlign: TextAlign.center,
                          //                           // maxLines: 2,
                          //                           overflow: TextOverflow.ellipsis,
                          //                           style: appTextStyle(
                          //                             fontSize: 14,
                          //                             textColor: ColorRes.black,
                          //                             fontWeight: FontWeight.w500,
                          //                           ),
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ),
                          //                   decoration: BoxDecoration(
                          //                     color: ColorRes.greybg,
                          //                     borderRadius: BorderRadius.circular(12),
                          //                   ),
                          //                 ),
                          //               ),
                          //               Spacer(),
                          //             ],
                          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //           ),
                          //         ),
                          //
                          //       ),
                          //     ],
                          //   ),
                          // ) : Get.to(()=>TableDetailScreen(index: index+1,));







                          // print(provider.allItems.data!.emimList![index].itemName
                          //     .toString());
                          // provider.passData(index);
                          // provider!.onTableGridTap(index,ImageRes.bur2);
                        },
                        child: provider!.getTableListModel.data!['emtrmList']![index].isOccupie == true ? DottedBorder(
                          radius: Radius.circular(100),
                          padding: EdgeInsets.all(2),
                          color: ColorRes.saff.withOpacity(0.5),
                          dashPattern: [8, 4],
                          strokeWidth: 2.5,
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                            child: Container(
                              decoration: BoxDecoration(
                                color: ColorRes.white,

                                borderRadius: BorderRadius.circular(5),
                              ),
                              // elevation: 1,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8,vertical:5),
                                child: Column(
                                  children: [

                                    Align(

                                      child: Text(
                                        index < 9 ? "0"+(index+1).toString() : (index+1).toString(),

                                        textAlign: TextAlign.center,
                                        // maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: appTextStyle(
                                          fontSize: 14,
                                          textColor: ColorRes.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      alignment: Alignment.centerRight,
                                    ),
                                    SizedBox(width: 5),

                                    InkWell(
                                      onTap: (){
                                        // provider.onGridImageTap();
                                      },
                                      child: Center(
                                        child: Container(
                                          alignment:AlignmentDirectional.center,
                                          // width: Get.width / 4,
                                          // height: Get.height /10,
                                          padding: EdgeInsets.all(10),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: provider!.getTableListModel.data!['emtrmList']![index].isOccupie == true ? Image.asset(
                                              ImageRes.person,

                                            ) : Container(),
                                          ),
                                        ),
                                      ),
                                    ),










                                  ],
                                ),
                              ),
                            ),
                          ),
                        ) : Container(

                          decoration: BoxDecoration(
                            color: ColorRes.white,
                            // color: isSelectedTheme == "Dark"
                            //     ? Themes.lightDark
                            //     : Colors.white,
                            // boxShadow: <BoxShadow>[
                            //   BoxShadow(
                            //     color: Colors.white,
                            //     offset: Offset(1, 1),
                            //     blurRadius: 1,
                            //   ),
                            // ],
                            // border: Border.all(color:provider!.getTableListModel.data!['emtrmList']![index].isOccupie == true ?  ColorRes.black : ColorRes.white),

                            borderRadius: BorderRadius.circular(10),
                          ),
                          // elevation: 1,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      // width: Get.width / 5,
                                      // height: Get.height /10,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: provider!.getTableListModel.data!['emtrmList']![index].isOccupie == true ? Image.asset(
                                          ImageRes.bur2,
                                        ) : Image.asset(ImageRes.tNew),
                                      ),
                                    ),
                                    Text(
                                      index < 9 ? "0"+(index+1).toString() : (index+1).toString(),

                                      textAlign: TextAlign.center,
                                      // maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: appTextStyle(
                                        fontSize: 16,
                                        textColor: ColorRes.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                  ],
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                ),
                                SizedBox(height: 12),
                                Align(
                                  child: Text(
                                    provider!.getTableListModel.data!['emtrmList']![index].noOfSitting.toString()+" Sittings",

                                    textAlign: TextAlign.center,
                                    // maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: appTextStyle(
                                      fontSize: 14,
                                      textColor: ColorRes.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),

                                Align(
                                  child: Text(
                                    "(capacity)",
                                    textAlign: TextAlign.center,
                                    // maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: appTextStyle(
                                      fontSize: 10,
                                      textColor: ColorRes.grey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),

                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ),
          ),



        ],
      )
    );
  }
}
