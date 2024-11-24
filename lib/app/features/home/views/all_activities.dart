import 'package:absensi/app/features/home/controllers/activity_controller.dart';
import 'package:absensi/app/features/schedule/views/schedule.dart';
import 'package:absensi/app/utils/theme/colors.dart';
import 'package:absensi/app/utils/widgets/box_card/activity_box.dart';
import 'package:absensi/app/utils/widgets/loading/shimmer_loading.dart';
import 'package:absensi/app/utils/widgets/state/empty_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AllActivities extends GetView<ActivityController> {

  const AllActivities({super.key});

  @override
  Widget build(BuildContext context) {

    // Mengubah warna status bar untuk halaman ini
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        toolbarHeight: 56,
        leading: GestureDetector(
          onTap: () {
            // actions back
            Get.back();
          },
          child: Icon(Icons.chevron_left_rounded),
        ),
        title: SizedBox(
          width: double.infinity,
          child: Text(
            'Detail Aktifitas',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
        actions: [
          SizedBox(
            width: 56,
          )
        ],
      ),
      body: Column(
        children: [
          FilterDate(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Obx(() {
                // Skeleton Loading sebelu view data
                if (controller.isLoading.value) {
                return ShimmerLoading(
                  itemCount: controller.activities!.length,
                );
              }

              // Pastikan activities tidak null dan memiliki data
              if (controller.activities == null ||
                  controller.activities!.isEmpty) {
                return EmptyState(
                  title: 'Saat ini, tidak ada aktivitas yang dilakukan.',
                  height: 150,
                  width: double.infinity,
                );
              }

              // Gunakan ListView.builder untuk menampilkan semua aktivitas
              return ListView.builder(
                shrinkWrap: true, // Penting untuk nested scrolling
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.activities!.length,
                itemBuilder: (context, index) {
                  final activity = controller.activities![index];

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: ActivityBox(
                      title: activity.presensi ?? 'Tidak diketahui',
                      date: controller.formatActivityDate(activity.tanggal),
                      time: controller.formatTime(activity.jam, defaultValue: '-'),
                    ),
                  );
                },
              );
              }),
            )
          )
        ]
      ),
    );
  }
}
