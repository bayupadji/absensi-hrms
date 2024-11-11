import 'package:absensi/data/models/onboarding_model.dart';
import 'package:absensi/utils/colors.dart';
import 'package:flutter/material.dart';

class OnboardingContent extends StatelessWidget {
  final OnboardingModel onboardingData;

  const OnboardingContent({super.key, required this.onboardingData});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            onboardingData.image,
            width: double.infinity,
          ),
          SizedBox(height: 24),
          Container(
            height: 260,
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  onboardingData.title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkColor,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 12),
                Text(
                  onboardingData.description,
                  style: TextStyle(fontSize: 16, color: AppColors.darkColor),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
