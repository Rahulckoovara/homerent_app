import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:tappal_app/common/storage_utils.dart';
import 'package:tappal_app/config/customConstants.dart';
import 'package:tappal_app/screens/loginLoader/login_loader_view.dart';
import 'package:tappal_app/services/api_service.dart';

class ProfileLogic extends GetxController {
  final isLoading = false.obs;
  APIService apiService = APIService();
  RxString userName = RxString("");
  Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);
  final storageutils = Storageutils();

  @override
  void onInit() {
    super.onInit();
    userData();
  }

  Future<void> logout() async {
    Get.to(const LoginLoaderPage());
    storageutils.clear();
  }

  void userData() async {
    String? userid = await storageutils.read(CustomConstants.userId);
    final dynamic response = await apiService.fetchDataWithoutQuery(
        path: "https://nodeapi-backend-r7wz.onrender.com/userdetails/$userid",
        setLoadingState: (bool loader) {
          isLoading.value = loader;
        });

    if (response != null) {
      print("resonseeeeeeeeeeeeeeeeeee$response");
      Map<String, dynamic> result = response['userDetails'];
      userName.value = result['name'].toString();
      String base64Image = result['image'].toString();
      imageBytes.value = base64Decode(base64Image);
      print(result['image'].toString());
    }
  }
}
