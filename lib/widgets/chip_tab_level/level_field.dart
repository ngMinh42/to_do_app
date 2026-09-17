import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_color.dart';

import 'tab_chip.dart';

class LevelField extends StatefulWidget {
  final String initialLevel;
  final ValueChanged<String>? onChanged;
  const LevelField({super.key, this.onChanged, this.initialLevel = 'Urgent'});

  @override
  State<LevelField> createState() => _LevelFieldState();
}

class _LevelFieldState extends State<LevelField> {
  final List<String> levels = ['Urgent', 'Basic', 'Important'];
  late String selectedLevel = 'Urgent';

  @override
  void initState() {
    super.initState();
    selectedLevel = widget.initialLevel;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 7),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColor.lightGray, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: levels.map((level) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: TabChip(
              title: level,
              isFocused: selectedLevel == level,
              onTap: () {
                setState(() {
                  selectedLevel = level;
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
