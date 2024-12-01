import 'dart:async';
import 'dart:convert';
import 'package:absensi/app/data/models/announcement_model.dart';
import 'package:absensi/app/data/repositories/auth_repository.dart';
import 'package:absensi/app/utils/constants/api_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AnnouncementService {
  final AuthRepository authRepository = AuthRepository();

  Future<GetAnnouncement?> fetchAnnouncements() async {
    try {
      final token = await _getToken();
      final response = await _fetchAnnouncementData(token);
      return _processResponse(response);
    } catch (e) {
      // Log debug error
      if (kDebugMode) {
        print('Error: $e');
      }
      throw Exception('Error fetching announcements: $e');
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

  Future<http.Response> _fetchAnnouncementData(String token) async {
    final url = Uri.parse(baseURL + getAnnouncements);
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
      print('Announce Response headers: ${response.headers}');
      print('Announce Response status code: ${response.statusCode}');
      print('Announce Response body: ${response.body}');
    }
  }

  GetAnnouncement? _processResponse(http.Response response) {
    if (response.body.isEmpty) {
      throw Exception('Empty response received');
    }

    final Map<String, dynamic> responseData = jsonDecode(response.body);
    return _handleResponseStatus(response.statusCode, responseData);
  }

  GetAnnouncement? _handleResponseStatus(
      int statusCode, Map<String, dynamic> responseData) {
    if (statusCode == 200) {
      if (kDebugMode) {
        print('Announcement Data: $responseData');
      }
      return GetAnnouncement.fromJson(responseData);
    } else if (statusCode == 404) {
      throw Exception('Announcements not found (404)');
    } else {
      throw Exception('Failed to load announcements: $statusCode');
    }
  }
}
