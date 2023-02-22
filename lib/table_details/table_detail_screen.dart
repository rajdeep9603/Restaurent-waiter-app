import 'package:flutter/material.dart';
import 'package:flutter_app_waiter_app/screens/table/table_screen.dart';
import 'package:flutter_app_waiter_app/utils/assets_images.dart';
import 'package:flutter_app_waiter_app/utils/colors.dart';
import 'package:flutter_app_waiter_app/utils/common_widgets/common_styleRes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TableDetailScreen extends StatefulWidget {
  int? index;
  String? image;
  TableDetailScreen({this.index,this.image});
  @override
  _TableDetailScreenState createState() => _TableDetailScreenState();
}

class _TableDetailScreenState extends State<TableDetailScreen> {
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
            padding: EdgeInsets.symmetric(horizontal: 10.h,vertical: 5.h),
            child: Container(
              width: Get.width,
              height: Get.height/9,
              decoration: BoxDecoration(
                color: ColorRes.white,
                borderRadius: BorderRadius.circular(20),

              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.h,vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Image.asset(widget.image.toString(),width: 60,height: 60,),
                     ],
                   ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Table No",style: appTextStyle(fontWeight: FontWeight.normal,fontSize: 16),),
                        SizedBox(height: 4.h),
                        Text(widget.index.toString(),style: appTextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                      ],
                    ),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(ImageRes.table,width: 60,height: 60,),
                      ],
                    ),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Coustmer",style: appTextStyle(fontWeight: FontWeight.normal,fontSize: 16)),
                        SizedBox(height: 4.h),
                        Text("00",style: appTextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: Get.height/2.h,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.h),
            child: Container(
              alignment: Alignment.center,
              width: Get.width,
              height: Get.height/16,
              decoration: BoxDecoration(
                color: ColorRes.saff,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.h,vertical: 10.h),
                child:Text("Add Items",style: appTextStyle(fontWeight: FontWeight.normal,fontSize: 16,textColor:ColorRes.white ))
              ),
            ),
          ),
          SizedBox(height: 10.h,),
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
                  child:Text("Clean Table",style: appTextStyle(fontWeight: FontWeight.normal,fontSize: 16,textColor: ColorRes.saff))
              ),
            ),
          ),

        ],
      ),
    );
  }
}
