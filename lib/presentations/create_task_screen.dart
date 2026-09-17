import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_assets.dart';
import 'package:to_do_app/common/app_color.dart';
import 'package:to_do_app/common/app_text_style.dart';
import 'package:to_do_app/data/database_helper.dart';
import 'package:to_do_app/models/task_level.dart';
import 'package:to_do_app/widgets/color_field.dart';
import 'package:to_do_app/widgets/custom_app_bar.dart';
import 'package:to_do_app/widgets/custom_text_field.dart';
import 'package:to_do_app/widgets/due_time_field.dart';
import 'package:to_do_app/widgets/level_field.dart';
import 'package:to_do_app/models/task.dart';

import '../models/task_level.dart';
import '../utils/task_utils.dart';
import '../widgets/save_task_button.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});
  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final titleController = TextEditingController();
  final timeController = TextEditingController();
  final placeController = TextEditingController();
  Color selectedColor = AppColor.yellow;
  TaskLevel selectedLevel = TaskLevel.levels[0];
  DateTime? selectedTime;

  @override
  void dispose() {
    titleController.dispose();
    timeController.dispose();
    placeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          Container(
            color: AppColor.white,
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Task Name', style: AppTextStyle.textFieldName()),
                CustomTextField(
                  controller: titleController,
                  style: AppTextStyle.taskTitle(),
                ),
                SizedBox(height: 22),
                Text('Color', style: AppTextStyle.textFieldName()),
                ColorField(
                  onChanged: (color) {
                    selectedColor = color;
                  },
                ),
                SizedBox(height: 22),
                Text('Due Time', style: AppTextStyle.textFieldName()),
                DueTimeField(
                  controller: timeController,
                  suffixIcon: Image.asset(AppAssets.time),
                  onChanged: (time) {
                    selectedTime = time;
                  },
                ),
                SizedBox(height: 22),
                Text('Place', style: AppTextStyle.textFieldName()),
                CustomTextField(
                  controller: placeController,
                  suffixIcon: Image.asset(AppAssets.place),
                ),
                SizedBox(height: 22),
                Text('Level', style: AppTextStyle.textFieldName()),
                SizedBox(height: 16),
                LevelField(
                  onChanged: (level) {
                    selectedLevel = level;
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Positioned(
              bottom: 34,
              left: 20,
              right: 24,
              child: Center(
                child: SaveTaskButton(
                  onPressed: () async {
                    await saveTask(
                      title: titleController.text.trim(),
                      color: selectedColor,
                      dueAt: selectedTime,
                      place: placeController.text.trim(),
                      level: selectedLevel,
                      status: 0,
                    );

                    if (!mounted) return;

                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
