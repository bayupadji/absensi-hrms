
import 'package:absensi/app/features/splashscreen/controllers/splash_controller.dart';
import 'package:absensi/app/utils/constants/assets.dart';
import 'package:absensi/app/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Mengubah warna status bar untuk halaman ini
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: Center(
        child: Obx(() {
          // Menggunakan Obx untuk mendengarkan perubahan pada isLoading
          return controller.isLoading.value
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(Assets.logo),
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ],
                )
              : Container(); // Jika tidak loading, bisa menampilkan konten lain
        }),
      ),
    );
  }
}
