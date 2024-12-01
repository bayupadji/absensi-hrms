import 'package:absensi/app/utils/constants/assets.dart';
import 'package:absensi/app/utils/theme/colors.dart';
import 'package:absensi/app/utils/widgets/box_card/diklat_period_box.dart';
import 'package:absensi/app/utils/widgets/box_card/menu_card.dart';
import 'package:absensi/app/utils/widgets/box_card/profile_box.dart';
import 'package:absensi/app/utils/widgets/box_card/reward_box.dart';
import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: AppColors.backgroundColor,
        scrolledUnderElevation: 0,
        centerTitle: true,
        toolbarHeight: 56,
        backgroundColor: AppColors.backgroundColor,
        title: const Text(
          'Profil',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 4.0,
        shadowColor: Color(0x1418274B),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ProfileBox(
                  title: 'Bayu Prasetya Adji S',
                  jobtitle: 'UIUX Designer', 
                  category: 'non-shift',
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    RewardBox(
                      title: 'Reward Presensi',
                      bonus: 'Rp300.000',
                    ),
                    const SizedBox(width: 16),
                    DiklatPeriodBox(
                      title: 'Masa Diklat',
                      time: '02h 00m',
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                AkunList(),
                const SizedBox(height: 16),
                LainyaList(),
              ],
            ),
          ),
        ]
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
          icon: Assets.briefcase,
          title: 'Detail Data Karyawan',
          onTap: (){},
        ),
        SizedBox(height: 8,),
        MenuCard(
          icon: Assets.nProfil,
          title: 'Data Personal & Keluarga',
          onTap: (){},
        ),
        SizedBox(height: 8,),
        MenuCard(
          icon: Assets.lock,
          title: 'Ubah Kata Sandi',
          onTap: (){},
        ),
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
          icon: Assets.shield,
          title: 'Syarat dan Ketentuan',
          onTap: () {},
        ),
      ],
    );
  }
}