import 'package:flutter/material.dart';

class BlasphemyFull {
  final String id;
  final String name;
  final String? englishName;
  final String? description;
  final String? factNote;
  final String? globalRule;
  final Color themeColor; // Цвет группы
  final List<BlasphemyAbility> abilities;

  BlasphemyFull({
    required this.id,
    required this.name,
    this.englishName,
    this.description,
    this.factNote,
    this.globalRule,
    required this.themeColor,
    required this.abilities,
  });
}

class BlasphemyAbility {
  final String name;
  final String type;
  final String? duration;
  final String? range;
  final String description;
  final List<String>? effects;
  final String? specialRule;

  BlasphemyAbility({
    required this.name,
    required this.type,
    this.duration,
    this.range,
    required this.description,
    this.effects,
    this.specialRule,
  });
}