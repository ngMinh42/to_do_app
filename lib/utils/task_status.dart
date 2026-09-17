enum TaskStatus {
  today('Today'),
  upcoming('Upcoming'),
  finished('Finished');

  final String title;

  const TaskStatus(this.title);
}

TaskStatus getTaskStatus({required DateTime? dueAt, required double status}) {
  // Đã hoàn thành
  if (status == 1) {
    return TaskStatus.finished;
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
