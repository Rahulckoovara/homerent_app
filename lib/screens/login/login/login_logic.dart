import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tappal_app/OWNER/screens/landing/landing_view.dart';
import 'package:tappal_app/common/toast_type.dart';
import 'package:tappal_app/common/utils.dart';
import 'package:tappal_app/config/customConstants.dart';
import 'package:tappal_app/screens/Home/home_view.dart';
import 'package:tappal_app/screens/Home/landing/landing_logic.dart';
import 'package:tappal_app/screens/Home/landing/landing_view.dart';
import 'package:tappal_app/screens/login/login/login_view.dart';
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
    //  print("loading........${isLoading.value}");
    if (validateInputs()) {
      var inputData = {
        "username": userId.value.trim(),
        "password": password.value,
      };

      if (isLoading.value == true) {
        Get.dialog(
          const AlertDialog(
            content: Row(
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text("Logging in..."),
              ],
            ),
          ),
          barrierDismissible:
              false, // Prevents dismissing the dialog by tapping outside
        );
      }

      final dynamic response = await apiService.postData(
          path: "https://nodeapi-backend-r7wz.onrender.com/login",
          inputData: inputData,
          setLoadingState: (bool loader) {
            //  print("loadinggg....$loader");
            print("valueueeee:::${isLoading.value}");
            isLoading.value = loader;
          });
      if (response != null) {
        isLoading.value = false;
        Map<String, dynamic> result = response;
        print("result with the sucess msggg-----$result");
        var userid = result['userId'];

        if (result['error'] == "Invalid username" ||
            (result['error']) == "Invalid password") {
          toast(
            "Login Failed",
            "Invalid username or password",
            ToastType.error,
          );
        } else {
          var accessToken = result['token'];
          print("tokeeeeeeeeeeeeeeee$accessToken");
          await storageutils.write(CustomConstants.userId, userid ?? "NA");
          await storageutils.write(
              CustomConstants.storageToken, accessToken ?? "NA");
          toast(
            "Login  Successfull",
            "You have logged in successfully",
            ToastType.success,
          );

          if (result['isowner'] == true) {
            Get.to(OwnerLandingView());
          } else {
            Get.to(LandingView());
          }
        }
      }
    }
  }
}
