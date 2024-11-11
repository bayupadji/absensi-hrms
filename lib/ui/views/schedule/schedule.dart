import 'package:absensi/domain/controllers/filters/date_picker_controller.dart';
import 'package:absensi/ui/widgets/box_card/schedule_box.dart';
import 'package:absensi/ui/widgets/modals/filterdate_modal.dart';
import 'package:absensi/utils/assets.dart';
import 'package:absensi/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.backgroundColor,
        toolbarHeight: 56,
        title: SizedBox(
          width: double.infinity,
          child: Text(
            'Schedule',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Column(
        children: [
          FilterDate(),
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      InfoAlert(),
                      SizedBox(
                        height: 24,
                      ),
                      ...List.generate(10, (index) {
                        return Column(
                          children: [
                            ScheduleBox(
                              onTapped: () {
                                Get.toNamed('/detailschedule');
                              },
                              subtitle:
                                  'Minggu ${index + 1} - Shift ${index % 2 == 0 ? 'Pagi' : 'Malam'}',
                              title:
                                  '0${index + 1} Nov 2023, ${index % 2 == 0 ? 'Monday' : 'Tuesday'}',
                              timeIn: index % 2 == 0 ? '07:30' : '16:30',
                              timeOut: index % 2 == 0 ? '16:30' : '01:30',
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FilterDate extends StatelessWidget {
  final DatePickerController pickerController = Get.find();

  FilterDate({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_null_comparison
    String formattedDate = pickerController.selectedDate.value != null
      ? DateFormat('dd MMMM yyyy').format(pickerController.selectedDate.value)
      : DateFormat('dd MMMM yyyy').format(DateTime.now()
    );

    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          backgroundColor: AppColors.backgroundColor,
          enableDrag: true,
          isDismissible: true,
          context: context,
          builder: (context) {
            return CustomModalDate();
          },
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration:
              BoxDecoration(color: AppColors.backgroundColor, boxShadow: [
            BoxShadow(
              color: Color(0x1418274B),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: -2,
            )
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                formattedDate,
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.darkColor),
              ),
              Image.asset(
                Assets.nCalendar,
                width: 24,
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoAlert extends StatelessWidget {
  const InfoAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0x26287DFC),
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
          width: double.infinity,
          child: Text.rich(
            TextSpan(children: [
              TextSpan(
                  text: 'Info: ',
                  style: TextStyle(fontWeight: FontWeight.w700)),
              TextSpan(
                  text:
                      'HRD memperbarui jadwal kerja Anda setiap Minggu. Perhatikan perubahan terbaru!!!',
                  style: TextStyle(fontWeight: FontWeight.w400))
            ]),
          )),
    );
  }
}
