import 'package:absensi/app/features/onboarding/controllers/onboarding_controller.dart';
import 'package:absensi/app/features/onboarding/controllers/splash_controller.dart';
import 'package:get/get.dart';

class OnboardBindings extends Bindings {
  @override
  void dependencies() {
    // Controllers
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}

