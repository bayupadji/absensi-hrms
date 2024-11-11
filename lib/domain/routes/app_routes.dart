import 'package:absensi/domain/bindings/app_binding.dart';
import 'package:absensi/ui/views/index.dart';
import 'package:absensi/ui/views/auth/login.dart';
import 'package:absensi/ui/views/onboarding/onboarding.dart';
import 'package:absensi/ui/views/onboarding/splashscreen.dart';
import 'package:absensi/ui/views/schedule/detail_schedule.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final binding = AppBinding();
  static const splashscreens = '/splashscreen';
  static const onboarding = '/onboarding';
  static const login = '/login';
  static const home = '/home';
  static const detailSchedule = '/detailschedule';

  static List<GetPage> routes = [
    GetPage(
      name: splashscreens,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: onboarding,
      page: () => OnboardingPage(),
      binding:  binding
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
  ];
}
