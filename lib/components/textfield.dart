import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatelessWidget {
  final String? label; // <- Tambahkan ini
  final String myHint;
  final TextEditingController txtController;
  final bool isPassword;
  final bool isNumber;
  final IconData? icon;
  final bool isDark;
  final bool isOutlined;

  const CustomTextfield({
    super.key,
    this.label,
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
    Widget inputField = isOutlined ? buildOutlined() : buildDefault();

    // Jika ada label, bungkus otomatis dengan teks label di atasnya
    if (label != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 4),
            child: Text(
              label!,
              style: TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 8),
          inputField,
        ],
      );
    }

    return inputField;
  }

  Widget buildOutlined() {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(22),
      borderSide: BorderSide(color: Color(0xFF9E9E9E), width: 1),
    );

    return TextField(
      controller: txtController,
      obscureText: isPassword,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      inputFormatters: isNumber ? [FilteringTextInputFormatter.digitsOnly] : [],
      style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 15),
      decoration: InputDecoration(
        hintText: myHint,
        hintStyle: TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontSize: 15,
          color: Color(0xFF9E9E9E),
        ),
        prefixIcon: icon != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Icon(icon, color: Color(0xFF4A4A4A), size: 26),
              )
            : null,
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        enabledBorder: border,
        border: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: Color(0xFF4A6659), width: 1.5),
        ),
      ),
    );
  }

  Widget buildDefault() {
    return TextField(
      controller: txtController,
      obscureText: isPassword,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      inputFormatters: isNumber ? [FilteringTextInputFormatter.digitsOnly] : [],
      style: isDark ? TextStyle(color: Colors.white, fontSize: 18) : null,
      decoration: InputDecoration(
        hintText: isDark ? null : myHint,
        labelText: isDark ? myHint : null,
        labelStyle: TextStyle(color: Color(0xFF8E8E93)),
        prefixIcon: icon != null ? Icon(icon) : null,
        filled: true,
        fillColor: isDark ? Color(0xFF0C0C0C) : Colors.grey.shade100,
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
              ? BorderSide(color: Color(0xFF2C2C2E), width: 2)
              : BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(isDark ? 24 : 12),
          borderSide: BorderSide(
            color: isDark ? Color(0xFF0A6CFF) : Colors.indigo,
            width: 2,
          ),
        ),
      ),
    );
  }
}
