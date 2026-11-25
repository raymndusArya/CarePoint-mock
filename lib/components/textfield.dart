import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatelessWidget {
  final String myHint;
  final TextEditingController txtController;
  final bool isPassword;
  final bool isNumber;
  final IconData? icon;

  // true = tampilan gelap seperti desain (label naik saat fokus)
  final bool isDark;

  // true = tampilan putih dengan border abu (dipakai di form login)
  final bool isOutlined;

  const CustomTextfield({
    super.key,
    required this.myHint,
    required this.txtController,
    this.isPassword = false,
    this.isNumber = false,
    this.icon,
    this.isDark = false,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isOutlined) return _buildOutlined();
    return _buildDefault();
  }

  // Gaya form login: latar putih, border abu, ikon di kiri
  Widget _buildOutlined() {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(22),
      borderSide: const BorderSide(color: Color(0xFF9E9E9E), width: 1),
    );

    return TextField(
      controller: txtController,
      obscureText: isPassword,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      inputFormatters: isNumber ? [FilteringTextInputFormatter.digitsOnly] : [],
      style: const TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 15),
      decoration: InputDecoration(
        hintText: myHint,
        hintStyle: const TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontSize: 15,
          color: Color(0xFF9E9E9E),
        ),
        prefixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Icon(icon, color: const Color(0xFF4A4A4A), size: 26),
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        enabledBorder: border,
        border: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(color: Color(0xFF4A6659), width: 1.5),
        ),
      ),
    );
  }

  // Gaya lama (terang / gelap), tidak diubah
  Widget _buildDefault() {
    return TextField(
      controller: txtController,
      obscureText: isPassword,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      inputFormatters: isNumber ? [FilteringTextInputFormatter.digitsOnly] : [],
      style: isDark ? const TextStyle(color: Colors.white, fontSize: 18) : null,
      decoration: InputDecoration(
        // gelap: pakai label (naik saat fokus), terang: pakai hint biasa
        hintText: isDark ? null : myHint,
        labelText: isDark ? myHint : null,
        labelStyle: const TextStyle(color: Color(0xFF8E8E93)),
        prefixIcon: icon != null ? Icon(icon) : null,
        filled: true,
        fillColor: isDark ? const Color(0xFF0C0C0C) : Colors.grey.shade100,
        contentPadding: EdgeInsets.symmetric(
          horizontal: isDark ? 24 : 16,
          vertical: isDark ? 22 : 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isDark ? 24 : 12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isDark ? 24 : 12),
          borderSide: isDark
              ? const BorderSide(color: Color(0xFF2C2C2E), width: 2)
              : BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isDark ? 24 : 12),
          borderSide: BorderSide(
            color: isDark ? const Color(0xFF0A6CFF) : Colors.indigo,
            width: 2,
          ),
        ),
      ),
    );
  }
}