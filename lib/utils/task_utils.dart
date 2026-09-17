import 'package:flutter/material.dart';
import 'package:to_do_app/data/database_helper.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/models/task_level.dart';

import 'task_status.dart';

Future<void> saveTask({
  required String title,
  required Color color,
  required DateTime? dueAt,
  required String? place,
  required TaskLevel level,
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

TaskStatus getTaskStatus({required DateTime? dueAt, required double status}) {
  // Đã hoàn thành
  if (status == 1) {
    return TaskStatus.completed;
  }
  if (dueAt == null) {
    return TaskStatus.today;
  }
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final dueDate = DateTime(dueAt.year, dueAt.month, dueAt.day);
  // Quá hạn hoặc đến hạn hôm nay
  if (dueDate.isBefore(today) || dueDate.isAtSameMomentAs(today)) {
    return TaskStatus.today;
  }
  // Ngày sau hôm nay
  return TaskStatus.upcoming;
}
