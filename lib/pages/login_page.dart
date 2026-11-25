import 'package:flutter/material.dart';
import 'package:carepoint/components/button.dart';
import 'package:get/get.dart';
import 'package:carepoint/routes.dart';
import 'package:carepoint/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static const bgColor = Color(0xFFE8EEFC);
  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
          child: SizedBox(
            width: double.infinity, // supaya Column selebar layar (tengah)
            child: Column(
              children: [
                const Spacer(), // dorong konten ke tengah
                Container(
                  width: 134,
                  height: 134,
                  padding: const EdgeInsets.all(29),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF1E2A5A).withOpacity(0.12),
                        blurRadius: 32,
                        offset: const Offset(0, 16),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'lib/assets/images/leaf.png',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 48),
                const Text(
                  'CarePoint',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Safe Space',
                  style: TextStyle(
                    fontFamily: 'Prata',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 28),
                const Text(
                  'CarePoint by leaf team',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
                const Spacer(), // dorong tombol ke bawah
                CustomOperatorButton(
                  myText: 'Login',
                  onPressed: () {
                    Get.toNamed(Routes.loginFormPage);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
