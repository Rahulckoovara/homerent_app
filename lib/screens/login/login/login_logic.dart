import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/OWNER/screens/landing/landing_view.dart';
import 'package:tappal_app/common/toast_type.dart';
import 'package:tappal_app/common/utils.dart';
import 'package:tappal_app/config/customConstants.dart';
import 'package:tappal_app/config/custom_colors.dart';
import 'package:tappal_app/constants/nwtwork_path.dart';
import 'package:tappal_app/screens/Home/landing/landing_view.dart';
import 'package:tappal_app/services/api_service.dart';

class LoginLogic extends GetxController {
  RxString userIdError = RxString('');
  RxString passwordError = RxString('');
  RxString userId = RxString("");
  RxString password = RxString("");
  final isLoading = false.obs;
  APIService apiService = APIService();

  void setUserId(String value) {
    userId.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  bool validateInputs() {
    userIdError.value = '';
    passwordError.value = '';

    if (userId.value.isEmpty) {
      userIdError.value = 'User ID is Empty';
      return false;
    }
    if (password.value.isEmpty) {
      passwordError.value = 'Password is Empty';
      return false;
    }

    return true;
  }

  void login() async {
    if (validateInputs()) {
      var inputData = {
        "username": userId.value.trim(),
        "password": password.value.trim(),
      };

      Get.dialog(
        const Center(
            child: CircularProgressIndicator(
          color: CustomColors.primaryColor,
        )),
        barrierDismissible: false,
      );

      try {
        final dynamic response = await apiService.postData(
          path: "${CustomPath.baseUrl}login",
          inputData: inputData,
          setLoadingState: (bool loader) {
            isLoading.value = loader;
          },
        );

        if (response != null) {
          Map<String, dynamic> result = response;
          print("the result id---$result");
          var userid = result['userId'];

          if (result['error'] == "Invalid username" ||
              result['error'] == "Invalid password") {
            if (Get.isDialogOpen == true) {
              Get.back();
            }
            toast("Login Failed", "Invalid username or password",
                ToastType.error);
          } else if (result.containsKey("token")) {
            var accessToken = result['token'];
            await storageutils.write(CustomConstants.userId, userid ?? "NA");
            await storageutils.write(
                CustomConstants.storageToken, accessToken ?? "NA");
            toast("Login Successful", "You have logged in successfully",
                ToastType.success);

            // Navigate to appropriate screen after successful login
            if (result['isowner'] == true) {
              await storageutils.write(CustomConstants.isOwner, "true");
              Get.offAll(const OwnerLandingView());
            } else {
              Get.offAll(const LandingView());
            }
          }
        } else {
          toast("Login Failed", "An error occurred , Please try again",
              ToastType.error);
          if (Get.isDialogOpen == true) {
            Get.back();
          }
        }
      } finally {
        if (Get.isDialogOpen == true) {
          Get.back();
        }
      }
    }
  }
}
