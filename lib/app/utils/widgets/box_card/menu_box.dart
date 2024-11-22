
import 'package:absensi/app/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class MenuBox extends StatelessWidget {
  final String label;
  final String image;
  
  const MenuBox({
    super.key,
    required this.label,
    required this.image}
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.lightColor,
          width: 1,
        ),
      ),
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: 40,
            height: 40,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            label,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.darkColor,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}
