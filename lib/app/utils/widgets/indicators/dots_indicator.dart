import 'package:absensi/app/data/repositories/onboarding_repository.dart';
import 'package:absensi/app/features/onboarding/controllers/onboarding_controller.dart';
import 'package:absensi/app/utils/theme/colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DotsIndicator extends StatelessWidget {
  const DotsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final OnboardingController onboardingController = Get.find();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingPages.length,
        (index) => Obx(() => AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 5),
              height: 8,
              width: onboardingController.currentPage.value == index ? 24 : 8,
              decoration: BoxDecoration(
                color: onboardingController.currentPage.value == index
                    ? AppColors.primarySwatch.shade500
                    : AppColors.primarySwatch.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
            )),
      ),
    );
  }
}
