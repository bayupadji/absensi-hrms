import 'package:absensi/ui/widgets/box_card/employee_box.dart';
import 'package:absensi/utils/colors.dart';
import 'package:flutter/material.dart';

class EmployeeScreen extends StatelessWidget {
  const EmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: AppColors.backgroundColor,
          toolbarHeight: 56,
          centerTitle: true,
          leading: SizedBox(
            width: 16,
          ),
          leadingWidth: 16,
          title: SizedBox(
            width: double.infinity,
            child: Text(
              'Karyawan',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: AppColors.darkColor),
            )
          ]
        ),
        body: Column(
          children: [
            FilterStatus(),
            Listkaryawan()
          ],
        )
      );
  }
}

class FilterStatus extends StatelessWidget {
  const FilterStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Container(
          decoration:
              BoxDecoration(color: AppColors.backgroundColor, boxShadow: [
            BoxShadow(
              color: Color(0x1418274B),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: -2,
            )]
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Status Karyawan',
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColors.darkColor,
                      fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.filter_alt_outlined,
                  size: 24,
                  color: AppColors.darkColor,
                )
              ],
            ),
          ),
        ));
  }
}

class Listkaryawan extends StatelessWidget {
  const Listkaryawan({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> employees = [
      {
        'name': 'Albert Flores',
        'jobtitle': 'Software Engineer',
        'status': 'Active'
      },
      {
        'name': 'Maria Garcia',
        'jobtitle': 'Project Manager',
        'status': 'Inactive'
      },
      {'name': 'John Doe', 'jobtitle': 'Designer', 'status': 'Active'},
    ];

    return Expanded(
      child: Padding(
          padding: EdgeInsets.all(16),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              final employe = employees[index];
              return EmployeeBox(
                title: employe['name']!,
                jobtitle: employe['jobtitle']!,
                status: employe['status']!
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 16,
              );
            },
            itemCount: employees.length
          )
      ),
    );
  }
}
