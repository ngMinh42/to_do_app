import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_color.dart';

import '../models/task_level.dart';
import 'tab_chip.dart';

class LevelField extends StatefulWidget {
  final ValueChanged<TaskLevel>? onChanged;
  const LevelField({super.key, this.onChanged});

  @override
  State<LevelField> createState() => _LevelFieldState();
}

class _LevelFieldState extends State<LevelField> {
  double selectedLevel = 1.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 7),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColor.lightGray, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: TaskLevel.levels.map((level) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: TabChip(
              title: level.title,
              isFocused: selectedLevel == level.value,
              onTap: () {
                setState(() {
                  selectedLevel = level.value;
                });
                widget.onChanged?.call(level);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
