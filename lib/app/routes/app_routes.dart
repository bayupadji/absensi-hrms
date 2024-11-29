import 'package:absensi/app/features/allhistory/bindings/history_binding.dart';
import 'package:absensi/app/features/auth/bindings/auth_bindings.dart';
import 'package:absensi/app/features/auth/views/login.dart';
import 'package:absensi/app/features/employee/views/employee.dart';
import 'package:absensi/app/features/home/bindings/home_bindings.dart';
import 'package:absensi/app/features/allhistory/views/all_activities.dart';
import 'package:absensi/app/features/home/views/home_screen.dart';
import 'package:absensi/app/features/inbox/views/inbox.dart';
import 'package:absensi/app/features/onboarding/bindings/onboard_bindings.dart';
import 'package:absensi/app/features/onboarding/views/onboarding.dart';
import 'package:absensi/app/features/profile/views/profil.dart';
import 'package:absensi/app/features/schedule/views/schedule.dart';
import 'package:absensi/app/features/splashscreen/bindings/splash_binding.dart';
import 'package:absensi/app/features/splashscreen/views/splashscreen.dart';
import 'package:absensi/app/routes/routes_name.dart';
import 'package:get/get.dart';

class Routes {
  static final pages = [
    GetPage(
      name: RoutesName.splashscreens,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: RoutesName.onboarding,
      page: () => OnboardingPage(),
      binding: OnboardBindings()
    ),
    GetPage(
      name: RoutesName.login,
      page: () => LoginScreen(),
      binding: AuthBindings()
    ),
    GetPage(
      name: RoutesName.home,
      page: () => HomeScreen(),
      binding: HomeBindings()
    ),
    GetPage(
      name: RoutesName.allActivity,
      page: () => AllActivities(),
      binding: HistoryBinding()
    ),
    GetPage(
      name: RoutesName.employee,
      page: () => EmployeeScreen(),
    ),
    GetPage(
      name: RoutesName.inbox,
      page: () => InboxScreen(),
    ),
    GetPage(
      name: RoutesName.profile,
      page: () => ProfilScreen(),
    ),
    GetPage(
      name: RoutesName.schedule,
      page: () => ScheduleScreen(),
    ),
  ];
}
