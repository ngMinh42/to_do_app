import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_color.dart';

class BlankWarning extends StatelessWidget {
  final String title;
  final String? descrisption;
  const BlankWarning({super.key, required this.title, this.descrisption});
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
                        decoration: TextDecoration.none,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      descrisption ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                        color: AppColor.black,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
