import 'package:flutter/material.dart';
import '../../../data/models/weather_model.dart';
import '../../../data/repositories/weather_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final WeatherRepository _repository = WeatherRepository();

  Weather? weather;
  bool isLoading = false;
  String error = '';

  Future<void> searchWeather(String city) async {
    isLoading = true;
    error = '';
    notifyListeners();

    try {
      weather = await _repository.fetchWeather(city);
    } catch (e) {
      error = 'Không tìm thấy thành phố';
    }

    isLoading = false;
    notifyListeners();
  }
}
