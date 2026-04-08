import 'package:flutter/material.dart';
import 'core/app_theme.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CainApp());
}

class CainApp extends StatelessWidget {
  const CainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CAIN Companion',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const HomeScreen(), // <-- Вот это важно!
    );
  }
}