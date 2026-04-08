import 'package:flutter/material.dart';
import '../models/blasphemy.dart';
import '../core/app_theme.dart';

class BlasphemyDetailScreen extends StatelessWidget {
  final Blasphemy blasphemy;
  const BlasphemyDetailScreen({super.key, required this.blasphemy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(blasphemy.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Категория: ${blasphemy.category}', style: TextStyle(color: AppTheme.accentRedLight, fontSize: 16)),
            const SizedBox(height: 4),
            Text('Стоимость стресса: ${blasphemy.stressCost}', style: TextStyle(color: AppTheme.textSecondary)),
            const Divider(height: 32, color: AppTheme.textSecondary),
            const Text('Описание:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Text(blasphemy.description, style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 16),
            const Text('Механика:', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 8),
            Text(blasphemy.mechanics, style: const TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}