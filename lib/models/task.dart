import 'package:flutter/material.dart';

class Task {
  final String title;
  final Color? color;
  final DateTime? dueAt;
  final String? place;
  final String level;
  final double status;
  final int? id;

  const Task({
    required this.title,
    this.color,
    this.dueAt,
    this.place,
    required this.level,
    required this.status,
    this.id,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'color': color?.toARGB32(),
      'dueAt': dueAt?.toIso8601String(),
      'place': place,
      'level': level,
      'status': status,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      color: map['color'] != null ? Color(map['color']) : null,
      dueAt: map['dueAt'] != null ? DateTime.parse(map['dueAt']) : null,
      place: map['place'],
      level: map['level'],
      status: map['status'],
    );
  }
}
