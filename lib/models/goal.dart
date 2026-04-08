class Goal {
  final String id;
  final String name; // Например: "Выживший (Survivor)"
  final List<String> objectives; // Цели: ["Выживите"]
  final List<Ability> abilities; // Список способностей
  final String? specialRule; // Особое правило (жёлтый блок)
  final String? prerequisite; // Требование (если есть)

  Goal({
    required this.id,
    required this.name,
    required this.objectives,
    required this.abilities,
    this.specialRule,
    this.prerequisite,
  });
}

class Ability {
  final String name;
  final String description;

  Ability({
    required this.name,
    required this.description,
  });
}