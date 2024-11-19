import 'package:absensi/app/features/schedule/controllers/date_picker_controller.dart';
import 'package:absensi/app/utils/theme/colors.dart';
import 'package:absensi/app/utils/widgets/button/default_btn.dart';
import 'package:absensi/app/utils/widgets/pickers/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomModalDate extends StatelessWidget {
  const CustomModalDate({super.key});

  @override
  Widget build(BuildContext context) {
    final DatePickerController pickerController = Get.find();

    pickerController.setDates(
      DateTime.now(), // Initial date
      DateTime(1900), // Minimum date
      5, // Maximum date
    );

    return SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pilih Rentang Tanggal',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Icon(
                      Icons.close_rounded,
                      color: AppColors.darkColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Color(0xFFFFF8E0),
                    borderRadius: BorderRadius.circular(12)),
                child: SizedBox(
                    width: double.infinity,
                    child: Text(
                      'Maksimal rentang tanggal 7 hari',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFB7921A)),
                    )),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Expanded(
              child: CustomDatePicker(
                onDateSelected: (DateTimeRange range) {
                  pickerController.updateSelectedDate(range.start);
                },
                initialDate: pickerController.initialDate!,
                minDate: pickerController.dateMin!,
                maxDate: pickerController.dateMax!,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(children: [
                DefaultButton(
                  label: 'Reset',
                  onPressed: () {
                    pickerController.resetSelectedDate();
                  },
                  bgColor: AppColors.backgroundColor,
                  fgColor: AppColors.primaryColor,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: DefaultButton(
                    label: 'Konfirmasi',
                    onPressed: () {},
                    bgColor: AppColors.primaryColor,
                    fgColor: AppColors.backgroundColor,
                  ),
                ),
              ]),
            )
          ],
        ));
  }
}
