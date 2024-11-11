import 'package:absensi/ui/widgets/box_card/detail_schedule_box.dart';
import 'package:absensi/ui/widgets/box_card/employee_box.dart';
import 'package:absensi/utils/assets.dart';
import 'package:absensi/utils/colors.dart';
import 'package:flutter/material.dart';

class DetailSchedule extends StatelessWidget {
  const DetailSchedule({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Color(0x1418274B),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: -2,
              )
            ]),
            child: AppBar(
              toolbarHeight: 56,
              centerTitle: true,
              backgroundColor: AppColors.backgroundColor,
              title: Text(
                'Detail Jadwal',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkColor,
                ),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios,
                    color: AppColors.darkColor, size: 20),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      Assets.notifications,
                      width: 24,
                      height: 24,
                    ))
              ],
            ),
          ),
        ),
        body: Column(children: [
          ListJadwal(),
          SizedBox(height: 8,),
          ListKaryawan(),
        ]));
  }
}

class ListJadwal extends StatelessWidget {
  const ListJadwal({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> contentList = [
      DetailScheduleBox(
        title: '01 Nov 2023, Monday',
        subtitle: 'Minggu 2 - Shift Pagi',
        timeIn: '07:30',
        timeOut: '16:30',
        onTapped: () {},
      ),
      DetailScheduleBox(
        title: '01 Nov 2023, Monday',
        subtitle: 'Minggu 2 - Shift Pagi',
        timeIn: '07:30',
        timeOut: '16:30',
        onTapped: () {},
      )
    ];
    return Container(
      height: 170,
      padding: EdgeInsets.symmetric(vertical: 24),
      child: PageView.builder(
        itemCount: contentList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(width: 243, child: contentList[index]),
          );
        },
      ),
    );
  }
}

class ListKaryawan extends StatelessWidget {
  const ListKaryawan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Karyawan',
            style: TextStyle(
              fontWeight: FontWeight.w700
            ),
          ),
          SizedBox(height: 16,),
          SizedBox(
            width: double.infinity,
            child: EmployeeBox(
              title: 'George Lee',
              jobtitle: 'Product Designer',
              status: 'Tetap',
            ),
          )
        ],
      )
    );
  }
}