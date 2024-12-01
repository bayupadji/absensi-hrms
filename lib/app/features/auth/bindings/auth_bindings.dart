import 'package:absensi/app/data/repositories/auth_repository.dart';
import 'package:absensi/app/data/services/auth_service.dart';
import 'package:absensi/app/features/auth/controllers/app_controller.dart';
import 'package:absensi/app/features/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    // Data Layer
    Get.lazyPut<AuthRepository>(() => AuthRepository());

    // Service Layer
    Get.lazyPut<AuthService>(() => AuthService());

    // Controllers
    Get.lazyPut<AuthController>(() => AuthController());
    Get.lazyPut<AppController>(() => AppController());
  }
}
