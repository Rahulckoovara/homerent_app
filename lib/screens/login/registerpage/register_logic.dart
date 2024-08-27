// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:tappal_app/widgets/imgpickerdialog.dart';

// class RegisterLogic extends GetxController {
//   final RxList<XFile> _selectedFiles = RxList<XFile>();
//   final RxList<dynamic> mediaFileList = RxList();
//   RxString userIdError = RxString('');
//   RxString passwordError = RxString('');
//   RxString confirmPasswordError = RxString('');
//   RxString userId = RxString("");
//   RxString password = RxString("");
//   RxString confirmPassword = RxString("");


//   void goBack() {
//     Get.back();
//   }

  
//   void setUserId(String value) {
//     userId.value = value;
//   }

//   void setPassword(String value) {
//     password.value = value;
//   }

//   void setConfirmPassword(String value) {
//     confirmPassword.value = value;
//   }

// //validation

//   bool validateInputs() {
//     userIdError.value = '';
//     passwordError.value = '';
//     confirmPasswordError.value = '';

//     if (userId.value.isEmpty) {
//       userIdError.value = 'User ID is Empty';
//       return false;
//     }
//     if (password.value.isEmpty) {
//       passwordError.value = 'Password is Empty';
//       return false;
//     }
//     if (confirmPassword.value.isEmpty) {
//       passwordError.value = 'Confirm Password is Empty';
//       return false;
//     }
//     if(password.value!=confirmPassword.value){
//       confirmPasswordError.value = 'Password and Confirm Password do not match';
//       return false;
//     }

//     return true;
//   }



//   void uploadFile() {
//     showDialog(
//         context: Get.context!,
//         builder: (BuildContext context) {
//           return ImagePickerDialog(() async {
//             XFile? pickedFile = await pickCamera();
//             if (pickedFile != null) {
//               _selectedFiles.add(pickedFile);
//               _selectedFiles.forEach((file) {});
//               Get.back();
//             }
//           }, () async {
//             XFile? pickedFile = await pickImage();
//             if (pickedFile != null) {
//               _selectedFiles.add(pickedFile);
//               _selectedFiles.forEach((file) {});
//             }
//           }, () {
//             Get.back();
//           });
//         });
//   }

//   Future<XFile?> pickCamera() async {
//     final imagePicker = ImagePicker();
//     final XFile? image = await imagePicker.pickImage(
//       source: ImageSource.camera, // Adjust for camera: ImageSource.camera
//     );
//     mediaFileList.add(image!);
//     return image;
//   }

//   Future<XFile?> pickImage() async {
//     final imagePicker = ImagePicker();
//     final XFile? image = await imagePicker.pickImage(
//       source: ImageSource.gallery, // Adjust for camera: ImageSource.camera
//     );
//     mediaFileList.add(image!);
//     return image;
//   }
// }
