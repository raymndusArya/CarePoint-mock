import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carepoint/controller/splash_controller.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  static const bgColor = Color(0xFFE8EEFC);
  final controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 134,
              height: 134,
              padding: EdgeInsets.all(29),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(45),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xFF1E2A5A).withOpacity(0.12),
                    blurRadius: 32,
                    offset: Offset(0, 16),
                  ),
                ],
              ),
              child: Image.asset(
                'lib/assets/images/leaf.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 48),

            Text(
              'CarePoint',
              style: TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 35,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Safe Space',
              style: TextStyle(
                fontFamily: 'Prata',
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 28),
            Text('CarePoint by leaf team',
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Colors.black87
            ),)
          ],
        ),
      ),
    );
  }
}
