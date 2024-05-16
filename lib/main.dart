import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/screens/Front/front_view.dart';
import 'package:tappal_app/screens/Home/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      

      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
     
      themeMode: ThemeMode.dark,
      home:  HomePage(),
    );
  }
}