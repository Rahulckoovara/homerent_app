import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tappal_app/OWNER/screens/landing/landing_view.dart';
import 'package:tappal_app/common/storage_utils.dart';
import 'package:tappal_app/config/customConstants.dart';
import 'package:tappal_app/screens/Home/landing/landing_view.dart';
import 'package:tappal_app/screens/login/login/login_view.dart';

class LoginLoaderLogic extends GetxController with WidgetsBindingObserver {
  final storageutils = Storageutils();
  final isInternet = true.obs;
  late RxString userName = RxString("");
  final Storageutils storage = Storageutils();

  @override
  void onInit() {
    checkToken();
    super.onInit();
  }

  void checkToken() async {
    String? token = await storageutils.read(CustomConstants.storageToken);
    if (token != null && token.isNotEmpty) {
      print("token is present");
      final ownerStatus = await storage.read(CustomConstants.isOwner);
      if (ownerStatus == "true") {
        print("THIs is OWNER");

        // Token is present, navigate to the app's main page
        Get.off(  
            () => const OwnerLandingView()); // Or the appropriate landing page
      } else {
        print("THIs is not  notttt  owner");
        Get.off(() => const LandingView());
      }
    } else {
      print("goto login page");
      // No token, navigate to the login page
      Get.off(() => const LoginPage());
    }
  }
}

// @override
// void didChangeAppLifecycleState(AppLifecycleState state) {
//   if (state == AppLifecycleState.resumed) {
//     // Call a method to check if we should execute something
//     executeAfterReturningToApp();
//   }
// }

// Future<void> executeAfterReturningToApp() async {
//   // Check any conditions to determine if we should execute something
//   if (Get.currentRoute == '/LoginLoaderPage') {
//     // Execute your desired logic here

//     SystemNavigator.pop();
//   }
// }
