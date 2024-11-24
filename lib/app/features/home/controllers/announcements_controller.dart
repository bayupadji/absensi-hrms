import 'package:absensi/app/data/models/announcement_model.dart';
import 'package:absensi/app/data/services/announcement_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AnnouncementController extends GetxController {
  final AnnouncementService announcementService = AnnouncementService();
  var announcements = <Announcement>[].obs; // Observable list
  var isLoading = false.obs; // Observable boolean
  var errorMessage = ''.obs; // Observable string

  @override
  void onInit() {
    super.onInit();
    fetchAnnouncements(); // Fetch announcements when the controller is initialized
  }

  Future<void> fetchAnnouncements() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final GetAnnouncement result = await announcementService.fetchAnnouncements();
      // If the result is not null, update the announcements list
      if (kDebugMode){
        print(result);
      }
      announcements.assignAll(result.data); // Update the observable list
    } catch (e) {
      errorMessage.value = e.toString(); // Set error message
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }

  String timeAgo(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return '${difference.inDays} hari yang lalu';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} jam yang lalu';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} menit yang lalu';
    } else {
      return 'Beberapa detik yang lalu';
    }
  }
}
