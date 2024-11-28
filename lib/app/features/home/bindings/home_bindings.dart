import 'package:absensi/app/data/services/activity_service.dart';
import 'package:absensi/app/features/home/controllers/activity_controller.dart';
import 'package:absensi/app/features/home/controllers/announcements_controller.dart';
import 'package:absensi/app/features/home/controllers/datetime_controller.dart';
import 'package:absensi/app/features/home/controllers/geolocator_controller.dart';
import 'package:absensi/app/features/home/controllers/home_controller.dart';
import 'package:absensi/app/features/schedule/controllers/date_picker_controller.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    //service
    Get.lazyPut<ActivityService>(() => ActivityService());

    // Controllers
    Get.lazyPut<HomeController>(() => HomeController());
    Get.put<DatetimeController>(DatetimeController());
    Get.put<LocationController>(LocationController());
    Get.lazyPut<DatePickerController>(() => DatePickerController());
    Get.lazyPut<AnnouncementController>(() => AnnouncementController());

    // Activity Controller with dependencies
    Get.lazyPut<ActivityController>(
      () => ActivityController(
        Get.find<ActivityService>(),
        Get.find<DatetimeController>(),
      ),
    );
  }
}
