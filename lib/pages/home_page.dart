import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carepoint/components/bottom_bar.dart';
import 'package:carepoint/controller/bottom_bar_controller.dart';
import 'package:carepoint/menu/home_menu.dart';
import 'package:carepoint/menu/tips_menu.dart';
import 'package:carepoint/menu/chat_menu.dart';
import 'package:carepoint/menu/profile_menu.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(BottomBarController());

  final menus = const [
    HomeMenu(),
    TipsMenu(),
    ChatMenu(),
    ProfileMenu(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8EEFC),
      extendBody: true,
      body: Obx(() => menus[controller.index.value]),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
          child: Obx(
            () => CustomBottomBar(
              currentIndex: controller.index.value,
              onTap: (i) => controller.index.value = i,
            ),
          ),
        ),
      ),
    );
  }
}