import 'package:absensi/domain/controllers/app_controller.dart';
import 'package:absensi/domain/controllers/auth/auth_controller.dart';
import 'package:absensi/domain/controllers/filters/date_picker_controller.dart';
import 'package:absensi/domain/controllers/home/datetime_controller.dart';
import 'package:absensi/domain/controllers/home/geolocator_controller.dart';
import 'package:absensi/domain/controllers/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:absensi/domain/controllers/onboarding/onboarding_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
    Get.lazyPut<AuthController>(() => AuthController());
    Get.put<HomeController>(HomeController());
    Get.put<DatetimeController>(DatetimeController());
    Get.put<LocationController>(LocationController());
    Get.put<AppController>(AppController());
    Get.lazyPut<DatePickerController>(() => DatePickerController());
  }
}
