import 'package:flutter/material.dart';
import '../../core/app_theme.dart';
import '../../models/equipment.dart';

class EquipmentDetailScreen extends StatelessWidget {
  final Equipment item;
  
  const EquipmentDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Цена и требования
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.accentRed.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      const Icon(Icons.shopping_bag, color: AppTheme.accentRedLight, size: 24),
                      const SizedBox(height: 4),
                      Text(
                        '${item.costInBons} бонов',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppTheme.accentRedLight,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                if (item.kitPoints > 0)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        const Icon(Icons.inventory, color: Colors.blue, size: 24),
                        const SizedBox(height: 4),
                        Text(
                          '${item.kitPoints} очка',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Требования
            if (item.requirement != null)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  border: Border.all(color: Colors.orange.withOpacity(0.5)),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.lock, color: Colors.orange, size: 20),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Требование',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
                          ),
                          Text(
                            item.requirement!,
                            style: const TextStyle(color: AppTheme.textPrimary),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            
            if (item.requirement != null) const SizedBox(height: 16),
            
            // Теги
            if (item.tags.isNotEmpty) ...[
              const Text(
                'Особенности:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: item.tags.map((tag) {
                  return Chip(
                    label: Text(_getTagName(tag)),
                    backgroundColor: Colors.grey.withOpacity(0.2),
                  );
                }).toList(),
              ),
              const SizedBox(height: 16),
            ],
            
            // Описание
            const Text(
              'Описание:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
            ),
            const SizedBox(height: 8),
            Text(
              item.description,
              style: const TextStyle(fontSize: 14, color: AppTheme.textSecondary, height: 1.5),
            ),
            
            // Эффекты
            if (item.effects != null && item.effects!.isNotEmpty) ...[
              const SizedBox(height: 24),
              const Text(
                'Эффекты:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
              ),
              const SizedBox(height: 8),
              ...item.effects!.map((effect) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('● ', style: TextStyle(color: AppTheme.accentRedLight, fontSize: 16)),
                    Expanded(
                      child: Text(
                        effect,
                        style: const TextStyle(fontSize: 14, color: AppTheme.textSecondary),
                      ),
                    ),
                  ],
                ),
              )),
            ],
            
            const SizedBox(height: 40),
          ],
        ),
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
        return 'Требует концентрации';
      default:
        return tag;
    }
  }
}