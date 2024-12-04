import 'dart:async';
import 'dart:convert';
import 'package:absensi/app/data/models/employee_sm_schedule.dart';
import 'package:absensi/app/data/repositories/auth_repository.dart';
import 'package:absensi/app/utils/constants/api_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class EmployeeService {
  final AuthRepository authRepository = AuthRepository();

  Future<EmployeeSmSchedule?> fetchEmployeeSchedule() async {
    try {
      final token = await _getToken();
      final response = await _fetchEmployeeScheduleData(token);
      return _processResponse(response);
    } catch (e) {
      // Log debug error
      if (kDebugMode) {
        print('Error: $e');
      }
      throw Exception('Error fetching Employee Schedule: $e');
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

  Future<http.Response> _fetchEmployeeScheduleData(String token) async {
    final url = Uri.parse(
        baseURL + getEmployeeSchedule);

    final response = await http.get(
      url,
      headers: _buildHeaders(token),
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
      print('get Employee Sch Response headers: ${response.headers}');
      print('get Employee Sch Response status code: ${response.statusCode}');
      print('get Employee Sch Response body: ${response.body}');
    }
  }

  EmployeeSmSchedule? _processResponse(http.Response response) {
    if (response.body.isEmpty) {
      throw Exception('Empty response received');
    }

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    return _handleResponseStatus(response.statusCode, responseData);
  }

  EmployeeSmSchedule? _handleResponseStatus(int statusCode, Map<String, dynamic> responseData) {
    if (statusCode == 200) {
      if (kDebugMode) {
        print('Employee Schedule Data: $responseData');
      }
      return EmployeeSmSchedule.fromJson(responseData);
    } else {
      throw Exception('$statusCode Failed to fetch employee schedule');
    }
  }
}