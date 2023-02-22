import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_waiter_app/screens/home/home_screen_provider.dart';
import 'package:flutter_app_waiter_app/utils/assets_images.dart';
import 'package:flutter_app_waiter_app/utils/colors.dart';
import 'package:flutter_app_waiter_app/utils/common_widgets/common_styleRes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

enum LegendShape { Circle, Rectangle }

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeScreenProvider? provider;

  // DateTime dateTime



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<HomeScreenProvider>(context, listen: false);
  }



  final dataMap = <String, double>{
    "Total": 1000,
    "Veg": 5,
    "Non-veg": 5,
    // "Ionic": 15,
  };

  List<double>dataMap2 = [1000.0,5.0,5.0];
  final colorList = <Color>[
    Color(0xFFFF3528),
    Color(0xFF1EB563),
    Color(0xFFFE554A),
    // Color(0xff0984e3),
    // Color(0xfffd79a8),
    // Color(0xffe17055),
    // Color(0xff6c5ce7),
  ];
  //
  final gradientList = <List<Color>>[
    [
      Color.fromRGBO(223, 250, 92, 1),
      Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      Color.fromRGBO(129, 182, 205, 1),
      Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      Color.fromRGBO(175, 63, 62, 1.0),
      Color.fromRGBO(254, 154, 92, 1),
    ]
  ];

  ChartType? _chartType = ChartType.ring;
  bool _showCenterText = true;
  double? _ringStrokeWidth = 35;
  double? _chartLegendSpacing = 35;

  bool _showLegendsInRow = false;
  bool _showLegends = true;

  bool _showChartValueBackground = true;
  bool _showChartValues = true;
  bool _showChartValuesInPercentage = true;
  bool _showChartValuesOutside = true;

  bool _showGradientColors = false;

  LegendShape? _legendShape = LegendShape.Circle;
  LegendPosition? _legendPosition = LegendPosition.right;

  int key = 0;



  DateTime selectedDate = DateTime.now();
  // var selectedDate1 = DateFormat('dd-MM-yyyy');


  var picker1 = "";
  var picker2 = "";
  var picker3 = "";
  var picker4 = "";
  birthDay1(BuildContext context) async{
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate:  DateTime(2100),
    );

    if(picked != null){
      picker1 = DateFormat('dd-MM-yyyy').format(picked);
      // selectedDate = DateTime.parse(dateContoller.text);
    setState(() {});
    }else{
      picker1 = "dd/mm/yyyy";
    }

  }

  birthDay2(BuildContext context) async{
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate:  DateTime(2100),
    );

    if(picked != null){
      picker2 = DateFormat('dd-MM-yyyy').format(picked);
      // selectedDate = DateTime.parse(dateContoller.text);
      setState(() {});
    }else{
      picker2 = "dd/mm/yyyy";
    }

  }

  birthDay3(BuildContext context) async{
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate:  DateTime(2100),
    );

    if(picked != null){
      picker3 = DateFormat('dd-MM-yyyy').format(picked);
      // selectedDate = DateTime.parse(dateContoller.text);
      setState(() {});
    }else{
      picker3 = "dd/mm/yyyy";
    }

  }

  birthDay4(BuildContext context) async{
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate:  DateTime(2100),
    );

    if(picked != null){
      picker4 = DateFormat('dd-MM-yyyy').format(picked);
      // selectedDate = DateTime.parse(dateContoller.text);
      setState(() {});
    }else{
      picker4 = "dd/mm/yyyy";
    }

  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<HomeScreenProvider>(context, listen: true);

    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: Duration(milliseconds: 800),
      chartLegendSpacing: _chartLegendSpacing!,
      chartRadius: MediaQuery.of(context).size.width / 3.2 > 300
          ? 300
          : MediaQuery.of(context).size.width / 3.2,
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: _chartType!,
      // centerText: _showCenterText ? "HYBRID" : null,
      // legendOptions: LegendOptions(
      //   showLegendsInRow: _showLegendsInRow,
      //   legendPosition: _legendPosition!,
      //   showLegends: _showLegends,
      //   legendShape: _legendShape == LegendShape.Circle
      //       ? BoxShape.circle
      //       : BoxShape.rectangle,
      //   legendTextStyle: TextStyle(
      //     fontWeight: FontWeight.normal,
      //   ),
      // ),

      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: _showChartValueBackground,
        showChartValues: _showChartValues,
        showChartValuesInPercentage: _showChartValuesInPercentage,
        showChartValuesOutside: _showChartValuesOutside,
      ),
      ringStrokeWidth: _ringStrokeWidth!,
      emptyColor: Colors.grey,
      gradientList: _showGradientColors ? gradientList : null,
      emptyColorGradient: [
        Color(0xff6c5ce7),
        Colors.blue,
      ],
    );

    return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: Get.height / 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                "La Pinozz",
                style: appTextStyle(
                  textColor: ColorRes.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: Get.height / 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: (){
                    provider!.onMenu();
                  },
                  child: Container(
                      width: Get.width / 4,
                      // height: Get.height,
                      decoration: BoxDecoration(
                        color: ColorRes.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Menu",
                              style: appTextStyle(
                                textColor: ColorRes.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(ImageRes.menuIcon),
                          ],
                        ),
                      )),
                ),
                InkWell(
                  onTap: (){
                    provider!.onTable();
                  },
                  child: Container(
                      width: Get.width / 4,
                      decoration: BoxDecoration(
                        color: ColorRes.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Table",
                              style: appTextStyle(
                                textColor: ColorRes.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Image.asset(ImageRes.table),
                          ],
                        ),
                      )),
                ),
                InkWell(
                  onTap: (){
                    provider!.onOrder();
                  },
                  child: Container(
                    width: Get.width / 4,
                    decoration: BoxDecoration(
                      color: ColorRes.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Order",
                            style: appTextStyle(
                              textColor: ColorRes.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Image.asset(ImageRes.order),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(left: 15.h,top: 5.h),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Waiter Name",
                  style: appTextStyle(
                    textColor: ColorRes.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding:EdgeInsets.only(left:15,bottom: 15.h,right: 15.h),
                child: Stack(
                  children: [
                    Container(
                      width: Get.width,
                      // height: Get.hei,ght/
                      decoration: BoxDecoration(
                        color: ColorRes.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.only(left: 10.h,right: 10.h,top:10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Sales Status",
                              style: appTextStyle(
                                textColor: ColorRes.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 8.0,top: 10.h),
                                    child: InkWell(
                                      onTap: () async {
                                        print("hello");
                                        birthDay1(context);

                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(color:ColorRes.saff)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.h),
                                          child:Text(
                                            picker1 == "" ? "dd/mm/yyyy" : picker1.toString(),
                                            style: appTextStyle(
                                              textColor: ColorRes.black.withOpacity(0.5),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.h,),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0,top: 10.h),
                                  child: Text(
                                    "to",
                                    style: appTextStyle(
                                      textColor: ColorRes.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.h,),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 8.0,top: 10.h),
                                    child: InkWell(
                                      onTap: (){
                                        birthDay2(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(color:ColorRes.saff)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.h),
                                          child: Text(
                                            picker2 == "" ? "dd/mm/yyyy" : picker2.toString(),
                                            style: appTextStyle(
                                              textColor: ColorRes.black.withOpacity(0.5),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),


                              ],
                            ),

                            Align(
                              alignment: Alignment.centerLeft,
                              child: LayoutBuilder(
                                builder: (_, constraints) {
                                  if (constraints.maxWidth >= 600) {
                                    return Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Flexible(
                                          flex: 3,
                                          fit: FlexFit.tight,
                                          child: chart,
                                        ),
                                      ],
                                    );
                                  } else {
                                    return SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Container(
                                            child: chart,
                                            margin: EdgeInsets.symmetric(
                                              vertical: 32,
                                            ),
                                          ),
                                          // settings,
                                        ],
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),

                            Divider(),
                            Text(
                              "Payment Collecction",
                              style: appTextStyle(
                                textColor: ColorRes.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 8.0,top: 10.h),
                                    child: InkWell(
                                      onTap: (){
                                        birthDay3(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(color:ColorRes.saff)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.h),
                                          child: Text(
                                            picker3 == "" ? "dd/mm/yyyy" : picker3.toString(),
                                            style: appTextStyle(
                                              textColor: ColorRes.black.withOpacity(0.5),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.h,),
                                Padding(
                                  padding: EdgeInsets.only(right: 8.0,top: 10.h),
                                  child: Text(
                                    "to",
                                    style: appTextStyle(
                                      textColor: ColorRes.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 5.h,),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 8.0,top: 10.h),
                                    child: InkWell(
                                      onTap: (){
                                        birthDay4(context);
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20),
                                            border: Border.all(color:ColorRes.saff)
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 5.h),
                                          child: Text(
                                            picker4 == "" ? "dd/mm/yyyy" : picker4.toString(),
                                            style: appTextStyle(
                                              textColor: ColorRes.black.withOpacity(0.5),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                      ),
                                    ),
                                  ),
                                ),


                              ],
                            ),
                            SizedBox(
                              height: 10.h,
                            ),

                            Padding(
                              padding: EdgeInsets.only(right: 10.h),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "COD",
                                        style: appTextStyle(
                                            textColor: ColorRes.black.withOpacity(0.5),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 13),
                                      ),
                                      Text(
                                        "2000"+"\$",
                                        style: appTextStyle(
                                            textColor: ColorRes.black.withOpacity(0.5),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),

                                  Divider(color: ColorRes.greyPay.withOpacity(0.4),),


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Debit Card/Credit Card",
                                        style: appTextStyle(
                                            textColor: ColorRes.black.withOpacity(0.5),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 13),
                                      ),
                                      Text(
                                        "500"+"\$",
                                        style: appTextStyle(
                                            textColor: ColorRes.black.withOpacity(0.5),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),

                                  Divider(color: ColorRes.greyPay.withOpacity(0.4),),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Online Payment",
                                        style: appTextStyle(
                                            textColor: ColorRes.black.withOpacity(0.5),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 13),
                                      ),
                                      Text(
                                        "3700"+"\$",
                                        style: appTextStyle(
                                            textColor: ColorRes.black.withOpacity(0.5),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 13),
                                      ),


                                    ],
                                  ),

                                  Divider(color: ColorRes.greyPay.withOpacity(0.4),),


                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Others",
                                        style: appTextStyle(
                                            textColor: ColorRes.black.withOpacity(0.5),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 13),
                                      ),
                                      Text(
                                        "500"+"\$",
                                        style: appTextStyle(
                                            textColor: ColorRes.black.withOpacity(0.5),
                                            fontWeight: FontWeight.normal,
                                            fontSize: 13),
                                      ),
                                    ],
                                  ),
                                  Divider(color: ColorRes.greyPay.withOpacity(0.4),),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Total Amount",
                                        style: appTextStyle(
                                            textColor: ColorRes.saff,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13),
                                      ),
                                      Text(
                                        "6200"+"\$",
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
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        right: 30,
                        top: 140,
                        child:Column(
                      children: [
                        Text(
                          "${dataMap2[0].toString()}",
                          style: appTextStyle(
                            textColor: ColorRes.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "${dataMap2[1].toString()}",
                          style: appTextStyle(
                            textColor: ColorRes.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 6,),
                        Text(
                          "${dataMap2[2].toString()}",
                          style: appTextStyle(
                            textColor: ColorRes.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }
}
