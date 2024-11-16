import 'package:absensi/utils/colors.dart';
import 'package:flutter/material.dart';

class RewardBox extends StatelessWidget {
  final String title;
  final String bonus;
  const RewardBox({super.key, required this.title, required this.bonus});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: AppColors.backgroundColor,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: AppColors.lightColor
          )
        ),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(height: 8,),
              Text(
                bonus,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}