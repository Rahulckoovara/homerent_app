import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/OWNER/screens/OwHomescreen/owhome_view.dart';
import 'package:tappal_app/OWNER/screens/owprofile/owprofile_view.dart';
import 'package:tappal_app/screens/Home/home_view.dart';
import 'package:tappal_app/screens/profile/profile_view.dart';

class OwnerLandingLogic extends GetxController {
  final RxInt currentIndex = 0.obs;
  final List<Widget> pages = [OwnerHomePage(), OwnerProfilePage()];
  void changePage(int index) {
    if (index < pages.length) {
      currentIndex.value = index;
    }
  }
}
