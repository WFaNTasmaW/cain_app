class SinType {
  final String id;
  final String name;
  final String feedingSource;
  final String description;
  final String iconData; // Пока используем иконки, позже заменим на картинки

  SinType({
    required this.id,
    required this.name,
    required this.feedingSource,
    required this.description,
    this.iconData = '👹',
  });
}