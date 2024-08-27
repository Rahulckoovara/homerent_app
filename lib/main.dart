import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/OWNER/screens/landing/landing_view.dart';
import 'package:tappal_app/screens/Front/front_view.dart';
import 'package:tappal_app/screens/Home/home_view.dart';
import 'package:tappal_app/screens/home_details/home_details_view.dart';
import 'package:tappal_app/screens/login/login/login_view.dart';
import 'package:tappal_app/screens/login/registerpage/register_view.dart';
import 'package:tappal_app/screens/login/userReg/userReg_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Flutter Demo',
      home: UserRegPage(),
    );
  }
}
