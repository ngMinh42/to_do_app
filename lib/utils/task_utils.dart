import 'package:flutter/material.dart';
import 'package:to_do_app/data/database_helper.dart';
import 'package:to_do_app/models/task.dart';

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
// logic cập nhật task
Future<void> updateTask(Task task) async {
  await DatabaseHelper.instance.updateTask(task.id!, task.toMap());
}
// logic xóa task
Future<void> deleteTask(Task task) async {
  if (task.id == null) return;
  await DatabaseHelper.instance.deleteTask(task.id!);
}
// logic hoàn thành task
Future<void> completeTask(Task task) async {
  if (task.id == null) return;
  await DatabaseHelper.instance.updateTask(task.id!, {'status': 1});
}
