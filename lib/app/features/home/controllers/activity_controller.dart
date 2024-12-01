import 'package:absensi/app/features/home/controllers/datetime_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:absensi/app/data/models/activity_attend_model.dart';
import 'package:absensi/app/data/services/activity_service.dart';
import 'package:intl/intl.dart';

class ActivityController extends GetxController
    with StateMixin<ActivityAttendModel> {
  final ActivityService _activityService;
  final DatetimeController _datetimeController;

  ActivityController(this._activityService, this._datetimeController);

  final RxBool isLoading = false.obs;
  final Rx<String?> errorMessage = Rx<String?>(null);

  // Getter untuk tanggal saat ini dari DatetimeController
  String get currentDate => _datetimeController.currentDate;
  String get currentTime => _datetimeController.currentTime;

  @override
  void onInit() {
    super.onInit();
    fetchActivityData();
  }

  Future<void> fetchActivityData() async {
    try {
      isLoading.value = true;
      change(null, status: RxStatus.loading());

      final ActivityAttendModel? result = await _activityService.getActivity();

      if (result != null && result.data != null && result.data!.isNotEmpty) {
        // Ambil tanggal saat ini
        DateTime now = DateTime.now();
        // Hitung tanggal pertama bulan ini
        DateTime firstDayOfCurrentMonth = DateTime(now.year, now.month, 1);
        // Hitung tanggal terakhir bulan ini
        DateTime lastDayOfCurrentMonth = DateTime(now.year, now.month + 1, 0);

        // Filter data untuk hanya menampilkan aktivitas dalam bulan ini
        result.data!.removeWhere((activity) {
          if (activity.tanggal == null) return true; // Hapus jika tanggal null
          DateTime activityDate;
          try {
            activityDate = DateTime.parse(activity.tanggal!);
          } catch (e) {
            // if (kDebugMode) {
            //   print('Error parsing date: $e');
            // }
            return true; // Hapus jika terjadi error saat parsing
          }
          // Hapus aktivitas yang tidak dalam rentang bulan ini
          return activityDate.isBefore(firstDayOfCurrentMonth) ||
              activityDate.isAfter(lastDayOfCurrentMonth);
        });

        // Urutkan data dari tanggal terbaru ke terlama
        result.data!.sort((a, b) {
          if (a.tanggal == null || b.tanggal == null) return 0;

          try {
            DateTime dateA = DateTime.parse(a.tanggal!);
            DateTime dateB = DateTime.parse(b.tanggal!);
            return dateB.compareTo(dateA);
          } catch (e) {
            // if (kDebugMode) {
            //   print('Error parsing date: $e');
            // }
            return 0;
          }
        });

        // Periksa apakah ada data yang tersisa setelah filter
        if (result.data!.isNotEmpty) {
          change(result, status: RxStatus.success());
          errorMessage.value = null;
        } else {
          change(null, status: RxStatus.empty());
          errorMessage.value = 'Saat ini, tidak ada presensi yang dilakukan pada bulan ini.';
        }
      } else {
        change(null, status: RxStatus.empty());
        errorMessage.value = 'Saat ini, tidak ada presensi yang dilakukan.';
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // Utility method untuk membandingkan tanggal
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  // Method untuk mengonversi tanggal ke format yang lebih mudah dibaca
  String formatActivityDate(String? tanggal) {
    if (tanggal == null) return 'Tanggal tidak tersedia';

    try {
      DateTime activityDate = DateTime.parse(tanggal);
      return DateFormat('dd MMMM yyyy').format(activityDate);

    } catch (e) {
      // if (kDebugMode) {
      //   print('Error parsing activity date: $e');
      // }
      return 'Tanggal tidak valid';
    }
  }

  // Getter untuk mengakses data
  List<ActivityData>? get activities => state?.data;

  // Getter untuk status
  bool get hasData => state?.data != null && state!.data!.isNotEmpty;

  String formatTime(String? jam,
      {bool includeSeconds = false, String defaultValue = '-'}) {
    if (jam == null) return defaultValue;

    try {
      // Support berbagai format input
      final formats = ['HH:mm:ss', 'HH:mm', 'HH:mm:ss.SSS'];

      DateTime? parsedTime;

      // Coba parsing dengan format berbeda
      for (var format in formats) {
        try {
          parsedTime = DateFormat(format).parse(jam);
          break;
        } catch (_) {
          continue;
        }
      }

      if (parsedTime == null) return defaultValue;

      // Pilih format output
      return includeSeconds
          ? DateFormat('HH:mm:ss').format(parsedTime)
          : DateFormat('HH:mm').format(parsedTime);
    } catch (e) {
      if (kDebugMode) {
        print('Error parsing activity time: $e');
      }
      return defaultValue;
    }
  }
}
