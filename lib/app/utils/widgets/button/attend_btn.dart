import 'package:absensi/app/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class AttendButton extends StatelessWidget {
  final VoidCallback?  onPressed;
  const AttendButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 125,
        width: 125,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.login_rounded,
              size: 56,
              color: AppColors.primaryColor,
            ),
            SizedBox(height: 8,),
            Text(
              'Masuk',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.darkColor,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
    );
  }
}