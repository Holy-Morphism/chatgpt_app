import 'dart:convert';
import 'dart:io';
import 'dart:developer';

import 'package:chatgptapp/models/api_models.dart';
import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';

class ApiService {
  static Future<List<ApiModel>> getModels() async {
    try {
      var response = await http.get(
        Uri.parse('$baseUrl/models'),
        headers: {'Authorization': 'Bearer $apiKey'},
      );
      Map jsonResponse = jsonDecode(response.body);
      print('jsonResponse : $jsonResponse');
      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }
      List temp = [];
      for (var value in jsonResponse['data']) {
        temp.add(value);
        log('temp ${value['id']}');
      }
      return ApiModel.modeslFromSnapshot(temp);
    } catch (e) {
      log('error : $e');
      rethrow;
    }
  }
}
