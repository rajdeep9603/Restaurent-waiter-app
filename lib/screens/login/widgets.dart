import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_waiter_app/utils/colors.dart';
import 'package:flutter_app_waiter_app/utils/common_widgets/common_styleRes.dart';
import 'package:flutter_app_waiter_app/utils/common_widgets/common_textfield.dart';
import 'package:get/get.dart';

// Widget imageBox() {
//   return Center(
//     child: Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         width: Get.width / 2,
//         height: Get.height / 3.2,
//         child: Image.asset(ImageRes.signUpImage),
//       ),
//     ),
//   );
// }

Widget textFormField(
    {String? Function(String?)? validation,
      String? text,
      Widget? prefixIcon,
      Widget? suffixIcon,
      TextInputType? keyboardType,
      FocusNode? focusNode,
      bool? obscureText,
      TextEditingController? controller}) {
  return commonTextFormField(
    keyboardType: keyboardType,
    validation: validation,
    focusNode: focusNode,
    controller: controller,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    hintText: text,
    obscureText: obscureText,
    hintStyle: appTextStyle(
      textColor: ColorRes.cusgrey,
      fontSize: 15,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.1,
    ),
  );
}
