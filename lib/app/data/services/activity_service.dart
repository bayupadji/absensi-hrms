import 'dart:async';
import 'dart:convert';
import 'package:absensi/app/data/models/activity_attend_model.dart';
import 'package:absensi/app/data/repositories/auth_repository.dart';
import 'package:absensi/app/utils/constants/api_repository.dart';
import 'package:absensi/app/utils/exceptions/global_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ActivityService {
  final AuthRepository authRepository = AuthRepository();

  Future<ActivityAttendModel?> getActivity() async {
    try {
      final token = await _getToken();
      final response = await _fetchActivityData(token);
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

  Future<http.Response> _fetchActivityData(String token) async {
    final url = Uri.parse(baseURL + getAttendActivity);
    final response = await http.post(
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
      print('Response headers: ${response.headers}');
      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  }

  ActivityAttendModel? _processResponse(http.Response response) {
    if (response.body.isEmpty) {
      throw Exception('Empty response received');
    }

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    return _handleResponseStatus(response.statusCode, responseData);
  }

  ActivityAttendModel? _handleResponseStatus(
      int statusCode, Map<String, dynamic> responseData) {
    if (statusCode == 200) {
      if (kDebugMode) {
        print('Activity Data: ${responseData['ActivityData']}');
      }
      return ActivityAttendModel.fromJson(responseData);
    } else {
      throw Exception('Failed to load activity attend: $statusCode');
    }
  }
}
