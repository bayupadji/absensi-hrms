import 'package:absensi/app/app.dart';
import 'package:absensi/app/data/repositories/auth_repository.dart';
import 'package:absensi/app/data/repositories/onboarding_repository.dart';
import 'package:absensi/app/features/auth/views/login.dart';
import 'package:absensi/app/features/onboarding/views/onboarding.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnboardingController extends GetxController {
  final AuthRepository authRepo = AuthRepository();
  final OnboardingRepository onboardingRepo = OnboardingRepository();
  final PageController pageController = PageController();
  var currentPage = 0.obs;
  bool isAutoScrolling = true;

  OnboardingController() {
    _startAutoScroll();
  }

  void setCurrentPage(int page) {
    currentPage.value = page;
  }

  void stopAutoScroll() {
    isAutoScrolling = false;
  }

  @override
  void onInit() {
    super.onInit();
    checkLoginOnStart();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
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

  Future<void> completeOnboarding() async {
    await onboardingRepo.setOnboardingCompleted(true);
    // Redirect to Login or Home screen after completing onboarding
    Get.off(() => LoginScreen());
  }

  Future<bool> checkLogin() async {
    try {
      final tokenData = await authRepo.getToken();
      if (kDebugMode) {
        print('Token: $tokenData');
      }

      if (tokenData != null && tokenData['token'] != null) {
        return true; // User is logged in
      }
      return false; // User is not logged in
    } catch (e) {
      if (kDebugMode) {
        print('Error checking login status: $e');
      }
      return false;
    }
  }

  Future<void> checkLoginOnStart() async {
    final isLoggedIn = await checkLogin();
    final isOnboardingCompleted = await onboardingRepo.isOnboardingCompleted();

    if (isOnboardingCompleted) {
      if (isLoggedIn) {
        Get.off(() => HomeScreen());
      } else {
        Get.off(() => LoginScreen());
      }
    } else {
      // Show onboarding screens if not completed
      Get.off(() => OnboardingPage());
    }
  }
}
