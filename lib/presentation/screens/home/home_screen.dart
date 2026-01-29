import 'package:flutter/material.dart';
import 'home_viewmodel.dart';
import '../../widgets/weather_card.dart';
import '../../widgets/loading_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();
  final _viewModel = HomeViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AnimatedBuilder(
          animation: _viewModel,
          builder: (context, _) {
            return Column(
              children: [
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Nhập tên thành phố',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () =>
                      _viewModel.searchWeather(_controller.text),
                  child: const Text('Tìm kiếm'),
                ),
                const SizedBox(height: 20),
                if (_viewModel.isLoading) const LoadingWidget(),
                if (_viewModel.error.isNotEmpty)
                  Text(_viewModel.error,
                      style: const TextStyle(color: Colors.red)),
                if (_viewModel.weather != null)
                  WeatherCard(weather: _viewModel.weather!),
              ],
            );
          },
        ),
      ),
    );
  }
}
