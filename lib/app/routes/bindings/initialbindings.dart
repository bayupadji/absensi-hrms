import 'package:absensi/app/data/services/activity_service.dart';
import 'package:absensi/app/features/auth/controllers/app_controller.dart';
import 'package:absensi/app/features/auth/controllers/auth_controller.dart';
import 'package:absensi/app/features/home/controllers/activity_controller.dart';
import 'package:absensi/app/features/home/controllers/datetime_controller.dart';
import 'package:absensi/app/features/home/controllers/geolocator_controller.dart';
import 'package:absensi/app/features/home/controllers/home_controller.dart';
import 'package:absensi/app/features/onboarding/controllers/onboarding_controller.dart';
import 'package:absensi/app/features/schedule/controllers/date_picker_controller.dart';
import 'package:get/get.dart';

class Initialbindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
    Get.lazyPut<AuthController>(()=>AuthController());
    Get.lazyPut<HomeController>(()=>HomeController());
    Get.lazyPut<DatetimeController>(() => DatetimeController());
    Get.put<LocationController>(LocationController());
    Get.put<AppController>(AppController());
    Get.lazyPut<DatePickerController>(() => DatePickerController());
    Get.lazyPut<ActivityService>(() => ActivityService());
    Get.lazyPut<ActivityController>(
      () => ActivityController(
        Get.find<ActivityService>(),
        Get.find<DatetimeController>()
      )
    );
  }
}
