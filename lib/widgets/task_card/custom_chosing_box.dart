import 'package:flutter/material.dart';

import '/common/app_color.dart';

class CustomChosingBox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final double size;
  const CustomChosingBox({
    super.key,
    required this.value,
    required this.onChanged,
    this.size = 23,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
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
        child: value
            ? Container(
                width: size - 2,
                height: size - 2,
                decoration: BoxDecoration(
                  color: value ? AppColor.gray : Colors.transparent,
                  borderRadius: BorderRadius.circular(90),
                ),
              )
            : null,
      ),
    );
  }
}
