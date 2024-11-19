
import 'package:absensi/app/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class ScheduleBox extends StatelessWidget {
  final String subtitle;
  final String title;
  final String timeIn;
  final String timeOut;
  final VoidCallback?  onTapped;

  const ScheduleBox({
    super.key,
    required this.subtitle,
    required this.title,
    required this.timeIn,
    required this.timeOut,
    required this.onTapped
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.lightColor,
          )
        ),
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.greyColor,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  )
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: AppColors.primarySwatch.shade50,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Icon(
                            Icons.login_rounded,
                            color: AppColors.primarySwatch.shade500,
                            size: 12,
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text(
                          timeIn,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.darkColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 16,),
                    Row(
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: Color(0xFFFFEDEC),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Icon(
                            Icons.login_rounded,
                            color: AppColors.errorColor,
                            size: 12,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          timeOut,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.darkColor,
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
            Icon(
              Icons.chevron_right_rounded,
              size: 24,
              color: AppColors.greyColor,
            )
          ],
        ),
      ),
    );
  }
}
