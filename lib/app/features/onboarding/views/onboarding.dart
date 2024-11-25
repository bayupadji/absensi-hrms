import 'package:absensi/app/data/repositories/onboarding_repository.dart';
import 'package:absensi/app/features/onboarding/controllers/onboarding_controller.dart';
import 'package:absensi/app/utils/theme/colors.dart';
import 'package:absensi/app/utils/widgets/button/default_btn.dart';
import 'package:absensi/app/utils/widgets/indicators/dots_indicator.dart';
import 'package:absensi/app/utils/widgets/content/onboard_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {

    // Mengubah warna status bar untuk halaman ini
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.backgroundColor,
      statusBarIconBrightness: Brightness.dark,
    ));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: () => controller.completeOnboarding(),
              child: Container(
                padding: EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'skip',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primarySwatch.shade500),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.chevron_right,
                      size: 24,
                      color: AppColors.primarySwatch.shade500,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: controller.setCurrentPage,
                  itemCount: onboardingPages.length,
                  itemBuilder: (context, index) {
                    return OnboardingContent(
                        onboardingData: onboardingPages[index]);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DotsIndicator(),
                  DefaultButton(
                      label: 'Masuk',
                      bgColor: AppColors.primarySwatch.shade500,
                      fgColor: AppColors.backgroundColor,
                      onPressed: () {
                        controller.completeOnboarding();
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
