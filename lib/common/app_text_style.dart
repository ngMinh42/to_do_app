import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_color.dart';

class AppTextStyle {
  static TextStyle textFieldName() {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w500,
      color: AppColor.gray,
    );
  }

  static TextStyle hintText() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: AppColor.gray,
    );
  }

  static TextStyle taskTitle() {
    return TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.w700,
      color: AppColor.black,
    );
  }

  static TextStyle taskDetail() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: AppColor.black,
    );
  }
}
