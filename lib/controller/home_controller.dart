import 'package:get/get.dart';

class HomeController extends GetxController {
  // Data user (nanti bisa diambil dari hasil login)
  final userName = 'Fernando Torres';
  final avatarPath = 'lib/assets/images/leaf.png';

  // Kalimat motivasi hari ini
  final motivation =
      'Besar atau kecilnya langkahmu hari ini tidak jadi masalah, '
      'yang penting arahnya sudah benar. Konsistensi mengalahkan intensitas.';

  // Mood yang dipilih: null = belum memilih, 0..3 = urutan mood
  final selectedMood = RxnInt();

  void selectMood(int index) {
    selectedMood.value = index;
  }
}