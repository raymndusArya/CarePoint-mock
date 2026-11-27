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
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: ConstrainedBox(
              // Batas lebar maksimal agar tidak terlalu lebar di layar besar
              constraints: BoxConstraints(maxWidth: 380),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20),
                  Text(
                    'Selamat Datang!',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 26, // dari 30
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 8), // dari 20
                  Text(
                    'Silahkan Login atau Register',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 15, // dari 18
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 28), // dari 56

                  // Card putih yang lebih ramping
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 28), // dari 40 & 48
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x10000000),
                          blurRadius: 20,
                          offset: Offset(0, 8),
                        ),
                      ],
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
                        SizedBox(height: 16), // dari 20

                        CustomTextfield(
                          label: 'Password',
                          myHint: '***********',
                          txtController: controller.txtPassword,
                          icon: Icons.lock,
                          isPassword: true,
                          isOutlined: true,
                        ),
                        SizedBox(height: 12), // dari 14

                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Lupa Password?',
                            style: TextStyle(
                              fontFamily: 'PlusJakartaSans',
                              fontSize: 13, // dari 15
                              fontWeight: FontWeight.w500,
                              color: linkColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 24), // dari 28

                        // button login dengan circular indicator
                        Obx(
                          () => controller.isLoading.value
                              ? Center(
                                  child: CircularProgressIndicator(
                                    color: Color(0xFF4A6659),
                                  ),
                                )
                              : Center(
                                  child: Button(
                                    myText: 'Login',
                                    height: 50, 
                                    width: double.infinity, 
                                    onPressed: () {
                                      controller.login();
                                    },
                                  ),
                                ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}