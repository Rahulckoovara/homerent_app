import 'package:get/get.dart';
import 'package:tappal_app/config/customConstants.dart';
import 'package:tappal_app/constants/nwtwork_path.dart';
import 'package:tappal_app/services/api_service.dart';

class MessageLogic extends GetxController {
  RxList<dynamic> messageData = RxList();
  APIService apiService = APIService();
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  void fetchData() async {
    String? userid = await storageutils.read(CustomConstants.userId);
    print("userid:$userid");
    final dynamic response = await apiService.fetchDataWithoutQuery(
        path: "${CustomPath.baseUrl}notifications-list/$userid",
        setLoadingState: (bool loader) {
          isLoading.value = loader;
        });
    if (response != null) {
      // print(response);
      Map<String, dynamic> result = response;
      if (result.containsKey("notifications")) {
        messageData.value = result['notifications'];
        print("response for the messages:::::$messageData");
      }
    }
  }
}
