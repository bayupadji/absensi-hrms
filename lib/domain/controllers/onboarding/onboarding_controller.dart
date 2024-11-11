import 'package:absensi/data/repositories/onboarding_repository.dart';
import 'package:absensi/ui/views/auth/login.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OnboardingController extends GetxController {
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

  void stopAutoScroll() {
    isAutoScrolling = false;
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
