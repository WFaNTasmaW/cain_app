import 'package:flutter/material.dart';
import '../core/app_theme.dart';

class NoviceGuideScreen extends StatelessWidget {
  const NoviceGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Гайд для новичка'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Вступление
            _buildSection(
              'Кто вы?',
              'Вы — экзорцист, инструмент и оружие в руках сверхсекретной организации CAIN. Ваша сила — это Благодать. Ваша цель — охотиться на Грехи и уничтожать их.',
            ),
            const SizedBox(height: 20),

            // Шаг 1
            _buildStep(
              index: 1,
              title: 'Предпосылки и Вопросы',
              content: 'Ответьте на эти 5 вопросов (их можно записать в секрете или обсудить с Админом):',
              bullets: [
                'Как ваши силы впервые проявились?',
                'Где находится семя греха: в мозге или в сердце?',
                'Что скрыто в глубинах вашего сознания?',
                'Ваша рука — это ваша рука?',
                'Помните ли вы лицо своей матери?',
              ],
            ),
            const SizedBox(height: 20),

            // Шаг 2
            _buildStep(
              index: 2,
              title: 'Распределение Навыков',
              content: 'У вас есть 10 базовых навыков. Распределите их следующим образом:',
              bullets: [
                'Увеличьте 5 любых навыков на +1.',
                'Увеличьте 2 любых навыка на +2.',
                'Максимум двух навыков может быть на уровне 3.',
                'Навык ПСИХО равен CAT/2 (округленно вверх).',
              ],
              subtext: 'Навыки: Сила, Координация, Выносливость, Скрытность, Интерфейс, Наблюдение, Расследование, Авторитет, Переговоры, Связи.',
            ),
            const SizedBox(height: 20),

            // Шаг 3
            _buildStep(
              index: 3,
              title: 'Выбор Цели',
              content: 'Цель описывает мотивацию персонажа. Выберите одну из 16 целей (см. раздел "Цели" в меню).',
              bullets: [
                'Выберите 1 стартовую способность из этой цели.',
                'Цель помогает получать опыт в конце сессии.',
              ],
            ),
            const SizedBox(height: 20),

            // Шаг 4
            _buildStep(
              index: 4,
              title: 'Выбор Богохульства',
              content: 'Это ваши основные сверхъестественные силы.',
              bullets: [
                'Выберите одно из 12 Богохульств (см. раздел "Богохульства" в меню).',
                'Выберите 2 стартовые способности из него.',
                'Все начинают с пассивного Богохульства "ВЗРЫВ" и 3 психическими всплесками.',
              ],
            ),
            const SizedBox(height: 20),

            // Шаг 5
            _buildStep(
              index: 5,
              title: 'Финальная Сверка',
              content: 'Заполните лист персонажа:',
              bullets: [
                'Талисман Стресса: 6/6 (пустой при старте).',
                'Грех: 0 (Предел 10).',
                'Комплект: 5 очков.',
                'Психические всплески: 3.',
                'Навык ПСИХО: 1 (для CAT 1/2).',
              ],
            ),
            
            const SizedBox(height: 40),
            
            Center(
              child: Text(
                'Готово к охоте!\nПока не истребишь их всех!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: AppTheme.accentRedLight,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(String title, String text) {
    return Container(
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
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
          ),
          const SizedBox(height: 8),
          Text(
            text,
            style: const TextStyle(fontSize: 14, color: AppTheme.textSecondary, height: 1.5),
          ),
        ],
      ),
    );
  }

  Widget _buildStep({
    required int index,
    required String title,
    required String content,
    required List<String> bullets,
    String? subtext,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: AppTheme.accentRed,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  '$index',
                  style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.textPrimary),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          content,
          style: const TextStyle(fontSize: 14, color: AppTheme.textPrimary, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        ...bullets.map((b) => Padding(
              padding: const EdgeInsets.only(bottom: 4, left: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('• ', style: TextStyle(color: AppTheme.accentRedLight, fontSize: 16)),
                  Expanded(
                    child: Text(b, style: const TextStyle(fontSize: 13, color: AppTheme.textSecondary, height: 1.4)),
                  ),
                ],
              ),
            )),
        if (subtext != null) ...[
          const SizedBox(height: 8),
          Text(
            subtext,
            style: const TextStyle(fontSize: 12, color: AppTheme.accentRedLight, fontStyle: FontStyle.italic),
          ),
        ],
      ],
    );
  }
}