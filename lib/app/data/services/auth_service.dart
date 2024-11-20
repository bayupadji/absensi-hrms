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

      // print('Response Status: ${response.statusCode}');
      // print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        // Pastikan struktur JSON sesuai dengan response
        if (responseData['data'] != null) {
          final userData = AuthModel.fromJson(responseData['data']);
          final token = userData.rememberToken;
          final arrToken = responseData['data']['arrtoken']['token'];
          final message = responseData['message'] as String;
          final status = responseData['status'] as int;

          print('Parsed Status: $status');
          print('Parsed Message: $message');
          print('Parsed Token: $token');
          print('Parsed arrToken: $arrToken');

          // Check if login is successful
          if (status == 200) {
            if (token.isNotEmpty) {
              final tokenData = {
                'token': token,
                'arrToken': arrToken,
                'userId': userData.id,
                'name': userData.nama,
                'userName': userData.username,
                'roleId':
                    userData.roles.isNotEmpty ? userData.roles.first.id : null,
                'roleName': userData.roles.isNotEmpty
                    ? userData.roles.first.namaRole
                    : null,
              };

              await authRepository.insertToken(tokenData);
              // for debugging log
              print('Token saved successfully: $tokenData');

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
