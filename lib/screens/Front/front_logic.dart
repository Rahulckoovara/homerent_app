import 'package:get/get.dart';
import 'package:tappal_app/screens/login/login/login_view.dart';

class FrontLogic extends GetxController {
  void goToLogin() {
    Get.off(const LoginPage());
  }
}