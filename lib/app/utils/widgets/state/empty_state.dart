import 'package:absensi/app/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  const EmptyState(
      {super.key,
      required this.title,
      required this.height,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      width: width,
      height: height,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.cancel_outlined,
              size: 32,
              color: AppColors.greyColor,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
