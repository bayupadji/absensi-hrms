import 'dart:convert';
import 'package:absensi/app/data/models/auth_model.dart';
import 'package:absensi/app/data/repositories/auth_repository.dart';
import 'package:http/http.dart' as http;
import 'package:absensi/app/utils/constants/api_repository.dart';

class AuthService {
  final AuthRepository authRepository = AuthRepository();

  Future<String> auth(String username, String password) async {
    try {
      final url = Uri.parse(baseURL + loginUrl);
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        // Pastikan struktur JSON sesuai dengan response
        if (responseData['data'] != null) {
          final userData = AuthModel.fromJson(responseData['data']);
          final token = userData.rememberToken;
          final arrToken = responseData['data']['arrtoken']['token'];
          final message = responseData['message'] as String;
          final status = responseData['status'] as int;

          // Check if login is successful
          if (status == 200) {
            if (token.isNotEmpty) {
              // Siapkan data untuk disimpan
              final tokenData = {
                'id': userData.id,
                'name': userData.nama,
                'userName': userData.username,
                'email_verified_at': userData.emailVerifiedAt,
                'role_id': userData.roleId,
                'foto_profil': userData.fotoProfil,
                'data_completion_step': userData.dataCompletionStep,
                'status_aktif': userData.statusAktif,
                'token': token,
                'remember_token_expired_at': userData.rememberTokenExpiredAt,
                'arrToken': arrToken,
              };

              // Simpan token ke database
              await authRepository.insertToken(tokenData);

              print(tokenData);

              // Simpan unit kerja
              for (var unitKerja in userData.unitKerja) {
                await authRepository.insertUnitKerja({
                  'id': unitKerja.id,
                  'nama_unit': unitKerja.namaUnit,
                  'jenis_karyawan': unitKerja.jenisKaryawan,
                  'user_id': userData.id,
                });
              }

              // Simpan roles
              for (var role in userData.roles) {
                await authRepository.insertRole({
                  'id': role.id,
                  'name': role.namaRole,
                  'deskripsi': role.deskripsi,
                  'user_id': userData.id,
                });
              }

              return token;
            } else {
              throw Exception("Token is missing in the response.");
            }
          } else {
            throw Exception(message);
          }
        } else {
          throw Exception('Invalid response format');
        }
      } else {
        // Handle error response
        final Map<String, dynamic> errorData = jsonDecode(response.body);
        final errorMessage = errorData['message'] ??
            'Login failed with status code: ${response.statusCode}';
        throw Exception(errorMessage);
      }
    } catch (e) {
      throw Exception('An error occurred during login: $e');
    }
  }
}
