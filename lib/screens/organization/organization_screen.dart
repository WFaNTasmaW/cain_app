import 'package:flutter/material.dart';
import '../../core/app_theme.dart';

class OrganizationScreen extends StatelessWidget {
  const OrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Организация CAIN'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Введение
            _buildSection(
              'Что такое CAIN',
              'CAIN — это глобальная надправительственная организация, занимающаяся уничтожением и ликвидацией сверхъестественных явлений. Спрятанная в десятках огромных подземных объектов по всему миру, ее колоссальная инфраструктура существует с одной целью: искоренить пятно грехов человечества.',
              Icons.business,
            ),
            const SizedBox(height: 24),
            
            // Четыре подразделения
            const Text(
              'Подразделения',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            const SizedBox(height: 16),
            
            _buildDivisionCard(
              'AUTHORITY',
              'Руководящий орган',
              'Руководящий орган CAIN, ответственный за скрытность организации и сокрытие большинства проявлений Греха. Совет состоит из восьми старейшин, избираемых по наследству и тайному голосованию.',
              Icons.gavel,
              AppTheme.accentRed,
            ),
            
            _buildDivisionCard(
              'SEER',
              'Разведывательная служба',
              'Ответственна за отслеживание вспышек грехов, вербовку экзорцистов и мониторинг неуправляемых психоактивных агентов. Использует орбитальную платформу SERAPH и группу Heaven Eyes для предсказания будущих событий.',
              Icons.visibility,
              Colors.blue,
            ),
            
            _buildDivisionCard(
              'TEMERITY',
              'Исследовательское подразделение',
              'Отвечает за разработку контрмер, создание вооружения, исследование экзорцистов и заключение грехов под стражу. Также проводит подготовку экзорцистов и развитие их способностей.',
              Icons.science,
              Colors.purple,
            ),
            
            _buildDivisionCard(
              'CASTLE',
              'Организационное подразделение',
              'Отвечает за содержание, образование, обслуживание и благополучие экзорцистов, а также за их отправку на задания. Является ближайшей точкой контакта экзорцистов с организацией.',
              Icons.shield,
              Colors.green,
            ),
            
            const SizedBox(height: 24),
            
            // Теневая война
            _buildSection(
              'Теневая война',
              'Официально CAIN не существует и действует в строгой секретности. Мировые элиты и лидеры, как правило, осведомлены о существовании CAIN, но часто не могут до конца понять истинное значение её деятельности.',
              Icons.vpn_key,
            ),
            
            const SizedBox(height: 16),
            
            // Легион
            _buildSection(
              'Легион',
              'Численность персонала CAIN составляет десятки тысяч человек. Вся организация делится на четыре подразделения, каждое из которых иногда вступает в конфликты с другими.',
              Icons.people,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String text, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.cardBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppTheme.accentRedLight, size: 24),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            text,
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

  Widget _buildDivisionCard(
    String name,
    String subtitle,
    String description,
    IconData icon,
    Color color,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: color,
                        ),
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: const TextStyle(
                fontSize: 13,
                color: AppTheme.textSecondary,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}