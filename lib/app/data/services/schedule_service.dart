import 'dart:async';
import 'dart:convert';
import 'package:absensi/app/data/models/schedule_model.dart';
import 'package:absensi/app/data/repositories/auth_repository.dart';
import 'package:absensi/app/utils/constants/api_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ScheduleService {
  final AuthRepository authRepository = AuthRepository();

  Future<Schedule?> createSchedule(String tglMulai, String tglSelesai) async {
    try {
      final token = await _getToken();
      final response = await _fetchScheduleData(token, tglMulai, tglSelesai);
      return _processResponse(response);
    } catch (e) {
      // log debug error
      if (kDebugMode) {
        print('Error: $e');
      }
      throw Exception('Error fetching Schedule: $e');
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

  Future<http.Response> _fetchScheduleData(String token, String tglMulai, String tglSelesai) async {
    final url = Uri.parse(baseURL + getSchedule);

    final response = await http.post(
      url,
      headers: _buildHeaders(token),
      body: jsonEncode({
        'tgl_mulai': tglMulai,
        'tgl_selesai': tglSelesai,
      }),
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

  Schedule? _processResponse(http.Response response) {
    if (response.body.isEmpty) {
      throw Exception('Empty response received');
    }

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    return _handleResponseStatus(response.statusCode, responseData);
  }

  Schedule? _handleResponseStatus(int statusCode, Map<String, dynamic> responseData) {
    if (statusCode == 200) {
      if (kDebugMode) {
        print('Schedule Data: $responseData');
      }
      return Schedule.fromJson(responseData);
    } else {
      throw Exception('$statusCode Failed to create schedule');
    }
  }
}
