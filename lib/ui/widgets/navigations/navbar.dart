import 'package:absensi/utils/assets.dart';
import 'package:absensi/utils/colors.dart';
import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const Navbar({super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      child: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              selectedIndex == 0 ? Assets.nHomeFill :  Assets.nHome,
              width: 24, height: 24
            ),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              selectedIndex == 1 ? Assets.nCalendarFill :  Assets.nCalendar,
              width: 24, height: 24
            ),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              selectedIndex == 2 ? Assets.nUsergroupFill :  Assets.nUsergroup,
              width: 24, height: 24
            ),
            label: 'Karyawan',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              selectedIndex == 3 ? Assets.nInboxFill : Assets.nInbox,
              width: 24,
              height: 24
            ),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              selectedIndex == 4 ? Assets.nProfilFill : Assets.nProfil,
              width: 24,
              height: 24
            ),
            label: 'Profil',
          ),
        ],
        currentIndex: selectedIndex,
        onTap: onItemTapped,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.greyColor,
        selectedFontSize: 12,
        unselectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.backgroundColor,
        elevation: 8,
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          color: AppColors.primaryColor,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 12,
          color: AppColors.darkColor,
          fontWeight: FontWeight.w600,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppColors.greyColor
        ),
      ),
    );
  }
}
