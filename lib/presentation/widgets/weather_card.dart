import 'package:flutter/material.dart';
import '../../data/models/weather_model.dart';

class WeatherCard extends StatelessWidget {
  final Weather weather;

  const WeatherCard({super.key, required this.weather});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              weather.city,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text('${weather.temperature} °C',
                style: const TextStyle(fontSize: 18)),
            Text(weather.description),
            Text('Độ ẩm: ${weather.humidity}%'),
          ],
        ),
      ),
    );
  }
}
