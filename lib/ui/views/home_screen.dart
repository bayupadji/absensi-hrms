import 'package:absensi/domain/controllers/home/datetime_controller.dart';
import 'package:absensi/domain/controllers/home/geolocator_controller.dart';
import 'package:absensi/ui/widgets/box_card/activity_box.dart';
import 'package:absensi/ui/widgets/box_card/info_box.dart';
import 'package:absensi/ui/widgets/box_card/menu_box.dart';
import 'package:absensi/ui/widgets/button/attend_btn.dart';
import 'package:absensi/utils/assets.dart';
import 'package:absensi/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primarySwatch.shade500,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 80,
        title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: AssetImage(Assets.avatar),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bayu Prasetya Adji S',
                style: TextStyle(
                    fontSize: 16,
                    color: AppColors.backgroundColor,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Product Designer',
                style: TextStyle(
                    fontSize: 14,
                    color: AppColors.backgroundColor,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
        ]),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Icon(
              Icons.info_outline_rounded,
              color: AppColors.backgroundColor,
              size: 24,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Attend(),
                ],
              ),
            ),
            // Expanded(child: Menus()),
            Menus(),
          ],
        ),
      ),
    );
  }
}

class Attend extends StatelessWidget {
  const Attend({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          GetBuilder<DatetimeController>(builder: (controller) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  controller.currentTime,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: AppColors.backgroundColor,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  controller.currentDate,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: AppColors.backgroundColor,
                  ),
                ),
              ],
            );
          }),
          SizedBox(
            height: 24,
          ),
          AttendButton(onPressed: () {
            // actions
          }),
          SizedBox(
            height: 24,
          ),
          GetBuilder<LocationController>(builder: (controller) {
            return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.location_pin,
                color: AppColors.backgroundColor,
                size: 16,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                controller.currentLocation,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.backgroundColor,
                ),
              ),
            ]);
          }),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.clockIn,
                    width: 32,
                    height: 32,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '20:00',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text('Masuk',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.backgroundColor,
                      )),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.clockOut,
                    width: 32,
                    height: 32,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '20:00',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text('Keluar',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.backgroundColor,
                      )),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.clockTime,
                    width: 32,
                    height: 32,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    '20:00',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text('Jam Kerja',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.backgroundColor,
                      )
                    ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class Menus extends StatelessWidget {
  const Menus({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.38,
      minChildSize: 0.38,
      maxChildSize: 1.0,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                MenuGrid(),
                Informations(),
                SizedBox(height: 24),
                Activity(),
                SizedBox(height: 24),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MenuGrid extends StatelessWidget {
  const MenuGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> menuItems = [
      {'label': 'Cuti', 'image': 'assets/icons/menus/Holiday.png'},
      {'label': 'Tukar Jadwal', 'image': 'assets/icons/menus/Calendar.png'},
      {'label': 'Lembur', 'image': 'assets/icons/menus/Timer.png'},
      {'label': 'Event & Diklat', 'image': 'assets/icons/menus/Training.png'},
      {'label': 'Slip Gaji', 'image': 'assets/icons/menus/PurchaseOrder.png'},
      {'label': 'Dokumen', 'image': 'assets/icons/menus/Documents.png'},
      {'label': 'Feedback', 'image': 'assets/icons/menus/Form.png'},
      {'label': 'Laporan', 'image': 'assets/icons/menus/SystemReport.png'},
    ];
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1,
          mainAxisExtent: 108
        ),
        itemCount: menuItems.length,
        padding: EdgeInsets.all(16),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return MenuBox(
            label: menuItems[index]['label']!,
            image: menuItems[index]['image']!,
          );
        },

    );
  }
}

class Informations extends StatelessWidget {
  const Informations({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Pengumuman',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Semua pengumuman',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: AppColors.primaryColor,
              ),
            ),
          )
        ]),
        SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: InfoBox(
              label: 'Penggajian Okt 2024',
              desc: 'Penggajian akan diterima pada tanggal 25 Okt',
              time: '6 hari lalu',
              expiry: 'berakhir 23-10-2024'),
        )
      ]),
    );
  }
}

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              'Aktivitas Anda',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: AppColors.darkColor,
              ),
            ),
            Text(
              'Semua aktivitas',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: AppColors.primaryColor,
              ),
            ),
          ]),
          SizedBox(
            height: 16,
          ),
          ActivityBox(
            title: 'Masuk',
            date: '20 November 2024',
            time: '10:00',
          ),
        ],
      ),
    );
  }
}
