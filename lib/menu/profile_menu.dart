import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carepoint/routes.dart';
import 'package:carepoint/controller/home_controller.dart';
import 'package:carepoint/components/header.dart';

class ProfileMenu extends StatelessWidget {
  ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    final isAnon = false.obs;

    return Column(
      children: [
        // Header
        Header(
          name: controller.userName,
          avatarPath: controller.avatarPath,
          onNotificationTap: () => Get.toNamed(Routes.notificationPage),
        ),

        // Konten Profil
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(24, 20, 24, 120),
            child: Column(
              children: [
                // Foto Profil Bulat Halus
                ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(
                    controller.avatarPath,
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  controller.userName,
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'User ID',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
                SizedBox(height: 16),

                // Badge Mood & Streak
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildBadge(
                      child: Row(
                        children: [
                          Icon(Icons.sentiment_satisfied, color: Colors.white, size: 18),
                          SizedBox(width: 8),
                          Text('Happy', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    SizedBox(width: 12),
                    buildBadge(
                      child: Text('6 Days Streak 🔥', style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                SizedBox(height: 24),

                // Card Privacy & Security
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFF4A6659),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.shield, color: Colors.white, size: 20),
                          SizedBox(width: 8),
                          Text(
                            'Privacy & Security',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 12),
                      Container(
                        padding: EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.visibility_off, color: Color(0xFF4A6659), size: 20),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    'Mode Anonim',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: Color(0xFF4A6659),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text('BETA', style: TextStyle(color: Colors.white, fontSize: 10)),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Menyembunyikan Semua Identitas\nUntuk Kepentingan Privasi',
                                  style: TextStyle(fontSize: 11, color: Colors.black54),
                                ),
                                Obx(
                                  () => Switch(
                                    value: isAnon.value,
                                    activeColor: Color(0xFF4A6659),
                                    onChanged: (val) => isAnon.value = val,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // Helper widget badge agar tidak ada duplikasi kode
  Widget buildBadge({required Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xFF4A6659),
        borderRadius: BorderRadius.circular(12),
      ),
      child: child,
    );
  }
}