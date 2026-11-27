import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carepoint/models/conselor_models.dart';
import 'package:carepoint/components/conselor_card.dart'; 

class ConselorPage extends StatelessWidget {
  ConselorPage({super.key});

  final categories = ['Semua', 'Akademik', 'Keluarga', 'Tips'];
  final selectedCategory = 'Semua'.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8EEFC),
      appBar: AppBar(
        backgroundColor: Color(0xFF4A6659),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Konselor Tersedia',
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 16),

          // Filter Kategori
          SizedBox(
            height: 40,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              separatorBuilder: (context, index) => SizedBox(width: 10),
              itemBuilder: (context, index) {
                final category = categories[index];
                return Obx(() {
                  final isSelected = selectedCategory.value == category;
                  return GestureDetector(
                    onTap: () => selectedCategory.value = category,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? Color(0xFF2D5465) : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x10000000),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          category,
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? Colors.white : Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  );
                });
              },
            ),
          ),
          SizedBox(height: 16),

          // Daftar Konselor Menggunakan Reusable CounselorCard
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 24),
              itemCount: dummyCounselors.length,
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemBuilder: (context, index) {
                final item = dummyCounselors[index];
                return CounselorCard(
                  item: item,
                  onScheduleTap: () {
                    // TODO: Aksi klik buat jadwal
                  },
                  onProfileTap: () {
                    // TODO: Aksi klik lihat profil
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}