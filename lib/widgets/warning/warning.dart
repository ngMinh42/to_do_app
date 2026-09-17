import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:to_do_app/common/app_color.dart';
import 'package:to_do_app/widgets/warning/custom_button.dart';

class Warning extends StatelessWidget {
  final VoidCallback? onCancel;
  final VoidCallback? onAgree;
  final String title;
  final String? descrisption;
  final String agree;
  const Warning({
    super.key,
    required this.title,
    this.descrisption,
    required this.agree,
    this.onAgree,
    this.onCancel,
  });
  @override
  Widget build(BuildContext content) {
    return Align(
      alignment: AlignmentGeometry.topCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 240, 20, 20),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColor.white,
            border: Border.all(color: AppColor.black, width: 1.5),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 16,
                        color: AppColor.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      descrisption ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColor.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(text: 'Cancel', onTap: onCancel),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: CustomButton(
                      text: agree,
                      textColor: AppColor.red,
                      borderColor: AppColor.red,
                      onTap: onAgree,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
