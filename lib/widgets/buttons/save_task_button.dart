import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_assets.dart';
import 'package:to_do_app/common/app_color.dart';

class SaveTaskButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const SaveTaskButton({super.key, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all(EdgeInsets.only(top: 14, bottom: 16)),
        backgroundColor: WidgetStatePropertyAll(AppColor.black),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Save Task',
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
