import 'package:flutter/material.dart';
import 'theme.dart';
import '../presentation/screens/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: AppTheme.lightTheme,
      home: const HomeScreen(),
    );
  }
}
