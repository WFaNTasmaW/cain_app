import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class SinReferenceScreen extends StatefulWidget {
  final int initialTab;
  const SinReferenceScreen({super.key, this.initialTab = 0});

  @override
  State<SinReferenceScreen> createState() => _SinReferenceScreenState();
}

class _SinReferenceScreenState extends State<SinReferenceScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: widget.initialTab);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Справочник Грехов'),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppTheme.accentRedLight,
          unselectedLabelColor: AppTheme.textSecondary,
          indicatorColor: AppTheme.accentRed,
          tabs: const [Tab(text: 'Категории'), Tab(text: 'Формы'), Tab(text: 'Механики')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCategoriesTab(),
          _buildFormsTab(),
          _buildMechanicsTab(),
        ],
      ),
    );
  }

  Widget _buildCategoriesTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔴 ТВОЯ КАРТИНКА ЗДЕСЬ
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.cardBackground,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.textSecondary.withOpacity(0.3)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/sins/category_scale.png', // Путь к картинке
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 200,
                    color: Colors.grey[800],
                    child: const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_not_supported, size: 48, color: AppTheme.textSecondary),
                          SizedBox(height: 8),
                          Text('Добавьте картинку в\nassets/images/sins/category_scale.png', 
                               textAlign: TextAlign.center, style: TextStyle(color: AppTheme.textSecondary)),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          _buildSectionText(
            title: 'Категории (0-7)',
            text: 'Грехи оцениваются по системе категорий. Категория определяет масштаб и мощь способностей. Борьба с грехом более высокой категории может быть трудной, рискованной или невозможной.',
          ),
          _buildSectionText(
            title: '⚠️ Важно',
            text: 'НЕ ПОДДЕРЖИВАЙТЕ ЗРИТЕЛЬНЫЙ КОНТАКТ С ГРЕХОМ БОЛЕЕ ТРЕХ СЕКУНД!\nОбычное оружие против грехов всегда трудна. Чтобы навредить греху, экзорцисты должны использовать богохульства.',
            isWarning: true,
          ),
        ],
      ),
    );
  }

  Widget _buildFormsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFormCard('Форма I / Отделенный', 
            'Самый популярный тип. Грех свободно действует от своего носителя, являясь психоактивным существом. Сохраняет врожденную связь с носителем. Может быть как зловредным, так и полезным.'),
          _buildFormCard('Форма II / Слитый', 
            'Грех объединяется с телом или трупом носителя, образуя амальгаму. Грех обычно доминирует. Люди могут почувствовать, что с этим человеком что-то «не так».\n\n⚠️ Восприятие греха формы II, не выглядящего как человек, может вызвать потерю сознания у людей без благодати.'),
          _buildFormCard('Форма III / Связанный', 
            'Редкая форма. Возникает, когда человек или экзорцист способен контролировать и командовать грехом формы I или II. Может возникать из их собственного тела или быть связан отдельно.'),
        ],
      ),
    );
  }

  Widget _buildMechanicsTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionText(title: 'Домены', text: 'Каждый грех имеет 3 домена. Домен — это основная сила греха, предоставляющая способности и определяющая тематику атак.'),
          _buildSectionText(title: 'Талисманы', text: '• Талисман Давления: Заполняется со временем, ухудшая ситуацию.\n• Талисман Казни: Отслеживает урон и физическое состояние греха.'),
          _buildSectionText(title: 'Дворец (Логово)', text: 'Карманное измерение греха. Если грех получает 4 черточки на талисмане казни вне дворца, он отступает туда и восстанавливает здоровье. Бой внутри дворца = сцена казни (сбежать нельзя).'),
          _buildSectionText(title: 'Травмы', text: 'Особые трагические обстоятельства рождения греха. Исследование и раскрытие травм могут существенно ослабить греха.'),
          _buildSectionText(title: 'События Греха', text: 'Травматическое нарушение вуали. Смертельно для людей. Грех в центре претерпевает апофеоз и эволюционирует. Каждое следующее событие сильнее предыдущего.'),
        ],
      ),
    );
  }

  Widget _buildSectionText({required String title, required String text, bool isWarning = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isWarning ? Colors.red.withOpacity(0.1) : AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: isWarning ? Colors.red.withOpacity(0.5) : AppTheme.textSecondary.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: isWarning ? Colors.red : AppTheme.textPrimary)),
          const SizedBox(height: 8),
          Text(text, style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary, height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildFormCard(String title, String text) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(8),
        border: Border(left: BorderSide(color: AppTheme.accentRed, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppTheme.textPrimary)),
          const SizedBox(height: 8),
          Text(text, style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary, height: 1.5)),
        ],
      ),
    );
  }
}