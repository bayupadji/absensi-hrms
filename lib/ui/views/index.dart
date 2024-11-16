import 'package:absensi/domain/controllers/home/home_controller.dart';
import 'package:absensi/ui/views/employee/employee.dart';
import 'package:absensi/ui/views/home/home_screen.dart';
import 'package:absensi/ui/views/inbox/inbox.dart';
import 'package:absensi/ui/views/profile/profil.dart';
import 'package:absensi/ui/views/schedule/schedule.dart';
import 'package:absensi/ui/widgets/navigations/navbar.dart';
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
