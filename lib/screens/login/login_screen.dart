import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_waiter_app/screens/login/login_provider.dart';
import 'package:flutter_app_waiter_app/screens/login/widgets.dart';
import 'package:flutter_app_waiter_app/utils/assets_images.dart';
import 'package:flutter_app_waiter_app/utils/colors.dart';
import 'package:flutter_app_waiter_app/utils/common_widgets/common_container.dart';
import 'package:flutter_app_waiter_app/utils/common_widgets/common_styleRes.dart';

import 'package:get/get.dart';
import 'package:provider/provider.dart';
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenProvider? provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<LoginScreenProvider>(context, listen: false);
  }
  @override
  Widget build(BuildContext context) {


    provider = Provider.of<LoginScreenProvider>(context, listen: true);


    return Scaffold(
backgroundColor: ColorRes.whitebg,
      body: Stack(
        children: [
          Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              width: Get.width,
              height: Get.height,
              child: Image.asset(ImageRes.bgRepeat,repeat: ImageRepeat.repeat,),
            ),
          ),
          Positioned(child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: Get.height/8),
              Container(
                width: Get.width/2.5,
                height: Get.height/8,
                child: Image.asset(ImageRes.logoLogin,fit: BoxFit.fill,),
              ),
              SizedBox(height: Get.height/12),
              titleRowLogin(),
              SizedBox(height: Get.height/35),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Form(
                    key: provider!.formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              // imageBox(),
                              nameField(provider!),
                              SizedBox(height: Get.height/35),
                              passField(provider!),
                              SizedBox(height: Get.height/50),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Forgot Password ?",
                                  style: appTextStyle(
                                    textColor: ColorRes.saff,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        // checkBoxField(provider),
                        registerBtn(provider!),
                        alreadyAccountRow(provider!),
                        SizedBox(height: 15),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }

  titleRowLogin() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Login",
            style: appTextStyle(
              textColor: ColorRes.saff,
              fontWeight: FontWeight.w700,
              fontSize: 36,
            ),
          ),
        ],
      ),
    );
  }

  nameField(LoginScreenProvider provider) {
    return textFormField(
      text: "Username or Mobile",
      validation: (value) {
        return provider.nameValidation(value);
      },
      controller: provider.nameController,
      focusNode: provider.nameFocus,
      keyboardType: TextInputType.text,
      // prefixIcon: Icon(
      //   Icons.person,
      //   size: 25,
      //   color: ColorRes.grey,
      // ),
    );
  }

  // emailField(SignupScreenProvider provider) {
  //   return textFormField(
  //     text: "emailAddress".tr,
  //     validation: (value) {
  //       return provider.emailValidation(value);
  //     },
  //     controller: provider.emailController,
  //     focusNode: provider.emailFocus,
  //     keyboardType: TextInputType.text,
  //     prefixIcon: Icon(
  //       Icons.email,
  //       size: 25,
  //       color: ColorRes.grey,
  //     ),
  //   );
  // }

  // mobileField(LoginScreenProvider provider) {
  //   return textFormField(
  //     text: "Mobile Number",
  //     validation: (value) {
  //       return provider.mobileValidation(value);
  //     },
  //     controller: provider.mobileController,
  //     focusNode: provider.mobileFocus,
  //     keyboardType: TextInputType.number,
  //     // prefixIcon: Icon(
  //     //   Icons.call,
  //     //   size: 25,
  //     //   color: ColorRes.grey,
  //     // ),
  //   );
  // }

  passField(LoginScreenProvider provider) {
    return textFormField(
      text: "Password",
      validation: (value) {
        return provider.passwordValidation(value);
      },
      suffixIcon: InkWell(
        onTap: provider.onShowPwdTap,
        child:
        Icon(provider.showPassword ? Icons.visibility : Icons.visibility_off),
      ),
      obscureText: provider.showPassword,
      controller: provider.passwordController,
      focusNode: provider.passwordFocus,
      keyboardType: TextInputType.text,
      // prefixIcon: Icon(
      //   Icons.lock,
      //   size: 25,
      //   color: ColorRes.grey,
      // ),
    );
  }

  // cPassField(LoginScreenProvider provider) {
  //   return textFormField(
  //     text: "Confirm Password".tr,
  //     validation: (value) {
  //       return provider.rePasswordValidation(value);
  //     },
  //     suffixIcon: InkWell(
  //       onTap: provider.onShowConfirmPwdTap,
  //       child: Icon(
  //         provider.showConfirmPassword ? Icons.visibility : Icons.visibility_off,
  //       ),
  //     ),
  //     obscureText: provider.showConfirmPassword,
  //     controller: provider.rePasswordController,
  //     focusNode: provider.rePasswordFocus,
  //     keyboardType: TextInputType.text,
  //     // prefixIcon: Icon(
  //     //   Icons.lock,
  //     //   size: 25,
  //     //   color: ColorRes.grey,
  //     // ),
  //   );
  // }

  // checkBoxField(provider) {
  //   return InkWell(
  //     onTap: () {
  //       provider.onChange(provider.checkBoxValue);
  //     },
  //     child: Padding(
  //       padding: EdgeInsets.symmetric(horizontal: 25),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           provider.checkBoxValue == true
  //               ? Icon(
  //             Icons.check_box,
  //             size: 25,
  //             color:
  //             // isSelectedTheme == "Dark" ? Themes.light : Themes.dark,
  //           )
  //               : Icon(
  //             Icons.check_box_outline_blank,
  //             size: 25,
  //             color:
  //             // isSelectedTheme == "Dark" ? Themes.light : Themes.dark,
  //           ),
  //           SizedBox(width: 10),
  //           Text(
  //             "agreeTermsAndConditions".tr,
  //             style: appTextStyle(
  //               textColor: ColorRes.black.withOpacity(0.8),
  //               fontSize: 15,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  registerBtn(LoginScreenProvider provider) {
    return commonContainer(
      onTap: () {
        provider.Login();
      },
      text: "Login".tr,
      style: appTextStyle(
          textColor: ColorRes.white, fontWeight: FontWeight.w500, fontSize: 18),
      width: Get.width,
      height: Get.height / 15,
      color: ColorRes.saff,
    );
  }

  alreadyAccountRow(LoginScreenProvider provider) {
    return Center(
      child: InkWell(
        onTap: () {
          provider.onSignup();
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Don't have an account ? ",
              style: appTextStyle(
                textColor: ColorRes.cusgrey,
                fontSize: 16,
              ),
            ),
            Text(
              "Sign up",
              style: TextStyle(
                color: ColorRes.saff,
                // color: isSelectedTheme == "Dark"
                //     ? Themes.darkRed
                //     : ColorRes.maroon,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
