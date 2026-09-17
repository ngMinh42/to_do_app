import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_assets.dart';
import 'package:to_do_app/common/app_color.dart';

class AddTaskButton extends StatelessWidget {
  final VoidCallback onPressed;
  const AddTaskButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.fromLTRB(24, 15, 28, 16)),
        backgroundColor: WidgetStatePropertyAll(AppColor.black),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppAssets.addTaskIcon),
          SizedBox(width: 10),
          Text(
            'Add Task',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.white,
            ),
          ),
        ],
      ),
    );
  }
}
