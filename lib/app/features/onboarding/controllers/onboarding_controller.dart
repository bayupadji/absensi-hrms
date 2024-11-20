import 'package:absensi/app/app.dart';
import 'package:absensi/app/data/repositories/auth_repository.dart';
import 'package:absensi/app/data/repositories/onboarding_repository.dart';
import 'package:absensi/app/features/auth/views/login.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnboardingController extends GetxController {
  final AuthRepository authRepo = AuthRepository();
  final PageController pageController = PageController();
  var currentPage = 0.obs;
  bool isAutoScrolling = true;

  OnboardingController() {
    _startAutoScroll();
  }

  void setCurrentPage(int page) {
    currentPage.value = page;
  }

  void _startAutoScroll() async {
    while (isAutoScrolling) {
      await Future.delayed(Duration(seconds: 8));

      if (currentPage < onboardingPages.length - 1) {
        currentPage++;
        if (pageController.hasClients) {
          pageController.animateToPage(
            currentPage.value,
            duration: Duration(seconds: 2),
            curve: Curves.easeInOut,
          );
        }
      } else {
        currentPage.value = 0;
        if (pageController.hasClients) {
          pageController.jumpToPage(currentPage.value);
        }
      }
    }
  }

  Future<bool> checkLogin() async {
    try {
      final tokenData = await authRepo.getToken();
      if (kDebugMode) {
        print('Token: $tokenData');
      }

      // Jika token ditemukan, langsung arahkan ke halaman login
      if (tokenData != null && tokenData['token'] != null) {
        return true; // Return false since the user is redirected to login
      }
      return false; // User is not logged in
    } catch (e) {
      print('Error checking login status: $e');
      return false;
    }
  }

  Future<void> checkLoginOnStart() async {
    final isLoggedIn = await checkLogin();

    if (kDebugMode) {
      print('IsLogin:${isLoggedIn}');
    }
    if (isLoggedIn) {
      Get.off(() => HomeScreen());
    } else {
      Get.off(() => LoginScreen());
    }
  }

  void stopAutoScroll() {
    isAutoScrolling = false;
  }

  @override
  void onInit() {
    super.onInit;
    checkLoginOnStart();
  }

  void onMove(BuildContext context) {
    stopAutoScroll();
    Get.off(() => LoginScreen());
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
