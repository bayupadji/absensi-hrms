import 'package:flutter/material.dart';
import 'package:absensi/utils/colors.dart';

class ActivityBox extends StatelessWidget {
  final String title;
  final String date;
  final String time;

  const ActivityBox({
    super.key,
    required this.title,
    required this.date,
    required this.time
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.lightColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.primarySwatch.shade50,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Icon(
                  Icons.login_rounded,
                  size: 16,
                  color: AppColors.primarySwatch.shade500,
                ),
              ),
              SizedBox(width: 12,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColors.darkColor,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            time,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16
            )
          ),
        ],
      ),
    );
  }
}
