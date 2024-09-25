import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:tappal_app/config/customConstants.dart';
import 'package:tappal_app/constants/nwtwork_path.dart';
import 'package:tappal_app/services/api_service.dart';

class OwnerHomeDetailsLogic extends GetxController {
  dynamic argumentData = Get.arguments;
  dynamic homeDetailsId;
  APIService apiService = APIService();
  final isLoading = false.obs;
  RxString houseName = RxString('');
  RxString houseLocation = RxString('');
  RxString houseBedroom = RxString('');
  RxString houseCommon = RxString('');
  RxString houseBathroom = RxString('');
  RxString housePrice = RxString('');
  RxString houseDescription = RxString("");
  Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);

  // RxString houseContact = RxString('');

  @override
  void onInit() {
    fetchData();
    super.onInit();
    if (argumentData != null) {
      homeDetailsId = argumentData[0]['homeDetailsKey'];
      print("keyid::$homeDetailsId");
    }
  }

  void fetchData() async {
    String? userid = await storageutils.read(CustomConstants.userId);
    print("userid:$userid");
    final dynamic response = await apiService.fetchDataWithoutQuery(
        path: "${CustomPath.baseUrl}assets/$userid/$homeDetailsId",
        setLoadingState: (bool loader) {
          isLoading.value = loader;
        });
    if (response != null) {
      Map<String, dynamic> result = response;
      if (result.containsKey("asset")) {
        houseName.value =
            result['asset'] != null && result['asset']['assetname'] != null
                ? result['asset']['assetname'].toString()
                : '';
        houseLocation.value =
            result['asset'] != null && result['asset']['location'] != null
                ? result['asset']['location'].toString()
                : '';
        houseBedroom.value =
            result['asset'] != null && result['asset']['bedrooms'] != null
                ? result['asset']['bedrooms'].toString()
                : '';
        houseCommon.value =
            result['asset'] != null && result['asset']['commonHall'] != null
                ? result['asset']['commonHall'].toString()
                : '';
        houseBathroom.value =
            result['asset'] != null && result['asset']['bathroom'] != null
                ? result['asset']['bathroom'].toString()
                : '';
        housePrice.value =
            result['asset'] != null && result['asset']['price'] != null
                ? result['asset']['price'].toString()
                : '';
        houseDescription.value =
            result['asset'] != null && result['asset']['description'] != null
                ? result['asset']['description'].toString()
                : '';
        String base64Image = result['asset']['thumbimage'].toString();
        imageBytes.value = base64Decode(base64Image);
        // houseContact.value=   result['asset'] != null && result['asset']['contact'] != null
        // ? result['asset']['contact']
        // : '';
      }

      print("this is reslt::$result");
      //if(result.containsKey("assets")) {}
    }
  }
}
