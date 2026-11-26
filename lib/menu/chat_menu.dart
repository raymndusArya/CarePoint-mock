import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carepoint/routes.dart';
import 'package:carepoint/controller/home_controller.dart';
import 'package:carepoint/components/header.dart';
import 'package:carepoint/components/consultation_card.dart';

class ChatMenu extends StatelessWidget {
  const ChatMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        // Header atas, pake reusable
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
            padding: EdgeInsets.fromLTRB(24, 28, 24, 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul Halaman
                Text(
                  'Pilih Metode Konsultasi',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),

                // Deskripsi Halaman
                Text(
                  'Kami siap mendengarkan mu. Pilih cara yang paling nyaman bagimu.',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 13,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 24),

                // Kartu Chat Anonim
                ConsultationCard(
                  title: 'Chat Anonim',
                  description: 'Konsultasi mendalam secara anonim dengan konselor profesional dari kami.',
                  actionText: 'Mulai Chat Sekarang',
                  icon: Icons.visibility_off_rounded,
                  backgroundColor: Color(0xFFF1F6F9),
                  iconBoxColor: Color(0xFF455A52),
                  iconColor: Colors.white,
                  textColor: Colors.black87,
                  subtitleColor: Colors.black54,
                  dividerColor: Colors.black12,
                  onTap: () {
                    // TODO: Aksi mulai chat anonim
                  },
                ),
                SizedBox(height: 16),

                // Kartu Pencarian Konselor
                ConsultationCard(
                  title: 'Pencarian Konselor',
                  description:
                      'Mencari konselor yang sesuai dengan kebutuhanmu.',
                  actionText: 'Mulai Mencari',
                  icon: Icons.search_rounded,
                  backgroundColor: Color(0xFF2D5465),
                  iconBoxColor: Color(0xFF3F6575),
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  subtitleColor: Colors.white70,
                  dividerColor: Colors.white24,
                  onTap: () {
                    // TODO: Aksi pencarian konselor
                  },
                ),
                SizedBox(height: 16),

                // Kartu Buat Jadwal (Background Krem)
                ConsultationCard(
                  title: 'Buat Jadwal',
                  description: 'Buat jadwal konsultasi untuk menentukan obrolan dengan konselor.',
                  actionText: 'Buat Sekarang',
                  icon: Icons.calendar_month_rounded,
                  backgroundColor: Color(0xFFFAF2E6),
                  iconBoxColor: Color(0xFF455A52),
                  iconColor: Colors.white,
                  textColor: Colors.black87,
                  subtitleColor: Colors.black54,
                  dividerColor: Colors.black12,
                  onTap: () {
                    // TODO: Aksi buat jadwal
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
