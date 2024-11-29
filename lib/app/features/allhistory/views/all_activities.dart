import 'package:absensi/app/features/allhistory/controllers/history_controller.dart';
import 'package:absensi/app/utils/theme/colors.dart';
import 'package:absensi/app/utils/widgets/box_card/activity_box.dart';
import 'package:absensi/app/utils/widgets/loading/shimmer_loading.dart';
import 'package:absensi/app/utils/widgets/state/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AllActivities extends GetView<HistoryController> {
  const AllActivities({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengubah warna status bar untuk halaman ini
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        toolbarHeight: 56,
        title: SizedBox(
          width: double.infinity,
          child: Text(
            'Riwayat Presensi',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        actions: [
          SizedBox(
            width: 56,
          ),
        ],
      ),
      body: Column(
        children: [
          // FilterDate widget jika diperlukan
          // FilterDate(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Obx(() {
                // Skeleton Loading sebelum view data
                if (controller.isLoading.value) {
                  return ShimmerLoading(
                    itemCount: controller.activities?.length ?? 5,
                  );
                }
                // Pastikan activities tidak kosong
                if (!controller.hasData) {
                  return Center(
                    child: EmptyState(
                      title: 'Saat ini, tidak ada riwayat yang dilakukan.',
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  );
                }

                // Gunakan ListView.builder untuk menampilkan semua aktivitas
                return ListView.builder(
                  itemCount: controller.activities!.length,
                  itemBuilder: (context, index) {
                    final activity = controller.activities![index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: ActivityBox(
                        title: activity.presensi ?? 'Tidak diketahui',
                        date: controller.formatActivityDate(activity.tanggal),
                        time: controller.formatTime(activity.jam),
                      ),
                    );
                  },
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
