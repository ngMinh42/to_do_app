import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_assets.dart';
import 'package:to_do_app/common/app_color.dart';
import 'package:to_do_app/common/app_text_style.dart';
import 'package:to_do_app/data/database_helper.dart';
import 'package:to_do_app/widgets/choose_color/color_field.dart';
import 'package:to_do_app/widgets/app_bar/custom_app_bar.dart';
import 'package:to_do_app/widgets/text_field/custom_text_field.dart';
import 'package:to_do_app/widgets/text_field/due_time_field.dart';
import 'package:to_do_app/widgets/chip_tab_level/level_field.dart';
import 'package:to_do_app/models/task.dart';

import '../utils/task_utils.dart';
import '../widgets/buttons/save_task_button.dart';

class EditTaskScreen extends StatefulWidget {
  final Task task;
  const EditTaskScreen({super.key, required this.task});
  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final titleController = TextEditingController();
  final timeController = TextEditingController();
  final placeController = TextEditingController();
  Color selectedColor = AppColor.yellow;
  String selectedLevel = 'Urgent';
  DateTime? selectedTime;

  @override
  void initState() {
    super.initState();
    titleController.text = widget.task.title;
    placeController.text = widget.task.place ?? '';
    selectedLevel = widget.task.level;
    selectedTime = widget.task.dueAt;
    selectedColor = widget.task.color ?? AppColor.yellow;
    // Hien thi due time cu
    if (selectedTime != null) {
      timeController.text =
          '${selectedTime!.hour.toString().padLeft(2, '0')}:'
          '${selectedTime!.minute.toString().padLeft(2, '0')}';
    }

    // Lay mau cu
    if (widget.task.color != null) {
      selectedColor = widget.task.color!;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    timeController.dispose();
    placeController.dispose();
    super.dispose();
  }

  Future<void> updateTask() async {
    final updatedTask = Task(
      id: widget.task.id,
      title: titleController.text.trim(),
      color: selectedColor,
      dueAt: selectedTime,
      place: placeController.text.trim(),
      level: selectedLevel,
      status: widget.task.status,
    );

    await DatabaseHelper.instance.updateTask(
      updatedTask.id!,
      updatedTask.toMap(),
    );
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
                  initialColor: selectedColor,
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
                  initialLevel: selectedLevel,
                  onChanged: (level) {
                    selectedLevel = level;
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 34,
            left: 20,
            right: 24,
            child: Center(
              child: SaveTaskButton(
                onPressed: () async {
                  if (titleController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Title không được để trống'),
                      ),
                    );
                    return;
                  }
                  await updateTask();
                  if (!mounted) return;
                  Navigator.pop(context, true);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
