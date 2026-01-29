import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../core/constants/api_constants.dart';

class WeatherService {
  Future<Map<String, dynamic>> getWeather(String city) async {
    final url =
        '${ApiConstants.baseUrl}?q=$city&units=metric&appid=${ApiConstants.apiKey}';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('City not found');
    }
  }
}
