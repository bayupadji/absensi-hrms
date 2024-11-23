import 'package:absensi/app/data/services/auth_service.dart';
import 'package:absensi/app/utils/widgets/loading/logo_loading.dart';
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
    Get.dialog(LogoLoading());

    try {
      final username = usernameController.text.trim();
      final password = passwordController.text;

      if (_isInputValid(username, password)) {
        final token = await _performLogin(username, password);
        if (token.isNotEmpty) {
          _onLoginSuccess();
        }
      }
    } catch (e) {
      _onLoginFailed(e);
    } finally {
      _closeLoadingDialog();
    }
  }

  bool _isInputValid(String username, String password) {
    if (username.isEmpty || password.isEmpty) {
      Get.snackbar('Error', 'Please fill in both fields');
      return false;
    }
    return true;
  }

  Future<String> _performLogin(String username, String password) async {
    return await authService.auth(username, password);
  }

  void _onLoginSuccess() {
    Get.snackbar('Success', 'Logged in successfully');
    // Navigate to the home page or main dashboard
    Get.offAllNamed('/home');
  }

  void _onLoginFailed(dynamic error) {
    Get.snackbar('Login Failed', error.toString());
  }

  void _closeLoadingDialog() {
    isLoading.value = false;
    Get.back(); // Close the loading dialog
  }
}
