import 'package:absensi/app/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class ActivityBox extends StatelessWidget {
  final String title;
  final String date;
  final String time;

  const ActivityBox(
      {super.key, required this.title, required this.date, required this.time});

  // Method untuk menentukan ikon berdasarkan title
  IconData _getIconByTitle() {
    switch (title.toLowerCase()) {
      case 'masuk':
        return Icons.login_rounded;
      case 'keluar':
        return Icons.logout_rounded;
      default:
        return Icons.work_outline;
    }
  }

  // Method untuk menentukan warna ikon dan background
  Color _getIconColor() {
    switch (title.toLowerCase()) {
      case 'masuk':
        return AppColors.primarySwatch.shade500;
      case 'keluar':
        return Colors.red.shade500;
      default:
        return AppColors.primarySwatch.shade500;
    }
  }

  // Method untuk menentukan background ikon
  Color _getIconBackgroundColor() {
    switch (title.toLowerCase()) {
      case 'masuk':
        return AppColors.primarySwatch.shade50;
      case 'keluar':
        return Colors.red.shade50;
      default:
        return AppColors.primarySwatch.shade50;
    }
  }

  // Method untuk menentukan warna teks title
  Color _getTitleColor() {
    switch (title.toLowerCase()) {
      case 'keluar':
        return Colors.red.shade700;
      default:
        return AppColors.darkColor;
    }
  }

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
                  color: _getIconBackgroundColor(),
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Icon(
                  _getIconByTitle(),
                  size: 16,
                  color: _getIconColor(),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: _getTitleColor(),
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
          Text(time,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: title.toLowerCase() == 'keluar'
                      ? Colors.red.shade700
                      : AppColors.darkColor)),
        ],
      ),
    );
  }
}
