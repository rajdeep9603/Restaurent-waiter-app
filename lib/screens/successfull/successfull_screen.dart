import 'package:flutter/material.dart';
import 'package:flutter_app_waiter_app/utils/colors.dart';
import 'package:flutter_app_waiter_app/utils/common_widgets/common_styleRes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuccessFullScreen extends StatefulWidget {
  @override
  _SuccessFullScreenState createState() => _SuccessFullScreenState();
}

class _SuccessFullScreenState extends State<SuccessFullScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: Get.height / 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 35.h,
                  height: 35.h,
                  decoration: BoxDecoration(
                    color: ColorRes.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_sharp,
                    size: 25,
                  )),
              Spacer(
                flex: 2,
              ),
              Text(
                "Table No 21",
                style: appTextStyle(
                    textColor: ColorRes.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
              Spacer(flex: 3),
            ],
          ),
          SizedBox(height: Get.height / 15),
          Container(
              width: Get.width/1.5.h,
              height: Get.height/3.h,
              decoration: BoxDecoration(
                // color: ColorRes.white,
                shape: BoxShape.circle,
                border: Border.all(color: ColorRes.green,width: 3),
              ),
              child: Icon(
                Icons.check,color: ColorRes.green,
                size: 130,
              )),
          SizedBox(height: Get.height / 15),
          Text(
            "Your order has been \nsuccessfully placed",
            style: appTextStyle(
                textColor: ColorRes.black,
                fontWeight: FontWeight.w700,
                fontSize: 22),
          ),
          SizedBox(height: Get.height / 40),
          Center(child: Text('sit and relex while your order is being',style: appTextStyle(
              textColor: ColorRes.black,
              fontWeight: FontWeight.w500,
              fontSize: 15),)),
          Text('worked on.It will take 5 min before you get it',style: appTextStyle(
              textColor: ColorRes.black,
              fontWeight: FontWeight.w500,
              fontSize: 15),),
          SizedBox(height: Get.height / 7),



    ],
      ),
      bottomNavigationBar:InkWell(
        onTap:(){
          Get.back();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12),
          child: Container(
            alignment: Alignment.center,
            width: Get.width,
            height: Get.height/15,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: ColorRes.saff,
            ),
            child: Text("Back Home",style: appTextStyle(textColor: ColorRes.white),),
          ),
        ),
      ),
    );
  }
}
