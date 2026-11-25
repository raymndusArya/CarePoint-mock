import 'package:flutter/material.dart';

class MoodOption {
  final IconData icon;
  final Color color;

  const MoodOption(this.icon, this.color);
}

class MoodCard extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelectMood;

  const MoodCard({
    super.key,
    required this.selectedIndex,
    required this.onSelectMood,
  });

  static const moods = [
    MoodOption(Icons.sentiment_very_satisfied, Color(0xFF2D5465)),
    MoodOption(Icons.sentiment_satisfied, Color(0xFF4A6659)),
    MoodOption(Icons.sentiment_dissatisfied, Color(0xFF444444)),
    MoodOption(Icons.sentiment_very_dissatisfied, Color(0xFFC62828)),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
      decoration: BoxDecoration(
        color: const Color(0xFF2D5465), // Warna biru
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: Color(0x33000000),
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Bagaimana Perasaanmu Hari Ini?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              for (var i = 0; i < moods.length; i++) ...[
                if (i > 0)
                  Container(width: 1, height: 48, color: Colors.white24),
                Expanded(
                  child: MoodButton(
                    option: moods[i],
                    isSelected: selectedIndex == i,
                    onTap: () => onSelectMood(i),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class MoodButton extends StatelessWidget {
  final MoodOption option;
  final bool isSelected;
  final VoidCallback onTap;

  const MoodButton({
    super.key,
    required this.option,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        scale: isSelected ? 1.15 : 1.0,
        duration: const Duration(milliseconds: 200),
        child: Container(
          width: 54,
          height: 54,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Color(0x33000000),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Icon(option.icon, size: 40, color: option.color),
        ),
      ),
    );
  }
}