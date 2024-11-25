import 'package:absensi/app/app.dart';
import 'package:absensi/app/features/auth/bindings/auth_bindings.dart';
import 'package:absensi/app/features/auth/views/login.dart';
import 'package:absensi/app/features/home/bindings/home_bindings.dart';
import 'package:absensi/app/features/home/views/all_activities.dart';
import 'package:absensi/app/features/onboarding/bindings/onboard_bindings.dart';
import 'package:absensi/app/features/onboarding/views/onboarding.dart';
import 'package:absensi/app/features/onboarding/views/splashscreen.dart';
import 'package:get/get.dart';

class AppRoutes {
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
      binding: OnboardBindings(),
    ),
    GetPage(
      name: onboarding,
      page: () => OnboardingPage(),
      binding: OnboardBindings()
    ),
    GetPage(
      name: login,
      page: () => LoginScreen(),
      binding: AuthBindings()
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
      binding: HomeBindings()
    ),
    GetPage(
      name: allActivity,
      page: () => AllActivities(),
      binding: HomeBindings()
    ),
  ];
}
