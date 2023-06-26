import 'package:chatgptapp/models/chat_models.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import 'dart:io';
import 'dart:developer';

import '../models/api_models.dart';
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

  static Future<List<ChatModel>> getResponse(
      {required String message, required model}) async {
    try {
      var response = await http.post(
        Uri.parse('$baseUrl/chat/completions'),
        headers: {
          'Authorization': 'Bearer $apiKey',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "model": "$model",
          "messages": [
            {"role": "user", "content": "$message"}
          ],
          "temperature": 0.7
        }),
      );
      log('the message : $message');
      Map jsonResponse = jsonDecode(response.body);
      print('jsonResponse : $jsonResponse');
      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }
      List<ChatModel> chatList = [];
      // String content =
      //     jsonResponse['choices'][0]['message']['content'] as String;
      chatList = List.generate(
          jsonResponse['choices'].length,
          (index) => ChatModel(
              message: jsonResponse['choices'][index]['message']['content'],
              index: 1));
      return chatList;
    } catch (e) {
      log('error $e');
      rethrow;
    }
  }
}
