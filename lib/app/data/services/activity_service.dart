import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:absensi/app/data/models/activity_attend_model.dart';
import 'package:absensi/app/data/repositories/auth_repository.dart';
import 'package:absensi/app/utils/constants/api_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ActivityService {
  final AuthRepository authRepository = AuthRepository();

  Future<ActivityAttendModel?> getActivity() async {
    try {
      // Ambil token dari database
      final tokenData = await authRepository.getToken();
      final token = tokenData?['arrToken'];
      if (token == null || token.isEmpty) {
        throw Exception("No token found, please log in again.");
      }

      // Endpoint untuk data activity
      final url = Uri.parse(baseURL + getAttendActivity);
      final response = await http.post(
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

      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Activity Data: ${responseData['ActivityData']}');
        }
        return ActivityAttendModel.fromJson(responseData);
      } else {
        throw Exception(
          'Failed to load activity attend: ${response.statusCode}'
        );
      }
    } on SocketException {
      // Tangani masalah koneksi internet
      Get.snackbar(
        'Network Error',
        'No internet connection. Please check your network settings.',
      );
      throw Exception('No internet connection');
    } on TimeoutException {
      // Tangani timeout
      Get.snackbar(
        'Timeout Error',
        'The request took too long. Please try again.',
      );
      throw Exception('Request timeout');
    } on HttpException {
      // Tangani error HTTP umum
      Get.snackbar(
        'HTTP Error',
        'An error occurred while communicating with the server.',
      );
      throw Exception('HTTP request failed');
    } on FormatException {
      // Tangani error parsing JSON
      Get.snackbar(
        'Data Error',
        'Unable to parse server response.',
      );
      throw Exception('Invalid data format');
    } catch (e) {
      // Tangani error yang tidak terduga
      throw Exception('An unexpected error occurred: $e');
    }
  }
}
