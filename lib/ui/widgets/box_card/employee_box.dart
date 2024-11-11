import 'package:absensi/utils/assets.dart';
import 'package:absensi/utils/colors.dart';
import 'package:flutter/material.dart';

class EmployeeBox extends StatelessWidget {
  final String title;
  final String jobtitle;
  final String status;
  const EmployeeBox({super.key, required this.title, required this.jobtitle, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.lightColor,
        )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(Assets.avatar),
                radius: 24,
              ),
              const SizedBox(width: 12),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkColor,
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    jobtitle,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyColor,
                    )
                  ),
                ]
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: status == 'Tetap'
                      ? const Color(0x3145E88E)
                      : const Color(0x2DFC4C3C),
                ),
                child: Text(status,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: status == 'Tetap'
                          ? AppColors.primaryColor
                          : AppColors.errorColor,
                    )
                  )
                ),
                SizedBox(width: 8,),
                Icon(
                  Icons.arrow_right_outlined,
                  color: AppColors.greyColor,
                )
            ],
          ),
        ],
      ),
    );
  }
}
