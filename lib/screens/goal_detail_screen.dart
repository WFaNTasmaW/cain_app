import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../models/goal.dart';

class GoalDetailScreen extends StatelessWidget {
  final Goal goal;
  
  const GoalDetailScreen({super.key, required this.goal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(goal.name),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Блок "Ваши цели"
            _buildSectionTitle('Ваши цели:'),
            const SizedBox(height: 8),
            ...goal.objectives.map((objective) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: _buildBulletPoint(objective),
            )),
            
            const SizedBox(height: 24),
            
            // Блок "Способности"
            _buildSectionTitle('Способности:'),
            const SizedBox(height: 12),
            ...goal.abilities.map((ability) => _buildAbilityCard(ability)),
            
            // Особое правило (если есть)
            if (goal.specialRule != null) ...[
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.2),
                  border: Border.all(color: Colors.amber, width: 2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '⚠️ Особое правило:',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      goal.specialRule!,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppTheme.textPrimary,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppTheme.accentRedLight,
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('➤ ', style: TextStyle(color: AppTheme.accentRedLight, fontSize: 16)),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: AppTheme.textPrimary, fontSize: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildAbilityCard(Ability ability) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.accentRed.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text('➤ ', style: TextStyle(color: AppTheme.accentRedLight, fontSize: 16)),
              Expanded(
                child: Text(
                  ability.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            ability.description,
            style: const TextStyle(
              fontSize: 14,
              color: AppTheme.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}