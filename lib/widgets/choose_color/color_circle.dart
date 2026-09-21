import 'package:flutter/material.dart';
import '../../common/app_color.dart';

class ColorCircle extends StatelessWidget {
  final bool isFocused;
  final Color color;
  final VoidCallback? onTap;
  const ColorCircle({
    super.key,
    required this.isFocused,
    required this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 17,
        height: 17,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: isFocused ? Border.all(color: AppColor.gray, width: 1) : null,
        ),
      ),
    );
  }
}
