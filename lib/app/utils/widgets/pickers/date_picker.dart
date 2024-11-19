
import 'package:absensi/app/utils/theme/colors.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';

class CustomDatePicker extends StatelessWidget {
  final Function(DateTimeRange) onDateSelected;
  final DateTime initialDate;
  final DateTime minDate;
  final DateTime maxDate;

  const CustomDatePicker({
    super.key,
    required this.onDateSelected,
    required this.initialDate,
    required this.minDate,
    required this.maxDate,
  });

  @override
  Widget build(BuildContext context) {
    return RangeDatePicker(
      onRangeSelected: onDateSelected,
      centerLeadingDate: true,
      minDate: minDate,
      maxDate: maxDate,
      initialDate: initialDate,
      padding: EdgeInsets.symmetric(horizontal: 24),
      leadingDateTextStyle: TextStyle(
        fontSize: 16,
        color: AppColors.darkColor,
        fontWeight: FontWeight.w700,
      ),
      selectedCellsTextStyle: TextStyle(
        fontSize: 16,
        color: AppColors.primaryColor,
        fontWeight: FontWeight.w700,
      ),
      enabledCellsTextStyle: TextStyle(
        fontSize: 16,
        color: AppColors.darkColor,
      ),
      currentDateTextStyle: TextStyle(
        fontSize: 16,
        color: AppColors.primaryColor,
      ),
      disabledCellsTextStyle: TextStyle(
        fontSize: 16,
        color: AppColors.greyColor,
      ),
      singleSelectedCellTextStyle: TextStyle(
        fontSize: 16,
        color: AppColors.backgroundColor,
        fontWeight: FontWeight.w700,
      ),
      currentDateDecoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.primaryColor,
          )),
      selectedCellsDecoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: AppColors.primarySwatch.shade50,
      ),
      disabledCellsDecoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.lightColor,
      ),
      enabledCellsDecoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.backgroundColor,
      ),
      singleSelectedCellDecoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.primaryColor,
      ),
    );
  }
}