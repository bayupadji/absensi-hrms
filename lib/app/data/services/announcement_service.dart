import 'dart:convert';
import 'package:absensi/app/utils/constants/api_repository.dart';
import 'package:http/http.dart' as http;
import '../models/announcement_model.dart';

class AnnouncementService {
  final Uri url = Uri.parse(baseURL + getLatestAnnounce);

  Future<GetAnnouncement> fetchAnnouncements() async {
    try {
      final response = await http.get(url);
      return _handleResponse(response);
    } catch (e) {
      throw Exception('Error fetching announcements: $e');
    }
  }

  GetAnnouncement _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return GetAnnouncement.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load announcements: ${response.statusCode}');
    }
  }
}
