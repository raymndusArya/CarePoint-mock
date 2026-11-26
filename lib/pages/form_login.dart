import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carepoint/components/button.dart';
import 'package:carepoint/components/textfield.dart';
import 'package:carepoint/controller/form_login_controller.dart';

class FormLogin extends StatelessWidget {
  FormLogin({super.key});

  final bgColor = Color(0xFFE8EEFC);
  final linkColor = Color(0xFF007AFF);
  final controller = Get.put(FormLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 90),
              Text(
                'Selamat Datang!',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Silahkan Login atau Register',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 56),

              // Card putih
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 40, 20, 48),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextfield(
                      label: 'Email / Username',
                      myHint: 'e.g johdoe@gmail.com',
                      txtController: controller.txtUsername,
                      icon: Icons.mail,
                      isOutlined: true,
                    ),
                    SizedBox(height: 20),

                    CustomTextfield(
                      label: 'Password',
                      myHint: '***********',
                      txtController: controller.txtPassword,
                      icon: Icons.lock,
                      isPassword: true,
                      isOutlined: true,
                    ),
                    SizedBox(height: 14),

                    Text(
                      'Lupa Password?',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: linkColor,
                      ),
                    ),
                    SizedBox(height: 28),

                    // Tombol Masuk dengan Indikator Loading
                    Obx(
                      () => controller.isLoading.value
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFF4A6659),
                              ),
                            )
                          : Center(
                              child: CustomOperatorButton(  
                                myText: 'Login',
                                onPressed: () {
                                  controller.login();
                                },
                              ),
                            ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
