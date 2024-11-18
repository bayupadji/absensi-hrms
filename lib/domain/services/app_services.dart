import 'dart:convert';
import 'package:absensi/data/models/login_model.dart';
import 'package:absensi/domain/services/app_repoUrl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AppServices {
  Future<String> login(String email, String password) async {
  try {
    final response = await http.post(
      Uri.parse(baseURL + loginUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    print('Response Status: ${response.statusCode}');
    print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);

      // Pastikan struktur JSON sesuai dengan response
      if (responseData['user'] != null) {
        final userData = Data.fromJson(responseData['user']['data']);
        final token = responseData['token'] as String;
        final message = responseData['user']['message'] as String;
        final status = responseData['user']['status'] as int;

        print('Parsed Status: $status');
        print('Parsed Message: $message');
        print('Parsed Token: $token');

        // Check if login is successful
        if (status == 200 && userData != null) {
          if (token.isNotEmpty) {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString('token', token);
            await prefs.setInt('userId', userData.id ?? 0);
            
            // Simpan data tambahan jika diperlukan
            await prefs.setString('userName', userData.nama ?? '');
            await prefs.setString('userEmail', userData.email ?? '');
            
            // Jika perlu menyimpan role dan permission
            if (userData.role != null) {
              await prefs.setInt('roleId', userData.role?.id ?? 0);
              await prefs.setString('roleName', userData.role?.name ?? '');
            }
            
            if (userData.permission != null) {
              await prefs.setString('permissions', jsonEncode(userData.permission));
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
      final errorMessage = errorData['message'] ?? 'Login failed with status code: ${response.statusCode}';
      throw Exception(errorMessage);
    }
  } catch (e) {
    throw Exception('An error occurred during login: $e');
  }
}
}
