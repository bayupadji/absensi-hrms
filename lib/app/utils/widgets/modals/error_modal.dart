import 'package:absensi/app/utils/theme/colors.dart';
import 'package:absensi/app/utils/widgets/button/default_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ErrorBottomSheet {
  static void show(String message) {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              message, // Menggunakan message sebagai teks utama
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: DefaultButton(
                label: 'Tutup', 
                onPressed: () {
                  Get.back(); // Menutup Bottom Sheet
                },
                bgColor: AppColors.primaryColor,
                fgColor: AppColors.backgroundColor,
              ),
            )
          ],
        ),
      ),
      isDismissible: true,
      enableDrag: true,
    );
  }
}
