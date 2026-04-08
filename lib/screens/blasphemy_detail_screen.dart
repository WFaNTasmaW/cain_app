import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../models/blasphemy_full.dart';

class BlasphemyDetailScreen extends StatelessWidget {
  final BlasphemyFull blasphemy;

  const BlasphemyDetailScreen({super.key, required this.blasphemy});

  @override
  Widget build(BuildContext context) {
    // Сортировка: Пассивная способность всегда первая
    final sortedAbilities = List<BlasphemyAbility>.from(blasphemy.abilities);
    sortedAbilities.sort((a, b) {
      if (a.type == 'Пассивно' && b.type != 'Пассивно') return -1;
      if (a.type != 'Пассивно' && b.type == 'Пассивно') return 1;
      return 0;
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          blasphemy.name,
          style: TextStyle(color: blasphemy.themeColor), // Цветной заголовок в AppBar
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Английское название
            if (blasphemy.englishName != null) ...[
              Text(
                blasphemy.englishName!,
                style: TextStyle(fontSize: 14, color: blasphemy.themeColor.withOpacity(0.7), fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 8),
            ],

            // 1. Блок "Факт" (Самый первый, как просил)
            if (blasphemy.factNote != null) ...[
              _buildInfoBox(
                icon: Icons.info_outline,
                title: 'Факт:',
                text: blasphemy.factNote!,
                color: AppTheme.textSecondary,
                bgColor: Colors.grey,
              ),
              const SizedBox(height: 16),
            ],

            // 2. Глобальное правило
            if (blasphemy.globalRule != null) ...[
              _buildInfoBox(
                icon: Icons.hourglass_empty,
                title: 'Глобальный эффект:',
                text: blasphemy.globalRule!,
                color: const Color(0xFFB084E0),
                bgColor: const Color(0xFF2A1B3D),
              ),
              const SizedBox(height: 24),
            ],

            // Заголовок способностей
            const Text(
              'Способности:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
            ),
            const SizedBox(height: 12),

            // 3. Список способностей (уже отсортированный)
            ...sortedAbilities.map((ability) => _buildAbilityCard(ability)),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox({
    required IconData icon,
    required String title,
    required String text,
    required Color color,
    Color? bgColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: (bgColor ?? Colors.grey).withOpacity(0.15),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color),
                ),
                const SizedBox(height: 4),
                Text(
                  text,
                  style: const TextStyle(fontSize: 13, color: AppTheme.textPrimary, height: 1.4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAbilityCard(BlasphemyAbility ability) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.accentRed.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ability.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
          ),
          const SizedBox(height: 8),

          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: AppTheme.accentRed.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  ability.type,
                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.accentRedLight),
                ),
              ),
              if (ability.duration != null) _buildTag(ability.duration!),
              if (ability.range != null) _buildTag(ability.range!),
            ],
          ),
          const SizedBox(height: 12),

          Text(
            ability.description,
            style: const TextStyle(fontSize: 14, color: AppTheme.textSecondary, height: 1.5),
          ),

          if (ability.effects != null && ability.effects!.isNotEmpty) ...[
            const SizedBox(height: 12),
            ...ability.effects!.map((effect) => Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('● ', style: TextStyle(color: AppTheme.accentRedLight, fontSize: 12)),
                      Expanded(
                        child: Text(
                          effect,
                          style: const TextStyle(fontSize: 13, color: AppTheme.textPrimary, height: 1.4),
                        ),
                      ),
                    ],
                  ),
                )),
          ],

          if (ability.specialRule != null) ...[
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.15),
                border: Border.all(color: Colors.amber.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                ability.specialRule!,
                style: const TextStyle(fontSize: 13, color: AppTheme.textPrimary, height: 1.5, fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Text(text, style: const TextStyle(fontSize: 12, color: AppTheme.textSecondary));
  }
}