import 'package:absensi/app/data/models/today_schedule_model.dart';
import 'package:absensi/app/data/repositories/auth_repository.dart';
import 'package:absensi/app/utils/constants/api_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AttendService {
  final AuthRepository authRepository = AuthRepository();

  Future<TodayScheduleParameter?> getAllAttendData() async {
    try {
      // Ambil token dari database
      final tokenData = await authRepository.getToken();
      final token = tokenData?['arrToken'];
      if (token == null || token.isEmpty) {
        throw Exception("No token found, please log in again.");
      }

      // Endpoint untuk data kehadiran
      final url = Uri.parse(baseURL + todaySchedule);
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      if (kDebugMode) {
        print('Response headers: ${response.headers}');
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');
      }

      // Check if response body is not empty
      if (response.body.isEmpty) {
        throw Exception('Empty response received');
      }

      final Map<String, dynamic> responseData = jsonDecode(response.body);

      // Tangani status 404 dengan data valid
      if (response.statusCode == 404 && responseData['data'] != null) {
        if (kDebugMode) {
          print('Attendance Data (404 with valid data): ${responseData['data']}');
        }
        return TodayScheduleParameter.fromJson(responseData);
      }

      // Tangani status 200
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Attendance Data: ${responseData['data']}');
        }
        return TodayScheduleParameter.fromJson(responseData);
      }

      // Jika bukan 200 atau 404 dengan data valid, tangani sebagai error
      final errorMessage = responseData['message'] ?? 'Failed to fetch attendance data with status code: ${response.statusCode}';
      throw Exception(errorMessage);
    } catch (e) {
      Get.snackbar(
        'Error: ', // Judul SnackBar
        e.toString(),
      );
      if (kDebugMode) {
        print('Detailed error: $e');
      }
      rethrow; // Re-throw to allow caller to handle
    }
  }
}
