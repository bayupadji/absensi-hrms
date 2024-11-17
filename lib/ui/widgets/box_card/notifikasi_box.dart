import 'package:absensi/utils/assets.dart';
import 'package:absensi/utils/colors.dart';
import 'package:flutter/material.dart';

class NotifikasiBox extends StatelessWidget {
  final String title;
  final String message;
  const NotifikasiBox({super.key, required this.title, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.lightColor,
                  )
                ),
                child: Image.asset(
                  Assets.notificationsFill,
                  color: AppColors.primaryColor,
                  width: 24,
                  height: 24,
                )
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.darkColor,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  SizedBox(
                    width: 250,
                    child: Text(
                      message,
                      maxLines: 2,
                      textAlign: TextAlign.start,
                      textWidthBasis: TextWidthBasis.parent,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.greyColor,
                      )
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(width: 16,),
          Icon(
            Icons.chevron_right_rounded,
            size: 24,
            color: AppColors.greyColor,
          )
        ],
      )
    );
  }
}
