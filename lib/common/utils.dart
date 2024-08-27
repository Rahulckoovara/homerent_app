import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/common/toast_type.dart';
import 'package:tappal_app/config/custom_colors.dart';

bool isEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(em);
}

bool isPhone(String mob) {
  String p =
      r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(mob);
}

Map<String, String> getApiHeaders(String token) {
  return {
   'Authorization': 'Bearer $token',
    'Content-Type':
        'application/json', // Example content type, adjust as needed
  };
}

void toast(
  String title,
  String message,
  ToastType type,
) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: type == ToastType.success
          ? CustomColors.snackSuccessBg
          : type == ToastType.error
              ? CustomColors.snackFailiureBg
              : type == ToastType.warning
                  ? CustomColors.snackWarningBg
                  : CustomColors.snackDefaultBg,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: CustomColors.snackText,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack);
}
