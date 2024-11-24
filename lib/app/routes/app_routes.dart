import 'package:absensi/app/app.dart';
import 'package:absensi/app/features/auth/views/login.dart';
import 'package:absensi/app/features/home/views/all_activities.dart';
import 'package:absensi/app/features/onboarding/views/onboarding.dart';
import 'package:absensi/app/features/onboarding/views/splashscreen.dart';
import 'package:absensi/app/features/schedule/views/detail_schedule.dart';
import 'package:absensi/app/routes/bindings/initialbindings.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final binding = Initialbindings();
  static const splashscreens = '/splashscreen';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const home = '/home';
  static const detailSchedule = '/detailschedule';
  static const allActivity = '/allactivities';

  static List<GetPage> routes = [
    GetPage(
      name: splashscreens,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: onboarding,
      page: () => OnboardingPage(),
      binding: binding
    ),
    GetPage(
      name: login,
      page: () => LoginScreen(),
      binding: binding
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
      binding: binding
    ),
    GetPage(
      name: detailSchedule,
      page: () => DetailSchedule(),
      binding: binding
    ),
    GetPage(
      name: allActivity,
      page: () => AllActivities(),
      binding: binding
    ),
  ];
}
