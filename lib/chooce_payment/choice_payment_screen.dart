import 'package:flutter/material.dart';
import 'package:flutter_app_waiter_app/chooce_payment/choice_payment_provider.dart';
import 'package:flutter_app_waiter_app/utils/colors.dart';
import 'package:flutter_app_waiter_app/utils/common_widgets/common_styleRes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ChoicePaymentScreen extends StatefulWidget {
  List<Map<String, List<Map<String, dynamic>>>>? newmainList;
  double? displayPrice;
  double? displayquantity;
  ChoicePaymentScreen({this.displayPrice,this.displayquantity,this.newmainList});
  @override
  _ChoicePaymentScreenState createState() => _ChoicePaymentScreenState();
}

class _ChoicePaymentScreenState extends State<ChoicePaymentScreen> {
  ChoicePaymentProvider? provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<ChoicePaymentProvider>(context, listen:false);
    provider!.init(widget.displayPrice!,widget.displayquantity!,widget.newmainList!);
  }
  @override
  Widget build(BuildContext context) {

    provider = Provider.of<ChoicePaymentProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: ColorRes.whitebg,
      body: Column(
        children: [
          SizedBox(height: 30.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h,vertical: 5.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
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
                            size: 20,
                          )),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Choose Payment Method",
                    style: appTextStyle(
                        textColor: ColorRes.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                ),
                SizedBox(height: 10.h),
                InkWell(
                  onTap: (){
                    provider!.arrowTap();
                  },
                  child: Container(
                    width: Get.width,
                    // height: Get.height/10.h,
                    decoration: BoxDecoration(
                      color: ColorRes.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.h,vertical: 15.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Please select any payment method",
                            style: appTextStyle(
                                textColor: ColorRes.black.withOpacity(0.5),
                                fontWeight: FontWeight.bold,
                                fontSize: 13),
                          ),
                          Icon(Icons.keyboard_arrow_down_outlined,color: ColorRes.black,size: 20,),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h),
                provider!.downArrow == true ? Container(
                  width: Get.width,
                  // height: Get.height/10.h,
                  decoration: BoxDecoration(
                    color: ColorRes.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.h,vertical: 15.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "COD",
                          style: appTextStyle(
                              textColor: ColorRes.greyPay.withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),

                        Divider(color: ColorRes.greyPay.withOpacity(0.4),),


                        Text(
                          "Debit Card/Credit Card",
                          style: appTextStyle(
                              textColor: ColorRes.greyPay.withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),

                        Divider(color: ColorRes.greyPay.withOpacity(0.4),),

                        Text(
                          "Online Payment",
                          style: appTextStyle(
                              textColor: ColorRes.greyPay.withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),

                        Divider(color: ColorRes.greyPay.withOpacity(0.4),),


                        Text(
                          "Others",
                          style: appTextStyle(
                              textColor: ColorRes.greyPay.withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),


                      ],
                    ),
                  ),
                ) : Container(),
                provider!.downArrow == true ? SizedBox(height: 15.h) : Container(),
                Container(
                  width: Get.width,
                  // height: Get.height/10.h,
                  decoration: BoxDecoration(
                    color: ColorRes.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.h,vertical: 15.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Enter Collected Amount",
                          style: appTextStyle(
                              textColor: ColorRes.greyPay.withOpacity(0.5),
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          provider!.downArrow == false ? Container(height: Get.height/3.9.h) : Container(),

          Expanded(
            child: Container(
              width: Get.width,
              color: ColorRes.saff.withOpacity(0.3),
              // height: Get.height/3,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 15.h,vertical: 5.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          "Item Total",
                          style: appTextStyle(
                              textColor: ColorRes.saff,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),

                        Text(
                          "\$"+"${provider!.showDisplayPrice.toString()}",
                          style: appTextStyle(
                              textColor: ColorRes.saff,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),


                      ],
                    ),

                    SizedBox(height: 15.h),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          "Taxes & charges",
                          style: appTextStyle(
                              textColor: ColorRes.saff,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),

                        Text(
                          "\$"+"1.00",
                          style: appTextStyle(
                              textColor: ColorRes.saff,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),


                      ],
                    ),

                    SizedBox(height: 5.h),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          "Tip your Delivery Partner",
                          style: appTextStyle(
                              textColor: ColorRes.saff,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),

                        Text(
                          "\$"+"5.00",
                          style: appTextStyle(
                              textColor: ColorRes.saff,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),


                      ],
                    ),
                    SizedBox(height: Get.height/5.h),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          "Grand Total ",
                          style: appTextStyle(
                              textColor: ColorRes.saff,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),

                        Text(
                          "\$"+"${provider!.showDisplayPrice.toInt() + 1.00.toInt() + 5.00.toInt()}"+".00",
                          style: appTextStyle(
                              textColor: ColorRes.saff,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
                        ),

                      ],
                    ),



                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          provider!.payNow();
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

              child: Text(
                // "55",
                "Pay Now",style: appTextStyle(textColor: ColorRes.white,fontSize: 15,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),

    );
  }
}
