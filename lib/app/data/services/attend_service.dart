import 'dart:async';
import 'dart:convert';
import 'package:absensi/app/data/models/today_schedule_model.dart';
import 'package:absensi/app/data/repositories/auth_repository.dart';
import 'package:absensi/app/utils/constants/api_repository.dart';
import 'package:absensi/app/utils/exceptions/global_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AttendService {
  final AuthRepository authRepository = AuthRepository();

  Future<TodayScheduleParameter?> getAllAttendData() async {
    try {
      final token = await _getToken();
      final response = await _fetchAttendanceData(token);
      return _processResponse(response);
    } catch (e) {
      GlobalExceptionHandler.handleError(e);
      rethrow;
    }
  }

  Future<String> _getToken() async {
    final tokenData = await authRepository.getToken();
    final token = tokenData?['arrToken'];
    if (token == null || token.isEmpty) {
      throw Exception("No token found, please log in again.");
    }
    return token;
  }

  Future<http.Response> _fetchAttendanceData(String token) async {
    final url = Uri.parse(baseURL + getTodaySchedule);
    final response = await http
        .get(
          url,
          headers: _buildHeaders(token),
        )
        .timeout(
          const Duration(seconds: 30),
          onTimeout: () => throw TimeoutException(
              'The connection has timed out, please try again.'),
        );

    _logResponse(response);
    return response;
  }

  Map<String, String> _buildHeaders(String token) {
    return {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  void _logResponse(http.Response response) {
    if (kDebugMode) {
      print('Response headers: ${response.headers}');
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  TodayScheduleParameter? _processResponse(http.Response response) {
    if (response.body.isEmpty) {
      throw Exception('Empty response received');
    }

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    return _handleResponseStatus(response.statusCode, responseData);
  }

  TodayScheduleParameter? _handleResponseStatus(
      int statusCode, Map<String, dynamic> responseData) {
    if (statusCode == 200 ||
        (statusCode == 404 && responseData['data'] != null)) {
      if (kDebugMode) {
        print('Attendance Data: ${responseData['data']}');
      }
      return TodayScheduleParameter.fromJson(responseData);
    }

    final errorMessage = responseData['message'] ??
        'Failed to fetch attendance data with status code: $statusCode';
    throw Exception(errorMessage);
  }
}
