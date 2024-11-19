// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:absensi/data/models/login_model.dart';
import 'package:absensi/domain/services/app_repourl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AppServices {
  Future<String> login(String username, String password) async {
    try {
      final url = Uri.parse(baseURL + loginUrl);
      // print('Login URL: $url');
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

      print('Response Status: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        // Pastikan struktur JSON sesuai dengan response
        if (responseData['data'] != null) {
          final userData = LoginModel.fromJson(responseData['data']);
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
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('token', token);
              await prefs.setString('arrToken', arrToken);
              await prefs.setInt('userId', userData.id);
              // Simpan data tambahan jika diperlukan
              await prefs.setString('name', userData.nama);
              await prefs.setString('userName', userData.username);

              // Jika perlu menyimpan role dan permission
              if (userData.roles.isNotEmpty) {
                await prefs.setInt('roleId', userData.roles.first.id);
                await prefs.setString('roleName', userData.roles.first.namaRole);
              }

              print('Token successfully saved in SharedPreferences: $token');
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
