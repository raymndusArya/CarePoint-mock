import 'package:flutter/material.dart';

class ConsultationCard extends StatelessWidget {
  final String title;
  final String description;
  final String actionText;
  final IconData icon;
  final Color backgroundColor;
  final Color iconBoxColor;
  final Color iconColor;
  final Color textColor;
  final Color subtitleColor;
  final Color dividerColor;
  final VoidCallback onTap;

  ConsultationCard({
    super.key,
    required this.title,
    required this.description,
    required this.actionText,
    required this.icon,
    required this.backgroundColor,
    required this.iconBoxColor,
    required this.iconColor,
    required this.textColor,
    required this.subtitleColor,
    required this.dividerColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color(0x10000000),
              blurRadius: 14,
              offset: Offset(0, 6),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Baris: Icon & Judul
            Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    color: iconBoxColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: 22,
                  ),
                ),
                SizedBox(width: 14),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),

            // Deskripsi Singkat
            Text(
              description,
              style: TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 12,
                color: subtitleColor,
                height: 1.4,
              ),
            ),
            SizedBox(height: 14),

            // Garis Pembatas
            Container(
              width: double.infinity,
              height: 1,
              color: dividerColor,
            ),
            SizedBox(height: 12),

            // Tombol Aksi + Panah
            Row(
              children: [
                Text(
                  actionText,
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: textColor,
                  ),
                ),
                SizedBox(width: 6),
                Icon(
                  Icons.arrow_forward_rounded,
                  size: 16,
                  color: textColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}