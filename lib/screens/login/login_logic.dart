import 'package:get/get.dart';
import 'package:tappal_app/screens/Home/home_view.dart';
import 'package:tappal_app/screens/login/login_view.dart';

class LoginLogic extends GetxController {
  void goToHome() {
    Get.off(HomePage());
  }
}
