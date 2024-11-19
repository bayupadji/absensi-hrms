
import 'package:absensi/app/utils/constants/assets.dart';
import 'package:absensi/app/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class ProfileBox extends StatelessWidget {
  final String title;
  final String jobtitle;
  final String category;
  const ProfileBox({super.key, required this.title, required this.jobtitle, required this.category});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.lightColor,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundImage: AssetImage(Assets.avatar),
              ),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    jobtitle,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.greyColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Positioned(
          top: 48,
          right: 0,
          child: Container(
            width: 108,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0x2AFFCF30),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomRight: Radius.circular(12)
              ),
            ),
            child: Text(
              category.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Color(0xFF9E7A06)
              ),
            )
          ),
        )
      ],
    );
  }
}