import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tappal_app/common/toast_type.dart';
import 'package:tappal_app/common/utils.dart';
import 'package:tappal_app/services/api_service.dart';
import 'package:tappal_app/widgets/imgpickerdialog.dart';

class OwnerHomePageLogic extends GetxController {
  final RxList<XFile> _selectedFilesT = <XFile>[].obs;
  final RxList<String> base64ImagesT = <String>[].obs;

  final List<RxList<XFile>> selectedFilesG = [
    <XFile>[].obs,
    <XFile>[].obs,
    <XFile>[].obs,
  ];
  final List<RxList<String>> base64ImagesG = [
    <String>[].obs,
    <String>[].obs,
    <String>[].obs,
  ];

  RxString assetName = RxString('');
  RxString assetLocation = RxString('');
  RxString bedroom = RxString('');
  RxString common = RxString('');
  RxString bathroom = RxString('');
  RxString assetDescription = RxString('');
  RxString price = RxString('');
  RxString contact = RxString('');

  RxString assetNameError = RxString('');
  RxString assetLocationError = RxString('');
  RxString bedroomError = RxString('');
  RxString commonError = RxString('');
  RxString bathroomError = RxString('');
  RxString assetDescriptionError = RxString('');
  RxString priceError = RxString('');
  RxString contactError = RxString('');

  dynamic bedroomCountId;
  dynamic commonCountId;
  dynamic bathroomCountId;

  final isLoading = false.obs;
  APIService apiService = APIService();
//value for the dropdowns
  RxList<Map<String, String>> bedroomCount = <Map<String, String>>[
    {'id': '1', "value": "1"},
    {'id': '2', "value": "2"},
    {'id': '3', "value": "3"},
    {'id': '4', "value": "4"},
    {'id': '5', "value": "5"},
    {'id': '6', "value": "6"},
    {'id': '7', "value": "7"},
    {'id': '8', "value": "8"},
    {'id': '9', "value": "9"},
    {'id': '10', "value": "10"},
  ].obs;

  RxList<Map<String, String>> commonCount = <Map<String, String>>[
    {'id': '1', "value": "1"},
    {'id': '2', "value": "2"},
    {'id': '3', "value": "3"},
    {'id': '4', "value": "4"},
    {'id': '5', "value": "5"},
  ].obs;

  RxList<Map<String, String>> bathroomCount = <Map<String, String>>[
    {'id': '1', "value": "1"},
    {'id': '2', "value": "2"},
    {'id': '3', "value": "3"},
    {'id': '4', "value": "4"},
    {'id': '5', "value": "5"},
    {'id': '6', "value": "6"},
    {'id': '7', "value": "7"},
    {'id': '8', "value": "8"},
    {'id': '9', "value": "9"},
    {'id': '10', "value": "10"},
  ].obs;

//setting the field namess
  void setAssetName(String value) {
    assetName.value = value;
  }

  void setAssetLocation(String value) {
    assetLocation.value = value;
  }

  void setAssetDescription(String value) {
    assetDescription.value = value;
  }

  void setPrice(String value) {
    price.value = value;
  }

  void setContact(String value) {
    contact.value = value;
  }

//compress for the gallery image

  Future<Uint8List?> compressImageG(XFile file) async {
    final Uint8List? compressedImage =
        await FlutterImageCompress.compressWithFile(
      file.path,
      quality: 10,
    );
    return compressedImage;
  }

  Future<String> convertToBase64G(XFile file) async {
    Uint8List? compressedImage = await compressImageG(file);
    if (compressedImage != null) {
      return base64Encode(compressedImage);
    } else {
      return '';
    }
  }

  void uploadFileG(int index) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return ImagePickerDialog(
          () async {
            XFile? pickedFile = await pickCameraG();
            if (pickedFile != null) {
              selectedFilesG[index].add(pickedFile);
              for (var file in selectedFilesG[index]) {
                String base64Image = await convertToBase64G(file);
                base64ImagesG[index].add(base64Image);
                print("Base64 Images camera: $base64Image");
              }
              Get.back();
            }
          },
          () async {
            XFile? pickedFile = await pickImageG();
            if (pickedFile != null) {
              selectedFilesG[index].add(pickedFile);
              for (var file in selectedFilesG[index]) {
                String base64Image = await convertToBase64G(file);
                base64ImagesG[index].add(base64Image);
                print("Base64 Images gallery: $base64Image");
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

  Future<XFile?> pickCameraG() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    return image;
  }

  Future<XFile?> pickImageG() async {
    final imagePicker = ImagePicker();
    final XFile? image = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    return image;
  }

//////////------------FOR THUMBNAIL----------------------------------------------------------------------

//   //compress image

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
              _selectedFilesT.add(pickedFile);
              for (var file in _selectedFilesT) {
                String base64Image = await convertToBase64(file);
                base64ImagesT.add(base64Image);
                print("Base64 Images cameraaaaaa: $base64Image");
              }
              Get.back();
            }
          },
          () async {
            XFile? pickedFile = await pickImage();
            if (pickedFile != null) {
              _selectedFilesT.add(pickedFile);
              for (var file in _selectedFilesT) {
                String base64Image = await convertToBase64(file);
                base64ImagesT.add(base64Image);
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

  //for the id selection of the dropdown

  String getSelectedBedroomCount() {
    Map<String, String>? getSelectedBedroomCount =
        bedroomCount.firstWhereOrNull(
      (item) => item['id'] == bedroomCountId,
    );
    return getSelectedBedroomCount != null
        ? getSelectedBedroomCount['value'] ?? ''
        : '';
  }

  String getSelectedBathroomCount() {
    Map<String, String>? getSelectedBathroomCount =
        bathroomCount.firstWhereOrNull(
      (item) => item['id'] == bathroomCountId,
    );
    return getSelectedBathroomCount != null
        ? getSelectedBathroomCount['value'] ?? ''
        : '';
  }

  String getSelectedCommonCount() {
    Map<String, String>? getSelectedCommonCount = commonCount.firstWhereOrNull(
      (item) => item['id'] == commonCountId,
    );
    return getSelectedCommonCount != null
        ? getSelectedCommonCount['value'] ?? ''
        : '';
  }

//validation

  bool validateInputs() {
    assetNameError.value = '';
    assetLocationError.value = '';
    bedroomError.value = '';
    bathroomError.value = '';
    priceError.value = '';
    contactError.value = '';

    assetDescriptionError.value = '';
    priceError.value = '';
    contactError.value = '';
    bathroomError.value = '';

    if (assetName.value.isEmpty) {
      print("assset empty user");
      assetNameError.value = 'Asset name is empty';
      return false;
    }

    if (assetLocation.value.isEmpty) {
      print("loc empty");
      assetLocationError.value = 'Asset Location is empty';
      return false;
    }
    if (bedroomCountId == null) {
      bedroomError.value = 'Fill Count';
      return false;
    }
    if (commonCountId == null) {
      print("jsdjgasfjg");
      commonError.value = 'Fill Count';
      // toast(
      //   "common count not selected",
      //   "Select the common count",
      //   ToastType.warning,
      // );
      return false;
    }

    if (bathroomCountId == null) {
      bathroomError.value = 'Fill Count';
      // toast(
      //   "Bathroom count not selected",
      //   "Select the Bathrrom count",
      //   ToastType.warning,
      // );
      return false;
    }

    if (assetDescription.value.isEmpty) {
      assetDescriptionError.value = 'Asset Description is empty';
      return false;
    }
    if (price.value.isEmpty) {
      priceError.value = 'Price is empty';
      return false;
    }

    if (contact.value.isEmpty) {
      contactError.value = 'contact is empty';
      return false;
    }

    return true;
  }

  //api call for the asset submission

  void submit() async {
//bedroom count
    Map<String, String>? getSelectedBedroomCount =
        bedroomCount.firstWhereOrNull(
      (item) => item['id'] == bedroomCountId['id'],
    );

    String? bedroom = getSelectedBedroomCount?['value'];
    print("=================$bedroom");
//common count
    Map<String, String>? getSelectedcommonCount = commonCount.firstWhereOrNull(
      (item) => item['id'] == commonCountId['id'],
    );

    String? common = getSelectedcommonCount?['value'];
    print("=================$common");
    //common count
    Map<String, String>? getSelectedBathroomCount =
        commonCount.firstWhereOrNull(
      (item) => item['id'] == bathroomCountId['id'],
    );

    String? bathroom = getSelectedBathroomCount?['value'];
    print("=================$bathroom");

    if (validateInputs()) {
      print(
          "this is the response${base64ImagesG.map((rxList) => rxList.isNotEmpty ? rxList.last : "").toList()}");
      print("no eroroooooooo");
      var inputData = {
        "assetname": assetName.value.toString(),
        "location": assetLocation.value.toString(),
        "bedrooms": bedroom,
        "commonHall": common,
        "bathroom": bathroom,
        "description": assetDescription.value,
        "price": price.value,
        "thumbimage": base64ImagesT.isNotEmpty ? base64ImagesT.last : " ",
        "contact": contact.value,
        "gallery": [
          base64ImagesG[0].isNotEmpty
              ? base64ImagesG[0].last
              : "", // First image
          " base64ImagesG[1].isNotEmpty? base64ImagesG[1].last: "
              "", // Second image
          " base64ImagesG[2].isNotEmpty ? base64ImagesG[2].last : "
              ""
        ]
      };

      // print("Type of 'image' in inputData: ${inputData['image'].runtimeType}");
      print("inputtt-----$inputData");

      // // Convert the input data to a JSON string
      // String jsonString = jsonEncode(inputData);

      // // Calculate the size of the payload in bytes
      // int imageSize = utf8.encode(base64Images.last).length;

      // // Print the size of the image portion of the payload
      // print('Image size: $imageSize bytes');

      // // You can now use the payloads

      final dynamic response = await apiService.postData(
          path: "https://nodeapi-backend-r7wz.onrender.com/assetdetails",
          inputData: inputData,
          setLoadingState: (bool loader) {
            isLoading.value = loader;
          });

      if (response != null) {

        Map<String, dynamic> result = response;
        print(result);
        // if (result['message'] == "this email already in use try login") {
        
        toast(
          "user asset uploaded",
          "user data uploaded succesfully",
          ToastType.success,
        );
        // }
      }
    }
  }
}
