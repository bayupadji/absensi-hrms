import 'package:absensi/domain/bindings/app_binding.dart';
import 'package:absensi/domain/routes/app_routes.dart';
import 'package:absensi/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashscreens,
      initialBinding: AppBinding(),
      getPages: AppRoutes.routes,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
        primaryTextTheme: TextTheme(),
        scaffoldBackgroundColor: AppColors.backgroundColor,
        dialogBackgroundColor: AppColors.backgroundColor,
        primaryColor: AppColors.primaryColor,
      ),
    );
  }
}
