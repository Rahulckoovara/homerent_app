import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tappal_app/common/toast_type.dart';
import 'package:tappal_app/common/utils.dart';
import 'package:tappal_app/constants/nwtwork_path.dart';
import 'package:tappal_app/screens/Home/home_view.dart';
import 'package:tappal_app/screens/Home/landing/landing_view.dart';
import 'package:tappal_app/screens/login/login/login_view.dart';
import 'package:tappal_app/services/api_service.dart';
import 'package:tappal_app/widgets/imgpickerdialog.dart';
import 'dart:convert';
import 'dart:typed_data';

class RegisterLogic extends GetxController {
  final isLoading = false.obs;
  RxBool isOwner = false.obs;

  final RxList<XFile> _selectedFiles = <XFile>[].obs;
  final RxList<String> base64Images = <String>[].obs;

  // final RxList<XFile> base64Images = <XFile>[].obs;
  // final RxList<XFile> _selectedFiles = RxList<XFile>();
  // final RxList<dynamic> mediaFileList = RxList();

  RxString userIdError = RxString('');
  RxString passwordError = RxString('');
  RxString confirmPasswordError = RxString('');
  RxString userId = RxString("");
  RxString name = RxString("");
  RxString nameError = RxString("");
  RxString password = RxString("");
  RxString confirmPassword = RxString("");
  APIService apiService = APIService();

  void goBack() {
    Get.back();
  }

  void setUserId(String value) {
    userId.value = value;
  }

  void setUserName(String value) {
    name.value = value;
  }

  void setPassword(String value) {
    password.value = value;
  }

  void setConfirmPassword(String value) {
    confirmPassword.value = value;
  }

  void setIsOwner(bool value) {
    isOwner.value = value;
  }

//validation

  bool validateInputs() {
    userIdError.value = '';
    nameError.value = '';
    passwordError.value = '';
    confirmPasswordError.value = '';

    if (userId.value.isEmpty) {
      print("empyttttttttttttt user");
      userIdError.value = 'User ID is Empty';
      return false;
    }
    if (!isEmail(userId.value)) {
      userIdError.value = 'Provide a valid email address';
      return false;
    }

    if (name.value.isEmpty) {
      print("empyttttttttttttt user");
      nameError.value = 'User Name is Empty';
      return false;
    }

    if (password.value.isEmpty) {
      confirmPasswordError.value = 'Password is Empty';
      return false;
    }

    if (password.value.length < 6) {
      passwordError.value = 'Password must be at least 6 characters';
      return false;
    }

    if (confirmPassword.value.isEmpty) {
      confirmPassword.value = 'Confirm Password is Empty';
      return false;
    }
    if (password.value != confirmPassword.value) {
      confirmPasswordError.value = 'Password and Confirm Password do not match';
      return false;
    }

    return true;
  }

  void login() async {
    //Get.to(() => LandingView());
    if (validateInputs()) {
      var inputData = {
        "username": userId.value.trim(),
        "name": name.value.trim(),
        "isowner": isOwner.value,
        "password": password.value,
        "image": base64Images.isNotEmpty ? base64Images.last : "",
      };

      print("Type of 'image' in inputData: ${inputData['image'].runtimeType}");
      print("inputtt-----$inputData");

      // Convert the input data to a JSON string
      String jsonString = jsonEncode(inputData);
      // Calculate the size of the payload in bytes
      int imageSize = utf8.encode(base64Images.last).length;

      // Print the size of the image portion of the payload
      print('Image size: $imageSize bytes');

      // You can now use the payloads

      final dynamic response = await apiService.postData(
          path: "${CustomPath.baseUrl}register",
          inputData: inputData,
          setLoadingState: (bool loader) {
            isLoading.value = loader;
          });
      print("callingggg.......");

      if (response != null) {
        Map<String, dynamic> result = response;
        if (result['message'] == "this email already in use try login") {
          toast(
            "Registration Failed",
            "This email already in use try login",
            ToastType.error,
          );
        } else {
          toast(
            " Registration Successfull",
            "You have successfully registered",
            ToastType.success,
          );
          Get.to(LoginPage());
        }
        print("responseee${result}");
        print('${result['message']}');
      }
    }
  }

//compress image

  Future<Uint8List?> compressImage(XFile file) async {
    final Uint8List? compressedImage =
        await FlutterImageCompress.compressWithFile(
      file.path,
      quality: 10,
    );
    return compressedImage;
  }

  Future<String> convertToBase64(XFile file) async {
    Uint8List? compressedImage = await compressImage(file);
    if (compressedImage != null) {
      return base64Encode(compressedImage);
    } else {
      return '';
    }
  }

//base64----------

  void uploadFile() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return ImagePickerDialog(
          () async {
            XFile? pickedFile = await pickCamera();
            if (pickedFile != null) {
              _selectedFiles.add(pickedFile);
              for (var file in _selectedFiles) {
                String base64Image = await convertToBase64(file);
                base64Images.add(base64Image);
                print("Base64 Images cameraaaaaa: $base64Image");
              }
              Get.back();
            }
          },
          () async {
            XFile? pickedFile = await pickImage();
            if (pickedFile != null) {
              _selectedFiles.add(pickedFile);
              for (var file in _selectedFiles) {
                String base64Image = await convertToBase64(file);
                base64Images.add(base64Image);
                print("Base64 Images galerryyyyy: $base64Image");
              }
              Get.back();
            }
          },
          () {
            Get.back();
          },
        );
      },
    );
  }

  Future<XFile?> pickCamera() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    return image;
  }

  Future<XFile?> pickImage() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    return image;
  }

  // Future<String> convertToBase64(XFile file) async {
  //   final bytes = await File(file.path).readAsBytes();
  //   return base64Encode(bytes);
  // }
}
