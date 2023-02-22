import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_waiter_app/utils/colors.dart';
import 'package:flutter_app_waiter_app/utils/common_widgets/common_styleRes.dart';
import 'package:get/get.dart';


void appBackAlert() {
  Get.dialog(
    AlertDialog(
      title: Text(
        "quitApp".tr,
        style: appTextStyle(textColor: ColorRes.black, fontSize: 20),
      ),
      content: Text(
        "quitAppDialog".tr,
        style: appTextStyle(textColor: ColorRes.black, fontSize: 17),
      ),
      actions: [
        // ignore: deprecated_member_use
        RaisedButton(
          color: Colors.red,
          onPressed: () {
            SystemNavigator.pop();
          },
          child: Text(
            "yes".tr,
            style: appTextStyle(textColor: ColorRes.white),
          ),
        ),
        // ignore: deprecated_member_use
        RaisedButton(
          color: ColorRes.green,
          onPressed: () {
            Get.back();
          },
          child: Text(
            "no".tr,
            style: appTextStyle(textColor: ColorRes.white),
          ),
        ),
      ],
    ),
  );
}
