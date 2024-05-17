import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/screens/Home/home_view.dart';

class LandingLogic extends GetxController {
  final RxInt currentIndex = 0.obs;
  final List<Widget> pages = [
    HomePage(),
    Text("fav"),
    Text('profile'),
  ];
    void changePage(int index) {
      if (index < pages.length) {
        currentIndex.value = index;
      }
    }
}
