import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const barColor = Color(0xFF4A6659);

  static const _icons = [
    Icons.home_outlined,
    Icons.menu_book_outlined,
    Icons.chat_bubble_outline,
    Icons.person_outline,
  ];

  static const _activeIcons = [
    Icons.home_rounded,
    Icons.menu_book_rounded,
    Icons.chat_bubble_rounded,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    final count = _icons.length;

    // posisi pill: -1 (paling kiri) sampai 1 (paling kanan)
    final alignX = -1 + (2 * currentIndex / (count - 1));

    return Container(
      height: 64,
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: barColor,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.18),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Pill yang "berjalan" ke item aktif
          AnimatedAlign(
            alignment: Alignment(alignX, 0),
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeOutCubic,
            child: FractionallySizedBox(
              widthFactor: 1 / count,
              heightFactor: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),

          // Ikon-ikon
          Row(
            children: List.generate(count, (i) {
              final selected = i == currentIndex;
              return Expanded(
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onTap(i),
                  child: Center(
                    child: AnimatedScale(
                      scale: selected ? 1.1 : 1.0,
                      duration: const Duration(milliseconds: 250),
                      child: Icon(
                        selected ? _activeIcons[i] : _icons[i],
                        size: 28,
                        color: selected
                            ? Colors.white
                            : Colors.white.withOpacity(0.75),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
