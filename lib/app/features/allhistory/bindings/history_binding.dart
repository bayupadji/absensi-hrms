import 'package:get/get.dart';
import 'package:absensi/app/features/allhistory/controllers/history_controller.dart';
import 'package:absensi/app/data/services/activity_service.dart';

class HistoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActivityService>(
      () => ActivityService()
    );
    Get.lazyPut<HistoryController>(
      () => HistoryController(
        Get.find<ActivityService>()
      )
    );
  }
}
