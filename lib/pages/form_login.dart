import 'package:flutter/material.dart';

class FormLogin extends StatelessWidget {
  FormLogin({super.key});

  static const bgColor = Color(0xFFE8EEFC);
  static const greenColor = Color(0xFF4A6659);
  static const linkColor = Color(0xFF007AFF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 90),
              Text(
                'Selamat Datang!',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Silahkan Login atau Register',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 56),

              // Card putih
              Container(
                width: double.infinity,
                padding: EdgeInsets.fromLTRB(20, 40, 20, 48),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _FieldLabel('Email'),
                    SizedBox(height: 8),
                    _InputField(hint: 'e.g johdoe@gmail.com', icon: Icons.mail),
                    SizedBox(height: 28),
                    _FieldLabel('Password'),
                    SizedBox(height: 8),
                    _InputField(
                      hint: '***********',
                      icon: Icons.lock,
                      obscure: true,
                    ),
                    SizedBox(height: 14),
                    GestureDetector(
                      onTap: () {
                        // TODO: lupa password
                      },
                      child: Text(
                        'Lupa Password?',
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: linkColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 28),

                    // Tombol Masuk
                    Center(
                      child: Container(
                        width: 240,
                        height: 44,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.18),
                              blurRadius: 14,
                              offset: Offset(0, 8),
                            ),
                          ],
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            // TODO: aksi login
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: greenColor,
                            foregroundColor: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: Text(
                            'Masuk',
                            style: TextStyle(
                              fontFamily: 'PlusJakartaSans',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class _FieldLabel extends StatelessWidget {
  final String text;
  const _FieldLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 4),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool obscure;

  const _InputField({
    required this.hint,
    required this.icon,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(22),
      borderSide: BorderSide(color: Color(0xFF9E9E9E), width: 1),
    );

    return TextField(
      obscureText: obscure,
      style: TextStyle(fontFamily: 'PlusJakartaSans', fontSize: 15),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'PlusJakartaSans',
          fontSize: 15,
          color: Color(0xFF9E9E9E),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Icon(icon, color: Color(0xFF4A4A4A), size: 26),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 14),
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: BorderSide(color: Color(0xFF4A6659), width: 1.5),
        ),
      ),
    );
  }
}
