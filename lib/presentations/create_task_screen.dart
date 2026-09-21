import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_assets.dart';
import 'package:to_do_app/common/app_color.dart';
import 'package:to_do_app/common/app_text_style.dart';
import 'package:to_do_app/widgets/choose_color/color_field.dart';
import 'package:to_do_app/widgets/app_bar/custom_app_bar.dart';
import 'package:to_do_app/widgets/text_field/custom_text_field.dart';
import 'package:to_do_app/widgets/text_field/due_time_field.dart';
import 'package:to_do_app/widgets/chip_tab_level/level_field.dart';
import 'package:to_do_app/widgets/warning/blank_warning.dart';
import '../utils/task_utils.dart';
import '../widgets/buttons/save_task_button.dart';

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
  String selectedLevel = 'Urgent';
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
    double mediaBottom = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: AppColor.white,
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ô title
                    Text('Task Name', style: AppTextStyle.textFieldName()),
                    CustomTextField(
                      controller: titleController,
                      style: AppTextStyle.taskTitle(),
                    ),
                    SizedBox(height: 22),
                    // ô color
                    Text('Color', style: AppTextStyle.textFieldName()),
                    ColorField(
                      onChanged: (color) {
                        selectedColor = color;
                      },
                    ),
                    SizedBox(height: 22),
                    // ô time
                    Text('Due Time', style: AppTextStyle.textFieldName()),
                    DueTimeField(
                      controller: timeController,
                      suffixIcon: Image.asset(AppAssets.time),
                      onChanged: (time) {
                        selectedTime = time;
                      },
                    ),
                    SizedBox(height: 22),
                    //ô place
                    Text('Place', style: AppTextStyle.textFieldName()),
                    CustomTextField(
                      controller: placeController,
                      suffixIcon: Image.asset(AppAssets.place),
                    ),
                    SizedBox(height: 22),
                    Text('Level', style: AppTextStyle.textFieldName()),
                    SizedBox(height: 16),
                    // ô level
                    LevelField(
                      onChanged: (level) {
                        selectedLevel = level;
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          // nút save task
          Positioned(
            bottom: mediaBottom + 34,
            left: 20,
            right: 24,
            child: Center(
              child: SaveTaskButton(
                onPressed: () async {
                  if (titleController.text.trim().isEmpty) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return BlankWarning(
                          title: 'Invalid title',
                          descrisption: 'Title không được để trống',
                        );
                      },
                    );
                    return;
                  }
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
        ],
      ),
    );
  }
}
