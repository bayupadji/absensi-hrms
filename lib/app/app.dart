import 'package:absensi/app/features/home/controllers/home_controller.dart';
import 'package:absensi/app/features/employee/views/employee.dart';
import 'package:absensi/app/features/home/views/home_screen.dart';
import 'package:absensi/app/features/inbox/views/inbox.dart';
import 'package:absensi/app/features/profile/views/profil.dart';
import 'package:absensi/app/features/schedule/views/schedule.dart';
import 'package:absensi/app/utils/widgets/navigations/navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller =
      Get.find();

  HomeScreen({super.key});

  final List<Widget> pages = [
    HomeScreenContent(),
    ScheduleScreen(),
    EmployeeScreen(),
    InboxScreen(),
    ProfilScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: controller.pageController,
          physics: NeverScrollableScrollPhysics(),
          children: pages,
        ),
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        init: controller,
        builder: (controller) {
          return Navbar(
            selectedIndex: controller.selectIndex.value,
            onItemTapped: controller.onItemTap,
          );
        },
      ),
    );
  }
}
