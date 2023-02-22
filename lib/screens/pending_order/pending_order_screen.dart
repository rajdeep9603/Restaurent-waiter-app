import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_waiter_app/screens/pending_order/pending_order_provider.dart';
import 'package:flutter_app_waiter_app/utils/colors.dart';
import 'package:flutter_app_waiter_app/utils/common_widgets/common_styleRes.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class PendingOrderScreen extends StatefulWidget {
  @override
  _PendingOrderScreenState createState() => _PendingOrderScreenState();
}

class _PendingOrderScreenState extends State<PendingOrderScreen> {
  WaiterPendingOrderProvider? provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<WaiterPendingOrderProvider>(context, listen: false);

    provider!.init();
  }
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<WaiterPendingOrderProvider>(context, listen: true);
    return Scaffold(
      backgroundColor: ColorRes.whitebg,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal:10),
        child: Column(
          children: [
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: Container(
                      width: 35,
                      height: 35,
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
                  "Pending Orders",
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
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Order List by Table",
                style: appTextStyle(
                  textColor: ColorRes.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: Get.width,
              height: Get.height/10,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: provider!.pendingOrderTableModel.data!.emtmList!.length,
                  itemBuilder: (context,int index){
                return InkWell(
                  onTap: ()  {
                     provider!.tabChange(index,provider!.pendingOrderTableModel.data!.emtmList![index].tableId!);
                    print("hello $index");
                  },
                  child: Padding(
                    padding:EdgeInsets.symmetric(horizontal: 8),
                    child: Container(
                      width: Get.width/4,
                      decoration: BoxDecoration(
                        color: provider!.index1 == index ? ColorRes.red : ColorRes.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.asset(provider!.list[index]['image'],color: provider!.index1 == index ? ColorRes.white : ColorRes.greyPay.withOpacity(0.5),),
                         alignment: Alignment.center,
                          ),

                          Positioned(
                            right: 10,
                            top:2,
                            child:Text(
                              "0"+provider!.pendingOrderTableModel.data!.emtmList![index].tableId.toString(),
                              style: appTextStyle(
                                textColor: ColorRes.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 15,
                              ),
                            ),),

                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 5),

            provider!.dataLoaded2 == true || provider!.pendingOrderGridTableModel.data!.emodmList == [] || provider!.pendingOrderGridTableModel.data == [] || provider!.pendingOrderGridTableModel.data == null ? Center(child: CircularProgressIndicator()) : Expanded(
              child: SingleChildScrollView(
                child: Container(
                  child: GridView.builder(
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 0.9,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 15,
                      ),
                      itemCount: provider!.pendingOrderGridTableModel.data!.emodmList!.length,
                      itemBuilder: (BuildContext ctx, index) {

                        return InkWell(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () {
                          },
                          child: Stack(
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 7,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  boxShadow: <BoxShadow>[
                                    BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(1, 1),
                                      blurRadius: 3,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                // elevation: 1,
                                child: Column(
                                  children: [
                                    Center(
                                      child: Container(
                                        // width: Get.width / 2,
                                        height: Get.height /6,
                                        padding: EdgeInsets.all(10),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(20),
                                          child: Image.asset(
                                            provider!.list2[index]["image"].toString(),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        provider!.proceesDoneBoolList[index]['bool'] == 1 ? Container() : InkWell(
                                          onTap:() async {
                                            await provider!.checkProcessDoneBoolList(provider!.list2[index]['count']);
                                            print(provider!.checkProcessDoneBoolList);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.symmetric(horizontal:6,vertical: 6),
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: ColorRes.saff,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(15),
                                                  bottomLeft: Radius.circular(15)),
                                            ),



                                            child: Text("Process".toUpperCase(),
                                                style: appTextStyle(
                                                    textColor: ColorRes.white,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 11)),
                                          ),
                                        ),
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal:12,vertical: 6),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: provider!.proceesDoneBoolList[index]['bool'] == 1 ?  ColorRes.greenui : ColorRes.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              bottomRight: Radius.circular(15),
                                            ),
                                            border: Border.all(color: provider!.proceesDoneBoolList[index]['bool'] == 1 ?  ColorRes.greenui : ColorRes.greenui),
                                          ),

                                          child: Text("Done".toUpperCase(),
                                              style: appTextStyle(
                                                  textColor: provider!.proceesDoneBoolList[index]['bool'] == 1 ?  ColorRes.white : ColorRes.greenui,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 11)),
                                        ),
                                      ],
                                    ),
                                    // Expanded(
                                    //   flex: 2,
                                    //   child: SingleChildScrollView(
                                    //     child: Column(
                                    //       crossAxisAlignment: CrossAxisAlignment.start,
                                    //       children: [
                                    //         SizedBox(
                                    //           height: Get.height/150,
                                    //         ),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                               provider!.proceesDoneBoolList[index]['bool'] == 1 ?
                               Positioned(
                                right: 0,
                                child: CircleAvatar(
                                  child: Icon(Icons.check,color: ColorRes.white,size: 15,),
                              radius: 10,
                                backgroundColor: ColorRes.greenui,
                              ),

                              ) : Container(),
                            ],
                          ),
                        );
                      }),
                ),
              ),
            ),
            SizedBox(height: 5),

          ],
        ),
      ),
    );
  }
}
