import 'package:flutter/material.dart';
import 'package:carepoint/models/conselor_models.dart';

class CounselorCard extends StatelessWidget {
  final CounselorModels item;
  final VoidCallback? onScheduleTap;
  final VoidCallback? onProfileTap;

  CounselorCard({
    super.key,
    required this.item,
    this.onScheduleTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 14,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Baris Atas: Foto, Nama + Tags, Rating
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  item.imageUrl,
                  width: 58,
                  height: 58,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: item.tags.map((tag) {
                        return Container(
                          margin: EdgeInsets.only(right: 6),
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                            color: Color(0xFF3F564C),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            tag,
                            style: TextStyle(
                              fontFamily: 'PlusJakartaSans',
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              // Rating Bintang
              Row(
                children: [
                  Icon(Icons.star_rounded, color: Color(0xFFFFB800), size: 20),
                  SizedBox(width: 4),
                  Text(
                    item.rating,
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),

          // Deskripsi
          Text(
            item.description,
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 12,
              color: Colors.black54,
              height: 1.4,
            ),
          ),
          SizedBox(height: 16),

          // Baris Tombol Aksi
          Row(
            children: [
              actionButton(
                text: 'Buat Jadwal',
                onTap: onScheduleTap ?? () {},
              ),
              SizedBox(width: 12),
              actionButton(
                text: 'Lihat Profil',
                onTap: onProfileTap ?? () {},
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Tombol aksi navy
  Widget actionButton({required String text, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xFF2E3A70),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}