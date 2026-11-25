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

  // untuk hit API
  void login() async {
    if (txtUsername.text.toString().isEmpty ||
        txtPassword.text.toString().isEmpty) {
      Get.snackbar("Error", "Username dan password harus terisi.");
    } else {
      try {
        isLoading.value = true;
        final url = Uri.parse("https://mediadwi.com/api/latihan/login");

        final response = await http.post(
          url,
          body: {
            "username": txtUsername.text.toString(),
            "password": txtPassword.text.toString(),
          },
        );
        await Future.delayed(const Duration(milliseconds: 800));

        isLoading.value = false;
        
        if (response.statusCode == 200) {
          loginModel.value = loginModelsFromJson(response.body);
          //ambil message dari JSONObject
          if (loginModel.value?.status == true) {
            Get.snackbar("Berhasil", loginModel.value!.message,
            backgroundColor: Colors.blue,
            colorText: Colors.white,
            snackPosition: SnackPosition.TOP);
            Get.offAllNamed(Routes.homePage);
          } else {
            Get.snackbar("Gagal", loginModel.value!.message);
          }
        } else {
          Get.snackbar("Gagal", "Cek koneksi internet",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP);
        }
      } catch (e) {
        Get.snackbar("Gagal", e.toString());
      }
    }
  }
}