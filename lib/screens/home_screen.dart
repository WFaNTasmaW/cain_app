import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../widgets/category_card.dart';
import 'wiki_screen.dart';
import 'goals_screen.dart';
import 'blasphemies_screen.dart';
import 'sins/sins_main_screen.dart';
import 'equipment/equipment_main_screen.dart';
import 'organization/organization_screen.dart';
import 'novice_guide_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CAIN | Справочник'),
        // Верхнее правое меню
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu, color: AppTheme.textPrimary),
            onSelected: (value) {
              if (value == 'wiki') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WikiScreen(initialTab: 0)),
                );
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'wiki',
                child: ListTile(
                  leading: Icon(Icons.book, color: AppTheme.accentRed),
                  title: Text('Открыть Справочник (Wiki)'),
                ),
              ),
              const PopupMenuItem<String>(
                value: 'settings',
                child: ListTile(
                  leading: Icon(Icons.settings, color: AppTheme.textSecondary),
                  title: Text('Настройки'),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.1,
                children: [
                  CategoryCard(
                    icon: Icons.auto_stories,
                    label: 'Богохульства',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BlasphemiesScreen()),
                      );
                    },
                  ),
                  CategoryCard(
                    icon: Icons.flag_outlined,
                    label: 'Цели',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const GoalsScreen()),
                      );
                    },
                  ),
                  CategoryCard(
                    icon: Icons.bug_report,
                    label: 'Грехи',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SinsMainScreen()),
                      );
                    },
                  ),
                  CategoryCard(
                    icon: Icons.shopping_bag_outlined,
                    label: 'Снаряжение',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EquipmentMainScreen()),
                      );
                    },
                  ),
                  CategoryCard(
                    icon: Icons.business_outlined,
                    label: 'Организация',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const OrganizationScreen()),
                      );
                    },
                  ),
                  CategoryCard(
                    icon: Icons.help_outline,
                    label: 'Новичку',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NoviceGuideScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.cardBackground,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Добро пожаловать!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'CAIN Companion — справочник по НРИ CAIN. '
                    'Здесь ты найдёшь все Богохульства, Грехи и другую информацию.',
                    style: TextStyle(fontSize: 14, color: AppTheme.textSecondary, height: 1.5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Только Главная активна сейчас
        onTap: (index) {
          if (index == 1) {
            _showComingSoon(context, 'Избранное');
          } else if (index == 2) {
            _showComingSoon(context, 'Профиль');
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Избранное'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Профиль'),
        ],
      ),
    );
  }

  void _showComingSoon(BuildContext context, String feature) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppTheme.cardBackground,
        title: const Text('Скоро будет!', style: TextStyle(color: AppTheme.textPrimary)),
        content: Text(
          'Раздел "$feature" находится в разработке.',
          style: const TextStyle(color: AppTheme.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Понятно', style: TextStyle(color: AppTheme.accentRedLight)),
          ),
        ],
      ),
    );
  }
}