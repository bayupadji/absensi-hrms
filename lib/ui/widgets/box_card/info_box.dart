import 'package:absensi/utils/colors.dart';
import 'package:flutter/material.dart';

class InfoBox extends StatelessWidget {
  final String label;
  final String desc;
  final String time;
  final String expiry;
  final VoidCallback? onPressed;

  const InfoBox({
    super.key,
    required this.label,
    this.onPressed,
    required this.desc,
    required this.time,
    required this.expiry
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.lightColor,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.darkColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 8,),
            Text(
              desc,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.darkColor,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.greyColor,
                  ),
                ),
                Text(
                  expiry,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.greyColor,
                  ),
                ),
              ]
            )
          ]
        ),
      ),
    );
  }
}
