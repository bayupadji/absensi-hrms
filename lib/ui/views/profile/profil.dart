import 'package:absensi/ui/widgets/box_card/menu_card.dart';
import 'package:absensi/utils/assets.dart';
import 'package:absensi/utils/colors.dart';
import 'package:flutter/material.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.greyColor,
                ),
              ),
              SizedBox(height: 4),
              MenuCard(
                icon: Assets.nUsergroup,
                title: 'Data Keluarga',
                onTap: (){},
              ),
              SizedBox(height: 16,),
              MenuCard(
                icon: Assets.nUsergroup,
                title: 'Data Penggajian',
                onTap: (){},
              ),
              SizedBox(height: 8,),
              MenuCard(
                icon: Assets.nUsergroup,
                title: 'Berkas',
                onTap: (){},
              ),
              SizedBox(height: 8,),
              MenuCard(
                icon: Assets.nUsergroup,
                title: 'Riwayat Perubahan Data',
                onTap: (){},
              ),
              SizedBox(height: 8,),
              MenuCard(
                icon: Assets.nUsergroup,
                title: 'Penghargaan',
                onTap: (){},
              ),
            ],
          ),
        ]
      ),
    );
  }
}