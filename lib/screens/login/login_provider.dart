import 'package:flutter/cupertino.dart';
import 'package:flutter_app_waiter_app/api/login_api.dart';
import 'package:flutter_app_waiter_app/model/login_model.dart';
import 'package:flutter_app_waiter_app/screens/home/home_screen.dart';
import 'package:flutter_app_waiter_app/utils/colors.dart';

import 'package:get/get.dart';

class LoginScreenProvider extends ChangeNotifier{

LoginModel loginModel = LoginModel();
  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  FocusNode nameFocus = FocusNode();


  FocusNode passwordFocus = FocusNode();


  bool showPassword = true;
  bool showConfirmPassword = true;

  bool checkBoxValue = false;

  void init() {}

  void onShowPwdTap() {
    showPassword = !showPassword;
    notifyListeners();
  }

  void onShowConfirmPwdTap() {
    showConfirmPassword = !showConfirmPassword;
    notifyListeners();
  }

  String? nameValidation(value) {
    if (value == null || value == '') {
      return "Please enter name";
    }
  }




  String? passwordValidation(value) {
    if (value == null || value == '') {
      return "Please enter password";
    }
  }

  void clearAllFocus() {
    nameFocus.unfocus();


    passwordFocus.unfocus();

  }

  void clearAllController() {
    nameController.clear();


    passwordController.clear();

  }

  // void onChange(value) {
  //   checkBoxValue = !(checkBoxValue);
  //   notifyListeners();
  // }

  Future<void> Login() async {
    Get.to(()=>HomeScreen());
    if (formKey.currentState!.validate()) {

      // Get.to(()=>HomeScreen());
      ApiLogin.loginApi(username: nameController.text,password: passwordController.text)!.then((value){
        if(value != null){
          print("value done");
          loginModel = value;
          notifyListeners();
          Get.snackbar("Login Successfully ", "Login done ",backgroundColor:ColorRes.red400,colorText: ColorRes.white);
          Get.to(()=>HomeScreen());
          clearAllFocus();
          clearAllController();
        }
        else{
          print("value not coming from api");
        }
      });


    }
      // if (checkBoxValue == true) {
        // Loader().showLoader();
        
        // RegisterApi.signUpRequestApi(
        //   name: nameController.text,
        //   email: emailController.text,
        //   mobile: mobileController.text,
        //   password: passwordController.text,
        // );
        
      //   clearAllFocus();
        
      // } else {
      //   commonSnackBar(
      //     title: "acceptTermsCondition".tr,
      //     message: "pleaseAcceptTermsConditionForRegister".tr,
      //     snackPosition: SnackPosition.TOP,
      //     bgColor: ColorRes.red400,
      //     icon: IconRes.failureToast,
      //     colorText: ColorRes.white,
      //   );
      // }
    // }
    else {
      Get.snackbar("Fill required feild", "Please fill require filled for countinue",backgroundColor:ColorRes.red400,colorText: ColorRes.white);
    }
  }

  void onSignup() {
    // Get.to(()=>SignUpScreen());
    // !.then((value) {
    //   notifyListeners();
    // });
  }

  void onBack() {
    Get.back();
  }

}