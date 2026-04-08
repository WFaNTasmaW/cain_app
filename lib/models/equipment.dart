class Equipment {
  final String id;
  final String name;
  final String category; // 'appearance', 'personal', 'misc', 'occult', 'weapon'
  final int costInBons; // Цена в бонах
  final int kitPoints; // Очки комплекта (0 если не требуется)
  final String description;
  final List<String> tags; // 'consumable', 'conspicuous', 'focus', 'range'
  final String? requirement; // Требование (например, "CAT 2+")
  final List<String>? effects; // Эффекты предмета

  Equipment({
    required this.id,
    required this.name,
    required this.category,
    required this.costInBons,
    this.kitPoints = 0,
    required this.description,
    this.tags = const [],
    this.requirement,
    this.effects,
  });

  bool get isConsumable => tags.contains('consumable');
  bool get isConspicuous => tags.contains('conspicuous');
  bool get isFocus => tags.contains('focus');
}