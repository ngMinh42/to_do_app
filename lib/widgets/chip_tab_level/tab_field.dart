import 'package:flutter/material.dart';
import 'package:to_do_app/utils/task_status.dart';
import 'tab_chip.dart';

class TabField extends StatefulWidget {
  final TaskStatus selectedStatus;
  final ValueChanged<TaskStatus>? onStatusChanged;
  const TabField({
    super.key,
    required this.selectedStatus,
    required this.onStatusChanged,
  });

  @override
  State<TabField> createState() => _TabFieldState();
}

class _TabFieldState extends State<TabField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: TaskStatus.values.map((status) {
          return TabChip(
            title: status.title,
            isFocused: widget.selectedStatus == status,
            onTap: () {
              widget.onStatusChanged?.call(status);
            },
          );
        }).toList(),
      ),
    );
  }
}
