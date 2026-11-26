import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carepoint/routes.dart';
import 'package:http/http.dart' as http;
import 'package:carepoint/models/login_models.dart';

class FormLoginController extends GetxController {
  TextEditingController txtUsername = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  var isLoading = false.obs;
  var loginModel = Rxn<LoginModels>();

  // Fungsi snackbar modern & elegan
  void showAppSnackbar({
    required String title,
    required String message,
    bool isSuccess = false,
  }) {
    Get.snackbar(
      '',
      '',
      titleText: Text(
        title,
        style: TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      messageText: Text(
        message,
        style: TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: Colors.white.withOpacity(0.9),
        ),
      ),
      icon: Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(
          isSuccess ? Icons.check_circle_rounded : Icons.error_outline_rounded,
          color: Colors.white,
          size: 28,
        ),
      ),
      backgroundColor: isSuccess ? Color(0xFF4A6659) : Color(0xFFC62828), // Hijau tema CarePoint atau Merah elegan
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      borderRadius: 18,
      duration: Duration(seconds: 3),
      boxShadows: [
        BoxShadow(
          color: Color(0x33000000),
          blurRadius: 16,
          offset: Offset(0, 8),
        ),
      ],
      shouldIconPulse: false,
    );
  }

  // Fungsi hit API Login
  void login() async {
    if (txtUsername.text.trim().isEmpty || txtPassword.text.trim().isEmpty) {
      showAppSnackbar(
        title: "Perhatian",
        message: "Username dan password harus diisi.",
        isSuccess: false,
      );
      return;
    }

    try {
      isLoading.value = true;
      final url = Uri.parse("https://mediadwi.com/api/latihan/login");

      final response = await http.post(
        url,
        body: {
          "username": txtUsername.text.trim(),
          "password": txtPassword.text.trim(),
        },
      );

      await Future.delayed(Duration(milliseconds: 600));
      isLoading.value = false;

      if (response.statusCode == 200) {
        loginModel.value = loginModelsFromJson(response.body);

        if (loginModel.value?.status == true) {
          showAppSnackbar(
            title: "Berhasil Masuk",
            message: loginModel.value!.message,
            isSuccess: true,
          );
          Get.offAllNamed(Routes.homePage);
        } else {
          showAppSnackbar(
            title: "Gagal Masuk",
            message: loginModel.value?.message ?? "Username atau password salah.",
            isSuccess: false,
          );
        }
      } else {
        showAppSnackbar(
          title: "Koneksi Terganggu",
          message: "Tidak dapat terhubung ke server. Periksa internet Anda.",
          isSuccess: false,
        );
      }
    } catch (e) {
      isLoading.value = false;
      showAppSnackbar(
        title: "Terjadi Kesalahan",
        message: e.toString(),
        isSuccess: false,
      );
    }
  }
}