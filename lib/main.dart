import 'package:flutter/material.dart';
import 'package:flutter_app_waiter_app/cart/manage_item_provider.dart';
import 'package:flutter_app_waiter_app/chooce_payment/choice_payment_provider.dart';
import 'package:flutter_app_waiter_app/order_tab/order_tab_provider.dart';
import 'package:flutter_app_waiter_app/screens/home/home_screen.dart';
import 'package:flutter_app_waiter_app/screens/home/home_screen_provider.dart';
import 'package:flutter_app_waiter_app/screens/login/login_provider.dart';
import 'package:flutter_app_waiter_app/screens/login/login_screen.dart';
import 'package:flutter_app_waiter_app/screens/menu/item_details_provider.dart';
import 'package:flutter_app_waiter_app/screens/pending_order/pending_order_provider.dart';
import 'package:flutter_app_waiter_app/screens/table/table_screen_provider.dart';
import 'package:flutter_app_waiter_app/table_details/table_detail_screen_book_by_coustmer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>LoginScreenProvider()),
        ChangeNotifierProvider(create: (context)=>HomeScreenProvider()),
        ChangeNotifierProvider(create: (context)=>ItemDetailProvider()),
        ChangeNotifierProvider(create: (context)=>TableScreenProvider()),
        ChangeNotifierProvider(create: (context)=>ManageItemQuantityProvider()),
        ChangeNotifierProvider(create: (context)=>ChoicePaymentProvider()),
        ChangeNotifierProvider(create: (context)=>OrderTabProvider()),
        ChangeNotifierProvider(create: (context)=>WaiterPendingOrderProvider()),
        // ChangeNotifierProvider(create: (context)=>PendingOrderProvider()),
      ],
      child: ScreenUtilInit(
        designSize: Size(360,690),
        builder:()=>GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: LoginScreen(),
        ),
      ),
    );
  }
}
