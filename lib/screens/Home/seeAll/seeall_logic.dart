import 'package:get/get.dart';
import 'package:tappal_app/config/customConstants.dart';
import 'package:tappal_app/constants/nwtwork_path.dart';
import 'package:tappal_app/screens/home_details/home_details_view.dart';
import 'package:tappal_app/services/api_service.dart';

class SeeAllLogic extends GetxController {
  APIService apiService = APIService();
  final isLoading = false.obs;
  RxList<dynamic> propertyData = RxList();

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void gotoHomeDetails(String userId, String propertyId) {
    userId;
    propertyId;
    Get.to(() => HomeDetails(), arguments: [
      {"userId": userId},
      {"propertyId": propertyId}
    ]);
    print("propssedwdwdwdsss----$propertyId");
  }

  void fetchData() async {
    String? userid = await storageutils.read(CustomConstants.userId);
    print("userid:$userid");
    final dynamic response = await apiService.fetchDataWithoutQuery(
        path: "${CustomPath.baseUrl}assets",
        setLoadingState: (bool loader) {
          isLoading.value = loader;
        });
    if (response != null) {
      Map<String, dynamic> result = response;
      // propertyData.value = result['assets'];
      if (result.containsKey("assets")) {
        propertyData.value = result['assets'];
      }
      print("loading resp----$propertyData");
    }
  }
}
