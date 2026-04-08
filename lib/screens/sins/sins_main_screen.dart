import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../data/sins_data.dart';
import 'sin_reference_screen.dart';

class SinsMainScreen extends StatelessWidget {
  const SinsMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Грехи'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Типы Грехов',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
            ),
            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
              children: sinTypes.map((sin) => _buildSinCard(context, sin)).toList(),
            ),
            
            const SizedBox(height: 24),
            const Divider(color: AppTheme.textSecondary),
            const SizedBox(height: 16),
            
            const Text(
              'Справочная информация',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
            ),
            const SizedBox(height: 12),
            
            _buildRefButton(context, '📊 Категории и Шкала', 'Таблица масштабов 0-7', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SinReferenceScreen(initialTab: 0)));
            }),
            _buildRefButton(context, '🔄 Формы Грехов', 'Отделенный, Слитый, Связанный', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SinReferenceScreen(initialTab: 1)));
            }),
            _buildRefButton(context, '⚙️ Механики и Домены', 'Талисманы, Дворец, Травмы', () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SinReferenceScreen(initialTab: 2)));
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSinCard(BuildContext context, sin) {
    // Получаем первую букву имени для иконки
    final firstLetter = sin.name.isNotEmpty ? sin.name[0].toUpperCase() : '?';
    
    return Card(
      child: InkWell(
        onTap: () {
          // Пока просто заглушка, позже добавим детали
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Детали для ${sin.name} в разработке')));
        },
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Круг с первой буквой вместо иконки
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppTheme.accentRed.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    firstLetter,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.accentRedLight,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                sin.name, 
                textAlign: TextAlign.center, 
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
              ),
              const SizedBox(height: 4),
              Text(
                'Питается: ${sin.feedingSource}', 
                textAlign: TextAlign.center, 
                style: const TextStyle(fontSize: 11, color: AppTheme.textSecondary),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRefButton(BuildContext context, String title, String subtitle, VoidCallback onTap) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const Icon(Icons.menu_book, color: AppTheme.accentRedLight),
        title: Text(title, style: const TextStyle(color: AppTheme.textPrimary)),
        subtitle: Text(subtitle, style: const TextStyle(color: AppTheme.textSecondary)),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: AppTheme.textSecondary),
        onTap: onTap,
      ),
    );
  }
}