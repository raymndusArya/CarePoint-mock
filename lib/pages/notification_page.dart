import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carepoint/models/notification_models.dart';

// Model sederhana untuk item notifikasi


class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  // Contoh dummy data notifikasi aplikasi kesehatan/wellbeing (CarePoint)
  static const List<NotificationItem> notifications = [
    NotificationItem(
      title: 'Waktunya Minum Air',
      message: 'Jangan lupa minum segelas air putih untuk menjaga hidrasi tubuhmu.',
      time: '10 mnt lalu',
      icon: Icons.water_drop_rounded,
      iconColor: Color(0xFF2D5465),
      isRead: false,
    ),
    NotificationItem(
      title: 'Catat Mood Hari Ini',
      message: 'Bagaimana perasaanmu hari ini? Luangkan 1 menit untuk check-in emosimu.',
      time: '2 jam lalu',
      icon: Icons.mood_rounded,
      iconColor: Color(0xFF4A6659),
      isRead: false,
    ),
    NotificationItem(
      title: 'Istirahat Mata Sejenak',
      message: 'Sudah cukup lama beraktivitas di layar. Pejamkan mata dan rileks sejenak.',
      time: 'Kemarin, 16:30',
      icon: Icons.remove_red_eye_rounded,
      iconColor: Color(0xFFE5A93C),
      isRead: true,
    ),
    NotificationItem(
      title: 'Selamat Datang di CarePoint!',
      message: 'Mulai perjalanan hidup lebih sehat dan teratur bersama kami.',
      time: '3 hari lalu',
      icon: Icons.favorite_rounded,
      iconColor: Color(0xFFC62828),
      isRead: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const greenColor = Color(0xFF4A6659);
    const backgroundColor = Color(0xFFF7F9FD);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: greenColor,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white, size: 20),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          'Notifikasi',
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: notifications.isEmpty
          ? _buildEmptyState()
          : ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
              itemCount: notifications.length,
              separatorBuilder: (context, index) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final item = notifications[index];
                return _buildNotificationCard(item);
              },
            ),
    );
  }

  // Tampilan kartu notifikasi
  Widget _buildNotificationCard(NotificationItem item) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: item.isRead ? Colors.transparent : const Color(0xFF4A6659).withOpacity(0.2),
          width: 1.2,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0F000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Box
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: item.iconColor.withOpacity(0.12),
              shape: BoxShape.circle,
            ),
            child: Icon(item.icon, color: item.iconColor, size: 24),
          ),
          const SizedBox(width: 14),

          // Teks Notifikasi
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.title,
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 15,
                          fontWeight: item.isRead ? FontWeight.w500 : FontWeight.w700,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Text(
                      item.time,
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 11,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  item.message,
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 13,
                    height: 1.4,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),

          // Titik penanda belum dibaca
          if (!item.isRead) ...[
            const SizedBox(width: 8),
            Container(
              margin: const EdgeInsets.only(top: 4),
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFF4A6659),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ],
      ),
    );
  }

  // Tampilan jika notifikasi kosong
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.notifications_off_outlined, size: 70, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          Text(
            'Belum ada notifikasi',
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}