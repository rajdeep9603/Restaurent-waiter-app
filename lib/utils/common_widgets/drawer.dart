// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:quiz/screen/change_password/change_password_screen.dart';
// import 'package:quiz/screen/home_screen/home_screen.dart';
// import 'package:quiz/screen/home_screen/home_view_model.dart';
// import 'package:quiz/screen/login/login_screen.dart';
// import 'package:quiz/screen/my_coin/my_coin_screen.dart';
// import 'package:quiz/screen/profile/profile_screen.dart';
// import 'package:quiz/screen/purchase_history/purchase_history_screen.dart';
// import 'package:quiz/screen/setting/settings_screen.dart';
// import 'package:quiz/screen/theme/theme_screen.dart';
// import 'package:quiz/utils/assets_images.dart';
// import 'package:quiz/utils/colors.dart';
// import 'package:quiz/utils/common_widgets/common_styleRes.dart';
// import 'package:quiz/utils/theme.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// commonDivider() {
//   return Divider(
//     height: 22,
//     color: ColorRes.white,
//     thickness: 1,
//   );
// }
//
// commonText(String title) {
//   return Padding(
//     padding: EdgeInsets.symmetric(horizontal: 15),
//     child: Text(
//       title,
//       style: appTextStyle(
//         textColor: ColorRes.white,
//         fontWeight: FontWeight.normal,
//         fontSize: 17,
//       ),
//     ),
//   );
// }
//
// openDrawer(HomeViewModel model) {
//   return Container(
//     width: Get.width / 1.5,
//     child: ClipRRect(
//       borderRadius: BorderRadius.only(
//         topRight: Radius.circular(35),
//         bottomRight: Radius.circular(35),
//       ),
//       child: Drawer(
//         child: Container(
//           decoration: BoxDecoration(
//             color: ColorRes.maroon,
//           ),
//           child: ListView(
//             children: [
//               SizedBox(height: 30),
//               Container(
//                 width: Get.width,
//                 height: Get.height / 6,
//                 child: Image.asset(ImageRes.drawerImage),
//               ),
//               SizedBox(height: 10),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 12),
//                 child: Row(
//                   children: [
//                     InkWell(
//                       onTap: () async {
//                         Get.dialog(
//                           AlertDialog(
//                             title: Text(
//                               "signOut".tr,
//                               style: TextStyle(
//                                 color: isSelectedTheme == "Dark"
//                                     ? Themes.dark
//                                     : ColorRes.black,
//                                 fontSize: 20,
//                               ),
//                             ),
//                             content: Text(
//                               "areYouSureWantToSignOut".tr,
//                               style: TextStyle(
//                                 color: isSelectedTheme == "Dark"
//                                     ? Themes.dark
//                                     : ColorRes.black,
//                                 fontSize: 17,
//                               ),
//                             ),
//                             actions: [
//                               RaisedButton(
//                                 color: ColorRes.red400,
//                                 onPressed: () async {
//                                   Get.offAll(() => LoginScreen())!
//                                       .then((value) {
//                                     model.notifyListeners();
//                                   });
//                                   SharedPreferences preferences =
//                                       await SharedPreferences.getInstance();
//                                   await preferences.clear();
//                                 },
//                                 child: Text(
//                                   "yes".tr,
//                                   style:
//                                       appTextStyle(textColor: ColorRes.white),
//                                 ),
//                               ),
//                               RaisedButton(
//                                 color: ColorRes.green300,
//                                 onPressed: () {
//                                   Get.back();
//                                 },
//                                 child: Text(
//                                   "no".tr,
//                                   style:
//                                       appTextStyle(textColor: ColorRes.white),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                       child: Icon(
//                         Icons.logout,
//                         size: 27,
//                         color: ColorRes.white,
//                       ),
//                     ),
//                     SizedBox(width: Get.width / 12),
//                     Column(
//                       children: [
//                         SizedBox(height: 12),
//                         Container(
//                           width: Get.width / 3.5,
//                           height: Get.height / 15,
//                           child: Text(
//                             "quizApp".tr,
//                             maxLines: 2,
//                             style: appTextStyle(
//                               textColor: ColorRes.white,
//                               fontSize: 19,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10),
//               Divider(
//                 height: 20,
//                 color: ColorRes.white,
//                 thickness: 2,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   InkWell(
//                     onTap: () {
//                       Get.offAll(() => HomeScreen())!.then((value) {
//                         model.notifyListeners();
//                       });
//                     },
//                     child: commonText("home".tr),
//                   ),
//                   commonDivider(),
//                   InkWell(
//                     onTap: () async {
//                       Get.back(result: "new");
//                       model.getCategoryCall();
//                       var result =
//                           await Get.to(() => SettingScreen())!.then((value) {
//                         model.notifyListeners();
//                       });
//                       if (result != null) {
//                         await model.getCategoryCall();
//                       }
//                     },
//                     child: commonText("setting".tr),
//                   ),
//                   commonDivider(),
//                   InkWell(
//                     onTap: () {
//                       Get.to(() => ProfileScreen())!.then((value) {
//                         model.notifyListeners();
//                       });
//                     },
//                     child: commonText("profile".tr),
//                   ),
//                   commonDivider(),
//                   InkWell(
//                     onTap: () => Get.to(() => MyCoinScreen())!.then((value) {
//                       model.notifyListeners();
//                     }),
//                     child: commonText("myCoin".tr),
//                   ),
//                   commonDivider(),
//                   InkWell(
//                     onTap: () {
//                       launch(
//                           'https://www.niu.edu/ems/quizfiles/quizInstrs.html');
//                     },
//                     child: commonText("aboutUs".tr),
//                   ),
//                   commonDivider(),
//                   commonText("rateApp".tr),
//                   commonDivider(),
//                   commonText("shareApp".tr),
//                   commonDivider(),
//                   InkWell(
//                     onTap: () {
//                       Get.to(() => ChangePasswordScreen())!.then((value) {
//                         model.notifyListeners();
//                       });
//                     },
//                     child: commonText("changePassword".tr),
//                   ),
//                   commonDivider(),
//                   InkWell(
//                     onTap: () {
//                       Get.to(() => PurchaseHistoryScreen())!.then((value) {
//                         model.notifyListeners();
//                       });
//                     },
//                     child: commonText("purchaseHistory".tr),
//                   ),
//                   commonDivider(),
//                   SizedBox(height: 20),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
// }
