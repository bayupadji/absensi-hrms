import 'package:absensi/app/data/models/onboarding_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


final List<OnboardingModel> onboardingPages = [
  OnboardingModel(
    image: 'assets/images/hello/onboard1.png',
    title: 'Selamat Datang di Aplikasi Absensi Rumah Sakit Kasih Ibu!',
    description:
        'Kami sangat senang Anda bergabung dengan tim kami. Aplikasi ini dirancang untuk memudahkan Anda dalam melakukan absensi dan mengelola waktu kerja Anda di Rumah Sakit Kasih Ibu.',
  ),
  OnboardingModel(
    image: 'assets/images/hello/onboard2.png',
    title: 'Desain dan peningkatan fitur yang mulus',
    description:
        'Sederhanakan proses SDM Anda dan tingkatkan alur kerja Anda dengan fitur intuitif kami yang dirancang untuk fleksibilitas tertinggi',
  ),
  OnboardingModel(
    image: 'assets/images/hello/onboard3.png',
    title: 'Semua tugas karyawan dalam satu aplikasi!',
    description:
        'Siap untuk produktivitas puncak? Mari selami dan tingkatkan efisiensi Anda!',
  ),
];

class OnboardingRepository {
  Future<void> setOnboardingCompleted(bool completed) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_completed', completed);
  }

  Future<bool> isOnboardingCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('onboarding_completed') ?? false;
  }
}
