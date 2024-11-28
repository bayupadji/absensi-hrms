import 'package:absensi/app/routes/app_routes.dart';
import 'package:absensi/app/routes/routes_name.dart';
import 'package:absensi/app/utils/theme/colors.dart';
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
      initialRoute: RoutesName.splashscreens,
      getPages: Routes.pages,
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
        scaffoldBackgroundColor: AppColors.backgroundColor,
        dialogBackgroundColor: AppColors.backgroundColor,
        primaryColor: AppColors.primarySwatch.shade500,
      ),
    );
  }
}
