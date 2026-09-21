import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_color.dart';

class TabChip extends StatelessWidget {
  final String title;
  final bool isFocused;
  final VoidCallback onTap;
  const TabChip({
    super.key,
    required this.title,
    required this.isFocused,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          color: isFocused ? AppColor.black : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: isFocused ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
