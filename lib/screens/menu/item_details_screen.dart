import 'package:carousel_slider/carousel_slider.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_waiter_app/screens/home/home_screen.dart';
import 'package:flutter_app_waiter_app/screens/menu/item_details_provider.dart';
import 'package:flutter_app_waiter_app/screens/menu/widgets.dart';
import 'package:flutter_app_waiter_app/utils/colors.dart';
import 'package:flutter_app_waiter_app/utils/common_widgets/common_styleRes.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemDetailScreen extends StatefulWidget {
  List<Map<String,List<Map<String,dynamic>>>>? backredirectOrderListMap;
  String? type;
  String? selectedMenu;

  ItemDetailScreen({this.backredirectOrderListMap,this.type,this.selectedMenu});
  @override
  _ItemDetailScreenState createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  ItemDetailProvider? provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ItemDetailProvider>(context, listen: false);
    provider!.init(widget.type.toString(),
        widget.backredirectOrderListMap!.isEmpty || widget.backredirectOrderListMap == [] ? [] : widget.backredirectOrderListMap!,widget.selectedMenu!
    );
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ItemDetailProvider>(context, listen: true);
    return  WillPopScope(
      onWillPop: ()async {
        Get.offAll(()=>HomeScreen());
        // Get.dialog(AlertDialog(
        //   content: Text("Are you sure want to exit ?"),
        //   actions: [
        //     // ignore: deprecated_member_use
        //     RaisedButton(
        //       color: ColorRes.red,
        //       child: Text("Exit",style: appTextStyle(textColor: ColorRes.white),),
        //       onPressed: (){
        //         // provider!.finalDisplayPrice = 0;
        //         // provider!.totalamountList.clear();
        //         // provider!.totalCount=[0,0,0,0,0,0,0,0,0,0,0];
        //         // provider!.displayquantity = 0;
        //         // provider!.onTapItem = false;
        //         provider!.currentPage = 0;
        //         provider!.selectedtab = 0;
        //         provider!.selectedItem = 0;
        //
        //         Get.offAll(()=>OnBoardingScreen());
        //       },
        //     ),
        //     // ignore: deprecated_member_use
        //     RaisedButton(
        //       color: ColorRes.green,
        //       child: Text("close",style: appTextStyle(textColor: ColorRes.white),),
        //       onPressed: (){
        //         Get.back();
        //       },
        //     ),
        //   ],
        // ));
        return true;
      },
      child: Scaffold(
        backgroundColor: ColorRes.whitebg,
        // provider!.allItems.data == null && provider!.allItems.data == []
        body:provider!.dataLoaded == true || provider!.allItems.data == null  ? const Center(child: CircularProgressIndicator(),) : Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height / 25,
              ),
              detailAppBar(provider!),
                   Expanded(
                child: Stack(
                  children: [
                    detailImageSliderWithFullBofy(provider!,widget.type!),




                    // provider!.onTapItem == true ? Positioned(
                    //   left: 0,
                    //   bottom: 0,
                    //   right:0,
                    //   child: InkWell(
                    //     onTap: (){
                    //       provider!.onPassData();
                    //     },
                    //     child: Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                    //     child: Container(
                    //       width: Get.width,
                    //       height: Get.height / 12,
                    //       decoration: BoxDecoration(
                    //         color: ColorRes.saff,
                    //         borderRadius: BorderRadius.circular(12),
                    //
                    //       ),
                    //       child: Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal:10),
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //           children: [
                    //             Column(
                    //               crossAxisAlignment: CrossAxisAlignment.start,
                    //               children: [
                    //                 SizedBox(height:5,),
                    //                 Text(
                    //                  // "55",
                    //                   "${provider!.displayquantity.toInt()}"+" Items",style: appTextStyle(textColor: ColorRes.black,fontSize: 15,fontWeight: FontWeight.bold),
                    //                 ),
                    //                 SizedBox(height:5,),
                    //                 Row(
                    //                   children: [
                    //                     Text(
                    //                       "\$"+"${provider!.displayPrice.toInt()}",style: appTextStyle(textColor: ColorRes.black,fontSize: 15,fontWeight: FontWeight.bold),
                    //                     ),
                    //                     SizedBox(width:5),
                    //                     Text(
                    //                       "plus taxes",style: appTextStyle(textColor: ColorRes.black,fontSize: 15,fontWeight: FontWeight.bold),
                    //                     ),
                    //
                    //                   ],
                    //                 ),
                    //               ],
                    //             ),
                    //             Row(
                    //               children: [
                    //                 Text("NEXT",style: appTextStyle(textColor: ColorRes.black,fontSize: 14,fontWeight: FontWeight.bold)),
                    //               Icon(Icons.arrow_forward_ios_rounded,color: ColorRes.black,size:25),
                    //               ],
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    // ),
                    //   ),) : Container(
                    //   padding: EdgeInsets.zero,
                    //   margin: EdgeInsets.zero,
                    //   height: 0,),

                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: provider!.onTapItem == true ? InkWell(
          onTap: (){
            provider!.onPassData();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
            child: Container(
              width: Get.width,
              height: Get.height / 13,
              decoration: BoxDecoration(
                color: ColorRes.saff,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height:5,),
                        Text(
                          // "55",
                          "${provider!.displayquantity.toInt()}"+" Items",style: appTextStyle(textColor: ColorRes.white,fontSize: 15,fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height:5,),
                        Row(
                          children: [
                            Text(
                              "\$"+"${provider!.displayPrice.toInt()}",style: appTextStyle(textColor: ColorRes.white,fontSize: 15,fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width:5),
                            Text(
                              "plus taxes",style: appTextStyle(textColor: ColorRes.white,fontSize: 15,fontWeight: FontWeight.bold),
                            ),

                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("NEXT",style: appTextStyle(textColor: ColorRes.white,fontSize: 14,fontWeight: FontWeight.bold)),
                        Icon(Icons.arrow_forward_ios_rounded,color: ColorRes.white,size:20),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ) : Container(width: 0,height: 0,),
      ),
    );
  }


}
