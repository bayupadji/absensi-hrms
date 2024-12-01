import 'package:absensi/app/data/models/announcement_model.dart';
import 'package:absensi/app/data/services/announcement_service.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AnnouncementController extends GetxController {
  final AnnouncementService announcementService = AnnouncementService();
  var announcements = <Announcement>[].obs; // Observable list
  var isLoading = false.obs; // Observable boolean
  var errorMessage = ''.obs; // Observable string

  @override
  void onInit() {
    super.onInit();
    fetchAnnouncements();
  }

  Future<void> fetchAnnouncements() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      final GetAnnouncement? result = await announcementService.fetchAnnouncements();

      if (result != null && result.data.isNotEmpty) {
        // Update and format each announcement
        final formattedData = result.data.map((announcement) {
          announcement.formattedExpiryDate = formatExpiryDate(announcement.tglBerakhir);
          return announcement;
        }).toList();
        announcements.assignAll(formattedData);
      } else {
        errorMessage.value = 'No announcements found';
      }

      if (kDebugMode) {
        print(result);
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Function to format expiry date
  String formatExpiryDate(DateTime? expiryDate) {
    if (expiryDate == null) return 'Invalid date';
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return formatter.format(expiryDate);
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
