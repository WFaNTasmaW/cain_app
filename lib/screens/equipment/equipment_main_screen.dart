import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import 'equipment_list_screen.dart';

class EquipmentMainScreen extends StatelessWidget {
  const EquipmentMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'Внешний вид', 'icon': Icons.checkroom, 'id': 'appearance'},
      {'name': 'Личное/Карьера', 'icon': Icons.badge, 'id': 'personal'},
      {'name': 'Различные вещи', 'icon': Icons.looks, 'id': 'misc'},
      {'name': 'Оккультное/Медицина', 'icon': Icons.medical_services, 'id': 'occult'},
      {'name': 'Оружие', 'icon': Icons.gavel, 'id': 'weapon'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Снаряжение'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.1,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Card(
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EquipmentListScreen(categoryId: category['id'] as String),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      category['icon'] as IconData,
                      size: 48,
                      color: AppTheme.accentRedLight,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      category['name'] as String,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}