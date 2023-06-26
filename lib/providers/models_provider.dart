import 'package:flutter/material.dart';

import '../models/api_models.dart';
import '../services/api_service.dart';

class ModelsProvider with ChangeNotifier {
  List<ApiModel> _models = [];
  String _currentModel = 'gpt-3.5-turbo-16k';

  List<ApiModel> get getModels => _models;

  String get getCurrentModel => _currentModel;

  void setCurrentModel(String model) {
    _currentModel = model;
    notifyListeners();
  }

  Future<List<ApiModel>> getAllModels() async {
    _models = await ApiService.getModels();
    return _models;
  }
}
