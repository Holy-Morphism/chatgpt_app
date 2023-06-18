import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';

class ApiService {
  static Future<void> getModels() async {
    try {
      http.get(Uri.parse('$baseUrl/models'),
          headers: {'Authorization': 'Bearer $apiKey'});
    } catch (e) {
      print('error $e');
    }
  }
}
