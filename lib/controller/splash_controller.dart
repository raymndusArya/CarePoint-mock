import 'package:carepoint/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  // Ganti dengan nama route tujuan di routes.dart
  static const String nextRoute = Routes.loginPage;
  // Durasi splash
  static const Duration delay = Duration(seconds: 2);

  @override
  void onReady() {
    super.onReady();
    goToNext();
  }

  Future<void> goToNext() async {
    await Future.delayed(delay);
    Get.offNamed(nextRoute);
  }
}
