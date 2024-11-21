import 'package:absensi/app/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class AttendButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon; // Ikon dinamis
  final String label; // Label dinamis
  final Color iconColor; // Warna dinamis

  const AttendButton({
    super.key,
    required this.icon,
    required this.label,
    required this.iconColor,
    this.onPressed,
  });

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
              icon, // Ikon dinamis
              size: 56,
              color: iconColor, // Warna dinamis
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.darkColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
