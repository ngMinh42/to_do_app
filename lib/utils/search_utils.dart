import 'package:flutter/material.dart';
import 'package:to_do_app/data/database_helper.dart';
import 'package:to_do_app/models/task.dart';

import 'task_status.dart';

List<Task> searchTasks({required List<Task> tasks, required String keyword}) {
  if (keyword.trim().isEmpty) {
    return tasks;
  }
  final searchText = keyword.trim().toLowerCase();
  return tasks.where((task) {
    return task.title.toLowerCase().contains(searchText);
  }).toList();
}
