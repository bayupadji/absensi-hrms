import 'package:absensi/app/data/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectIndex = 0.obs;
  final AuthRepository authRepo = AuthRepository();
  RxBool isAuthenticated = false.obs;
  RxMap<String, dynamic> userData = <String, dynamic>{}.obs;
  PageController pageController = PageController();

  // navbar logic
  void onItemTap(int index) {
    selectIndex.value = index;
    pageController.jumpToPage(index);
    update();
  }

  // load token logic
  Future<void> loadToken() async {
    try {
      final tokenData = await authRepo.getToken();

      // Untuk cek log
      print('tokenData: $tokenData');

      if (tokenData != null && tokenData.isNotEmpty) {
        isAuthenticated.value = true;
        userData.value = tokenData;
      } else {
        isAuthenticated.value = false;
        userData.value = {};
        print('No token found, setting isAuthenticated to false.');

        Get.offAllNamed('/login');
      }
    } catch (e) {
      print('Error loading token: $e');
      isAuthenticated.value = false;
      userData.value = {};
    }

    print('isAuthenticated: ${isAuthenticated.value}');
  }

  // log out logic
  Future<void> logout() async {
    try {
      await authRepo.clearTokens();
      isAuthenticated.value = false;
      userData.value = {};
    } catch (e) {
      print('Error during logout: $e');
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadToken(); // Memanggil loadToken saat controller diinisialisasi
  }
}
