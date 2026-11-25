import 'package:flutter/material.dart';

class HomeGreeting extends StatelessWidget {
  final String name;
  final String? subtitle;

  const HomeGreeting({
    super.key,
    required this.name,
    this.subtitle = 'Semoga Hari mu......',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Halo! $name',
          style: const TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: 24,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 8),
          Text(
            subtitle!,
            style: const TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ],
      ],
    );
  }
}