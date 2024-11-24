import 'package:absensi/app/data/repositories/auth_repository.dart';
import 'package:absensi/app/data/services/attend_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var selectIndex = 0.obs;
  var jamFrom = ''.obs;
  var jamTo = ''.obs;
  var errorMessage = ''.obs;
  final AuthRepository authRepo = AuthRepository();
  RxBool isAuthenticated = false.obs;
  RxMap<String, dynamic> userData = <String, dynamic>{}.obs;
  RxMap<String, dynamic> unitKerja = <String, dynamic>{}.obs;
  PageController pageController = PageController();
  var isClicked = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadToken(); // Memanggil loadToken saat controller diinisialisasi
    fetchUnitKerja();
    fetchAttendanceData();
  }

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
      if (kDebugMode) {
        print('tokenData: $tokenData');
      }

      if (tokenData != null && tokenData.isNotEmpty) {
        isAuthenticated.value = true;
        userData.value = tokenData;
      } else {
        isAuthenticated.value = false;
        userData.value = {};
        // debug only
        if (kDebugMode) {
          print('No token found, setting isAuthenticated to false.');
        }

        Get.offAllNamed('/login');
      }
    } catch (e) {
      // debug only
      if (kDebugMode) {
        print('Error loading token: $e');
      }
      isAuthenticated.value = false;
      userData.value = {};
    }

    if (kDebugMode) {
      print('isAuthenticated: ${isAuthenticated.value}');
    }
  }

  Future<void> fetchUnitKerja() async {
    try {
      final unitKerjaData = await authRepo.getUnitKerja();
      if (unitKerjaData != null) {
        unitKerja.assignAll(unitKerjaData); // Mengisi data ke RxMap
        // debug only
        if (kDebugMode) {
          print('Unit Kerja Fetched: $unitKerja');
        }
      } else {
        unitKerja.clear(); // Bersihkan jika data tidak ada
      }
    } catch (e) {
      // debug only
      if (kDebugMode) {
        print('Error fetching unit kerja: $e');
      }
      unitKerja.clear();
    }
  }

  Future<void> fetchAttendanceData() async {
    try {
      final attendService = AttendService();
      final attendanceData = await attendService.getAllAttendData();

      if (attendanceData?.data?.shift != null) {
        // Data valid meskipun status 404
        jamFrom.value = attendanceData!.data!.shift!.jamFrom?.substring(0, 5) ?? 'No Data';
        jamTo.value = attendanceData.data!.shift!.jamTo?.substring(0, 5) ?? 'No Data';

        errorMessage.value = ''; // Kosongkan error jika data ada
      } else {
        // Tangani jika tidak ada data
        errorMessage.value = attendanceData?.message ?? 'Unknown error';
      }
    } catch (e) {
      // Tangani error jika exception
      errorMessage.value = e.toString();
    }
  }

  // log out logic
  Future<void> logout() async {
    try {
      await authRepo.clearDb();
      isAuthenticated.value = false;
      userData.value = {};
    } catch (e) {
      Get.snackbar(
        'Error: ', // Judul SnackBar
        e.toString(),
      );

      if (kDebugMode) {
        print('Error during logout: $e');
      }
    }
  }

  void toggleIcon() {
    isClicked.value = !isClicked.value;
  }

}
