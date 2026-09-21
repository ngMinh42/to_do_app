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
        padding: EdgeInsets.all(3),
        width: 29,
        height: 29,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isFocused ? Border.all(color: AppColor.gray, width: 1) : null,
        ),
        child: Container(
          width: 23,
          height: 23,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}
