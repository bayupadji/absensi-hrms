import 'package:absensi/ui/widgets/box_card/menu_card.dart';
import 'package:absensi/utils/assets.dart';
import 'package:absensi/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        centerTitle: true,
        toolbarHeight: 56,
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Profil',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700
          ),
        ),
        elevation: 4.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Column(
              children: [
                AkunList(),
                LainyaList(),
              ],
            ),
          ]
        ),
      ),
    );
  }
}

class AkunList extends StatelessWidget {
  const AkunList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Akun',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.greyColor,
          ),
        ),
        SizedBox(height: 4),
        MenuCard(
          icon: Assets.nUsergroup,
          title: 'Detail Data Karyawan',
          onTap: (){},
        ),
        SizedBox(height: 8,),
        MenuCard(
          icon: Assets.nUsergroup,
          title: 'Data Personal & Keluarga',
          onTap: (){},
        ),
        SizedBox(height: 8,),
        MenuCard(
          icon: Assets.nUsergroup,
          title: 'Ubah Kata Sandi',
          onTap: (){},
        ),
        SizedBox(height: 8,),
      ],
    );
  }
}

class LainyaList extends StatelessWidget {
  const LainyaList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Lainya',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.greyColor,
          ),
        ),
        SizedBox(height: 4),
        MenuCard(
          icon: Assets.nUsergroup,
          title: 'Syarat dan Ketentuan',
          onTap: () {},
        ),
      ],
    );
  }
}