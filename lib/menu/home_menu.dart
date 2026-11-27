import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carepoint/routes.dart';
import 'package:carepoint/controller/home_controller.dart';
import 'package:carepoint/components/header.dart';
import 'package:carepoint/components/greeting.dart';
import 'package:carepoint/components/mood_card.dart';
import 'package:carepoint/components/motivation_card.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return Column(
      children: [
        // Header
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
            padding: EdgeInsets.fromLTRB(24, 32, 24, 120),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Greeting Component
                HomeGreeting(name: controller.userName),
                SizedBox(height: 28),

                // Mood Card Component
                Obx(
                  () => MoodCard(
                    selectedIndex: controller.selectedMood.value ?? -1,
                    onSelectMood: controller.selectMood,
                  ),
                ),
                SizedBox(height: 20),

                // Motivation Card Component
                MotivationCard(text: controller.motivation),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
