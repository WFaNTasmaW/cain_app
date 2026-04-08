class Blasphemy {
  final String id;
  final String name;
  final int category;
  final int stressCost;
  final String description;
  final String mechanics;

  Blasphemy({
    required this.id,
    required this.name,
    required this.category,
    required this.stressCost,
    required this.description,
    required this.mechanics,
  });
}

// Тестовые данные
final List<Blasphemy> mockBlasphemies = [
  Blasphemy(
    id: '1',
    name: 'Кровавый Шёпот',
    category: 3,
    stressCost: 2,
    description: 'Вы шепчете имя жертвы, причиняя ей ментальную боль.',
    mechanics: 'Бросок 2d6 + CAT. При успехе: цель получает Стресс 1.',
  ),
  Blasphemy(
    id: '2',
    name: 'Разрыв Реальности',
    category: 5,
    stressCost: 4,
    description: 'Разрываете ткань реальности, создавая временный портал.',
    mechanics: 'Бросок 2d6 + CAT. Портал существует 1 сцену.',
  ),
  Blasphemy(
    id: '3',
    name: 'Глаз Безмолвия',
    category: 2,
    stressCost: 1,
    description: 'Временно лишает цель способности говорить или кричать.',
    mechanics: 'Бросок 2d6 + CAT. Цель не может использовать вербальные компоненты.',
  ),
  Blasphemy(
    id: '4',
    name: 'Тень Прошлого',
    category: 4,
    stressCost: 3,
    description: 'Призываете тень, которая напоминает цели о её худших грехах.',
    mechanics: 'Бросок 2d6 + CAT. Цель получает панику на 1 ход.',
  ),
];