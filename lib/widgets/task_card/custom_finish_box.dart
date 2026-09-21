import 'package:flutter/material.dart';
import '../warning/warning.dart';
import '/common/app_color.dart';

class CustomFinishBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double size;
  const CustomFinishBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 23,
  });
  // cảnh báo khi bấm hoàn thành
  void _showCompleteWarning(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return Warning(
          title: 'Complete task?',
          descrisption: 'Are you sure you want to complete this task?',
          agree: 'Complete',
          onCancel: () {
            Navigator.pop(context);
          },
          onAgree: () {
            Navigator.pop(context);
            onChanged(true);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (!value) {
          _showCompleteWarning(context);
        }
      },
      borderRadius: BorderRadius.circular(90),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: AppColor.black, width: 2),
          borderRadius: BorderRadius.circular(90),
        ),
      ),
    );
  }
}
