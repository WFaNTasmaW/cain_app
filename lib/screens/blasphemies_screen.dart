import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../models/blasphemy_full.dart';
import '../data/blasphemies_data.dart';
import 'blasphemy_detail_screen.dart';

class BlasphemiesScreen extends StatelessWidget {
  const BlasphemiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Богохульства'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: allBlasphemies.length,
        itemBuilder: (context, index) {
          final blasphemy = allBlasphemies[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlasphemyDetailScreen(blasphemy: blasphemy),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Основное название
                    Text(
                      blasphemy.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    
                    // Английское название (ЦВЕТ ДИНАМИЧЕСКИЙ)
                    if (blasphemy.englishName != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        blasphemy.englishName!,
                        style: TextStyle( // Убран const, так как цвет теперь переменная
                          fontSize: 12,
                          color: blasphemy.themeColor, // <-- Подхватывает цвет группы
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                    
                    const SizedBox(height: 8),
                    
                    // Количество способностей (иконку тоже покрасил в цвет группы для стиля)
                    Row(
                      children: [
                        Icon(Icons.auto_awesome, size: 16, color: blasphemy.themeColor),
                        const SizedBox(width: 4),
                        Text(
                          '${blasphemy.abilities.length} ${_getAbilityWord(blasphemy.abilities.length)}',
                          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _getAbilityWord(int count) {
    if (count == 1) return 'способность';
    if (count >= 2 && count <= 4) return 'способности';
    return 'способностей';
  }
}