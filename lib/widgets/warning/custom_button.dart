import 'package:flutter/material.dart';
import '../../common/app_color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final Color borderColor;
  final Color textColor;
  const CustomButton({
    super.key,
    required this.text,
    this.onTap,
    this.borderColor = AppColor.black,
    this.textColor = AppColor.black,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: AppColor.white,
          border: Border.all(color: borderColor, width: 1.5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: AppColor.black,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.none,
            ),
          ),
        ),
      ),
    );
  }
}
