import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../data/equipment_data.dart';
import 'equipment_detail_screen.dart';

class EquipmentListScreen extends StatelessWidget {
  final String categoryId;
  
  const EquipmentListScreen({super.key, required this.categoryId});

  String _getCategoryName(String id) {
    switch (id) {
      case 'appearance':
        return 'Внешний вид';
      case 'personal':
        return 'Личное/Карьера';
      case 'misc':
        return 'Различные вещи';
      case 'occult':
        return 'Оккультное/Медицина';
      case 'weapon':
        return 'Оружие';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final items = allEquipment.where((e) => e.category == categoryId).toList();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(_getCategoryName(categoryId)),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EquipmentDetailScreen(item: item),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textPrimary,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: AppTheme.accentRed.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            '${item.costInBons} 💲',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppTheme.accentRedLight,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (item.requirement != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        item.requirement!,
                        style: const TextStyle(fontSize: 12, color: AppTheme.accentRedLight, fontStyle: FontStyle.italic),
                      ),
                    ],
                    const SizedBox(height: 8),
                    Text(
                      item.description,
                      style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (item.tags.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        children: item.tags.map((tag) {
                          return Container(
                            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              _getTagName(tag),
                              style: const TextStyle(fontSize: 10, color: AppTheme.textSecondary),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  String _getTagName(String tag) {
    switch (tag) {
      case 'consumable':
        return 'Расходуемый';
      case 'conspicuous':
        return 'Заметный';
      case 'focus':
        return 'Фокусировка';
      default:
        return tag;
    }
  }
}