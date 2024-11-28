// lib/app/features/splash/controllers/splash_controller.dart
import 'package:absensi/app/routes/routes_name.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 3));
    isLoading.value = false; // Mengubah status loading

    // Navigasi ke halaman onboarding
    navigateToOnboarding();
  }

  void navigateToOnboarding() {
    Get.offNamed(RoutesName.onboarding);
  }
}
