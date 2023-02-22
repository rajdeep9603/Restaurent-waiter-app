import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Loader {
  void showLoader() {
    Get.dialog(
      Center(
        child: Stack(
          children: <Widget>[
            Container(
              height: Get.height,
              width: Get.width,
              color: Colors.transparent,
            ),
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        ),
      ),
    );
  }

  void hideLoader() {
    Get.back();
  }
}
