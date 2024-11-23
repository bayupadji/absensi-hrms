import 'dart:async';
import 'dart:convert';
import 'package:absensi/app/data/models/auth_model.dart';
import 'package:absensi/app/data/repositories/auth_repository.dart';
import 'package:absensi/app/utils/exceptions/global_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:absensi/app/utils/constants/api_repository.dart';

class AuthService {
  final AuthRepository authRepository = AuthRepository();

  Future<String> auth(String username, String password) async {
    try {
      final response = await _performLogin(username, password);
      if (kDebugMode) {
        print("data : $response");
      }
      return await _handleResponse(response);
    } catch (e) {
      // Log the error for debugging
      if (kDebugMode) {
        print("Error during authentication: $e");
      }
      GlobalExceptionHandler.handleError(e);
      rethrow;
    }
  }

  Future<http.Response> _performLogin(String username, String password) async {
    final url = Uri.parse(baseURL + loginUrl);
    return await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': username,
        'password': password,
      }),
    );
  }

  Future<String> _handleResponse(http.Response response) async {
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      if (kDebugMode) {
        print("handleData : $responseData");
      }
      return await _processSuccessfulResponse(responseData);
    } else {
      // Log the error response for debugging
      if (kDebugMode) {
        print("Error response: ${response.body}");
      }
      return _handleErrorResponse(response);
    }
  }

  Future<String> _processSuccessfulResponse(Map<String, dynamic> responseData) async {
  try {
    if (responseData['data'] == null) {
      throw Exception('Invalid response format: data is null');
    }

    final userData = AuthModel.fromJson(responseData['data']);
    final token = userData.rememberToken;
    final arrToken = responseData['data']['arrtoken']?['token'] ?? ''; // Gunakan operator null-aware
    final message = responseData['message'] as String? ?? 'No message provided'; // Tangani null
    final status = responseData['status'] as int? ?? 500; // Tangani null

    // if (kDebugMode) {
    //   print("Response Data: $responseData");
    //   print("User  Data: ${responseData['data']}");
    //   print("Token: $token");
    //   print("arrToken: $arrToken");
    // }

    if (status != 200) {
      throw Exception(message);
    }

    if (token.isEmpty) {
      throw Exception("Token is missing in the response.");
    }

    await authRepository.insertToken({
      'id': userData.id,
      'name': userData.nama,
      'userName': userData.username,
      'email_verified_at': userData.emailVerifiedAt ?? '',
      'role_id': userData.roleId,
      'foto_profil': userData.fotoProfil ?? '',
      'data_completion_step': userData.dataCompletionStep,
      'status_aktif': userData.statusAktif,
      'token': token,
      'remember_token_expired_at': userData.rememberTokenExpiredAt,
      'arrToken': arrToken,
    });

    await _saveUserUnits(userData.unitKerja, userData.id);
    await _saveUserRoles(userData.roles, userData.id);

    return token;
  } catch (e) {
    // Log the error for debugging
    if (kDebugMode) {
      print("Error processing successful response: $e");
    }
    rethrow; // Rethrow the error to be handled by the calling function
  }
}

  Future<void> _saveUserUnits(List<UnitKerja> unitKerjaList, int userId) async {
    for (var unitKerja in unitKerjaList) {
      await authRepository.insertUnitKerja({
        'id': unitKerja.id,
        'nama_unit': unitKerja.namaUnit,
        'jenis_karyawan': unitKerja.jenisKaryawan,
        'user_id': userId,
      });
    }
  }

  Future<void> _saveUserRoles(List<Roles> roles, int userId) async {
    for (var role in roles) {
      await authRepository.insertRole({
        'id': role.id,
        'name': role.namaRole,
        'deskripsi': role.deskripsi ?? '',
        'user_id': userId,
      });
    }
  }

  String _handleErrorResponse(http.Response response) {
    final errorData = jsonDecode(response.body);
    final errorMessage = errorData['message'] ?? 'Login failed with status code: ${response.statusCode}';
    throw Exception(errorMessage);
  }
}