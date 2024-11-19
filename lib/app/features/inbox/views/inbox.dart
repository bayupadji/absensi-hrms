import 'package:absensi/app/utils/constants/assets.dart';
import 'package:absensi/app/utils/theme/colors.dart';
import 'package:absensi/app/utils/widgets/box_card/menu_card.dart';
import 'package:absensi/app/utils/widgets/box_card/notifikasi_box.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  final List<String> tabs = [
    'Notifikasi',
    'Butuh Approval',
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: AppColors.backgroundColor,
          scrolledUnderElevation: 0,
          centerTitle: true,
          toolbarHeight: 56,
          backgroundColor: AppColors.backgroundColor,
          title: const Text(
            'Inbox',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          elevation: 4.0,
          shadowColor: Color(0x1418274B),
          // TabBar
          bottom: TabBar(
            labelColor: AppColors.primaryColor,
            unselectedLabelColor: AppColors.greyColor,
            labelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
            unselectedLabelStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: AppColors.primaryColor,
            indicatorWeight: 4,
            isScrollable: false,
            tabs: tabs.map(
              (tab) => Tab(
                text: tab
              )
            ).toList(),
          ),
        ),
        body: TabBarView(
          children:[
            // Notifikasi
            NotifikasiTab(),
            // Butuh Approval
            ButuhApprovalTab(),
          ]
        ),
      ),
    );
  }
}

class NotifikasiTab extends StatelessWidget {
  const NotifikasiTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: NotifikasiBox(
            title: 'Test',
            message: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
          )
        ),
      ],
    );
  }
}

class ButuhApprovalTab extends StatelessWidget {
  const ButuhApprovalTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              MenuCard(
                icon: Assets.list,
                title: 'Reimbursement',
                onTap: () {},
              ),
              SizedBox(height: 8,),
              MenuCard(
                icon: Assets.nProfil,
                title: 'Perubahan Data',
                onTap: () {},
              ),
              SizedBox(height: 8,),
              MenuCard(
                icon: Assets.calendarLine,
                title: 'Perubahan Jadwal',
                onTap: () {},
              ),
              SizedBox(
                height: 8,
              ),
              MenuCard(
                icon: Assets.clockIn,
                title: 'Cuti',
                onTap: () {},
              ),
              SizedBox(
                height: 8,
              ),
              MenuCard(
                icon: Assets.briefcase,
                title: 'Perizinan',
                onTap: () {},
              ),
              SizedBox(
                height: 8,
              ),
              MenuCard(
                icon: Assets.folder,
                title: 'Diklat',
                onTap: () {},
              ),
            ],
          ),
        )
      ],
    );
  }
}
