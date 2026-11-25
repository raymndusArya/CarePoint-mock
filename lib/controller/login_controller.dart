import 'package:carepoint/routes.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  // Pindah ke halaman form login (Email + Password)
  static const String nextRoute = Routes.loginFormPage;
  void goToLoginForm() {
    Get.toNamed(Routes.loginFormPage);
  }
}
