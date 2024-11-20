import 'package:absensi/app/data/services/auth_service.dart';
import 'package:absensi/app/utils/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final AuthService authService = Get.put(AuthService());

  // Form fields
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // Track loading state
  final isLoading = false.obs;

  Future<void> login() async {
    isLoading.value = true;

    // Show loading animation
    Get.dialog(const Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
      ),
    ));

    try {
      final username = usernameController.text.trim();
      final password = passwordController.text;

      // log untuk debugging
      // print('Username: "$username"');
      // print('Password: "$password"');

      if (username.isEmpty || password.isEmpty) {
        Get.snackbar('Error', 'Please fill in both fields');
        return;
      }

      // Call login method from AppServices
      final token = await authService.auth(username, password);

      if (token.isNotEmpty) {
        Get.snackbar('Success', 'Logged in successfully');
        // Navigate to the home page or main dashboard
        Get.offAllNamed('/home');
      }
    } catch (e) {
      Get.back();
      Get.snackbar('Login Failed', e.toString());
    } finally {
      isLoading.value = false;
      Get.back(); // Close the loading dialog
    }
  }
}
