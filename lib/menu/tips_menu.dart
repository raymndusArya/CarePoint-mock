import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carepoint/routes.dart';
import 'package:carepoint/controller/home_controller.dart';
import 'package:carepoint/components/header.dart';
import 'package:carepoint/components/tip_suggestion_card.dart'; // <- Import dari components

class TipsMenu extends StatelessWidget {
  TipsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        // Header atas (reusable component)
        Header(
          name: controller.userName,
          avatarPath: controller.avatarPath,
          onNotificationTap: () {
            Get.toNamed(Routes.notificationPage);
          },
        ),

        // Konten Scrollable
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(24, 24, 24, 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // -------------------------------------------------------------
                // Bagian: Sedang Populer
                // -------------------------------------------------------------
                Text(
                  'Sedang Populer',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),

                // Kartu Banner Populer
                Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x25000000),
                        blurRadius: 16,
                        offset: Offset(0, 8),
                      ),
                    ],
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.unsplash.com/photo-1543269865-cbf427effbad?q=80&w=800',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.85),
                        ],
                        stops: [0.35, 1.0],
                      ),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cara mengatasi burnout\nsaat ujian',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.25,
                          ),
                        ),
                        SizedBox(height: 12),
                        Row(
                          children: [
                            // Tombol 1: Baca Selengkapnya
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 7,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF2D5465).withOpacity(0.85),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Baca Selengkapnya',
                                style: TextStyle(
                                  fontFamily: 'PlusJakartaSans',
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(width: 8),

                            // Tombol 2: Tips Populer
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14,
                                vertical: 7,
                              ),
                              decoration: BoxDecoration(
                                color: Color(0xFF2D5465).withOpacity(0.85),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Tips Populer',
                                style: TextStyle(
                                  fontFamily: 'PlusJakartaSans',
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 28),

                // -------------------------------------------------------------
                // Bagian: Saran hari ini
                // -------------------------------------------------------------
                Text(
                  'Saran hari ini',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16),

                // Item Saran 1
                TipSuggestionCard(
                  title: 'Latihan pernafasan 5 menit',
                  subtitle: 'Sesi singkat untuk meredakan\nkecemasan berat.',
                  icon: Icons.air_rounded,
                  iconColor: Color(0xFF29B6F6),
                  iconBackgroundColor: Color(0xFFE1F5FE),
                ),
                SizedBox(height: 14),

                // Item Saran 2
                TipSuggestionCard(
                  title: 'Membiasakan tidur sehat',
                  subtitle:
                      'Tips agar setiap bangun tidur badan\nterasa segar.',
                  icon: Icons.nightlight_round,
                  iconColor: Color(0xFF1B1B1B),
                  iconBackgroundColor: Color(0xFFE8F8EE),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
