import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carepoint/components/button.dart';
import 'package:carepoint/components/textfield.dart';
import 'package:carepoint/controller/form_login_controller.dart';
import 'package:carepoint/routes.dart';

class FormLogin extends StatelessWidget {
  FormLogin({super.key});

  static const bgColor = Color(0xFFE8EEFC);
  static const linkColor = Color(0xFF007AFF);
  final controller = Get.put(FormLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 90),
              const Text(
                'Selamat Datang!',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Silahkan Login atau Register',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 56),

              // Card putih
              Container(
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 48),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const _FieldLabel('Email'),
                    const SizedBox(height: 8),
                    CustomTextfield(
                      myHint: 'e.g johdoe@gmail.com',
                      txtController: controller.txtUsername,
                      icon: Icons.mail,
                      isOutlined: true,
                    ),
                    const SizedBox(height: 28),
                    const _FieldLabel('Password'),
                    const SizedBox(height: 8),
                    CustomTextfield(
                      myHint: '***********',
                      txtController: controller.txtPassword,
                      icon: Icons.lock,
                      isPassword: true,
                      isOutlined: true,
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Lupa Password?',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: linkColor,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Tombol Masuk
                    Center(
                      child: CustomOperatorButton(
                        myText: 'Login',
                        onPressed: () {
                          Get.offAllNamed(Routes.homePage);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }
}