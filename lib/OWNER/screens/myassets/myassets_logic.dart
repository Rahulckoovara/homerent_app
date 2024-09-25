import 'package:get/get.dart';
import 'package:tappal_app/OWNER/screens/home_details/home_details_view.dart';
import 'package:tappal_app/config/customConstants.dart';
import 'package:tappal_app/constants/nwtwork_path.dart';
import 'package:tappal_app/services/api_service.dart';

class MyAssetsLogic extends GetxController {
  RxList<dynamic> assetData = RxList();
  APIService apiService = APIService();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void gotoHomeDetails(String id) {
    Get.to(OwnerHomeDetails(), arguments: [
      {"homeDetailsKey": id}
    ]);
  }

  void fetchData() async {
    String? userid = await storageutils.read(CustomConstants.userId);
    print("userid:$userid");
    final dynamic response = await apiService.fetchDataWithoutQuery(
        path: "${CustomPath.baseUrl}assets/$userid",
        setLoadingState: (bool loader) {
          isLoading.value = loader;
        });
    if (response != null) {
      print(response);
      Map<String, dynamic> result = response;
      if (result.containsKey("assets")) {
        assetData.value = result['assets'];
        print("responseee$assetData");
      }
    }
  }
}
