import 'package:flutter/material.dart';
import 'package:to_do_app/data/database_helper.dart';
import 'package:to_do_app/models/task.dart';

import 'task_status.dart';

Future<void> saveTask({
  required String title,
  required Color color,
  required DateTime? dueAt,
  required String? place,
  required String level,
  required double status,
}) async {
  final task = Task(
    title: title,
    color: color,
    dueAt: dueAt,
    place: place,
    level: level,
    status: status,
  );

  await DatabaseHelper.instance.insertTask(task);
}
