import 'dart:developer';
import 'package:absensi/domain/services/app_services.dart';
import 'package:absensi/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AppServices appServices = Get.put(AppServices());

  // Form fields
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Track loading state
  final isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;

    // loading animation
    Get.dialog(const Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    ));

    try {
      final email = emailController.text.trim();
      final password = passwordController.text;

      if (email.isEmpty || password.isEmpty) {
        Get.snackbar('Error', 'Please fill in both fields');
        isLoading.value = false;
        return;
      }

      // Call login method from AppServices
      final token = await appServices.login(email, password);

      if (token.isNotEmpty) {
        Get.snackbar('Success', 'Logged in successfully');
        // Navigate to the home page or main dashboard
        Get.offAllNamed('/home');
      }
    } catch (e) {
      Get.snackbar('Login Failed', e.toString());
    } finally {
      isLoading.value = false;
      Get.back();
    }
  }
}
