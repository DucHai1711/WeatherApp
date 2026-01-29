import '../models/weather_model.dart';
import '../services/weather_service.dart';

class WeatherRepository {
  final WeatherService _service = WeatherService();

  Future<Weather> fetchWeather(String city) async {
    final json = await _service.getWeather(city);
    return Weather.fromJson(json);
  }
}
