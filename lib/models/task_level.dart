class TaskLevel {
  final String title;
  final double value;

  const TaskLevel({required this.title, required this.value});

  static const List<TaskLevel> levels = [
    TaskLevel(title: 'Urgent', value: 1.0),
    TaskLevel(title: 'Basic', value: 2.0),
    TaskLevel(title: 'Important', value: 3.0),
  ];
}
