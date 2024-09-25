import 'dart:convert';
import 'dart:typed_data';

import 'package:get/get.dart';
import 'package:tappal_app/common/storage_utils.dart';
import 'package:tappal_app/config/customConstants.dart';
import 'package:tappal_app/constants/nwtwork_path.dart';
import 'package:tappal_app/screens/login/login/login_view.dart';
import 'package:tappal_app/screens/loginLoader/login_loader_view.dart';
import 'package:tappal_app/services/api_service.dart';

class OwnerProfileLogic extends GetxController {
  final isLoading = false.obs;
  RxString userName = RxString("");
  Storageutils storageutils = Storageutils();
  APIService apiService = APIService();
  Rx<Uint8List?> imageBytes = Rx<Uint8List?>(null);

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> logout() async {
    Get.offAll(const LoginPage());
    storageutils.clear();
  }

  void fetchData() async {
    String? userid = await storageutils.read(CustomConstants.userId);
    final dynamic response = await apiService.fetchDataWithoutQuery(
        path: "${CustomPath.baseUrl}userdetails/$userid",
        setLoadingState: (bool loader) {
          isLoading.value = loader;
        });
    if (response != null) {
      print("owner profile dataaa----$response");
      Map<String, dynamic> result = response['userDetails'];
      userName.value = result['name'].toString();
      String base64Image = result['image'].toString();
      imageBytes.value = base64Decode(base64Image);
      print(result['image'].toString());
    }
  }
}
