import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_color.dart';
import 'package:to_do_app/common/app_text_style.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final Widget? suffixIcon;
  final TextStyle? style;
  final bool readOnly;
  final VoidCallback? onTap;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.suffixIcon,
    this.style,
    this.readOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      cursorColor: AppColor.black,
      style: style == AppTextStyle.taskTitle()
          ? AppTextStyle.taskTitle()
          : AppTextStyle.taskDetail(),
      onTapOutside: (event) {
        FocusScope.of(context).unfocus();
      },
      onChanged: (value) {},
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: AppTextStyle.hintText(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.lightGray),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColor.lightGray),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
