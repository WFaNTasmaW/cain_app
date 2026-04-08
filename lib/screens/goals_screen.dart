import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../models/goal.dart';
import '../data/goals_data.dart';
import 'goal_detail_screen.dart';

class GoalsScreen extends StatelessWidget {
  const GoalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Цели'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: allGoals.length,
        itemBuilder: (context, index) {
          final goal = allGoals[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GoalDetailScreen(goal: goal)),
                );
              },
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Название цели
                    Text(
                      goal.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Количество способностей
                    Row(
                      children: [
                        Icon(Icons.auto_awesome, size: 16, color: AppTheme.accentRedLight),
                        const SizedBox(width: 4),
                        Text(
                          '${goal.abilities.length} ${_getAbilityWord(goal.abilities.length)}',
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