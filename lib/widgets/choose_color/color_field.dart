import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_color.dart';
import 'package:to_do_app/widgets/choose_color/color_circle.dart';

class ColorField extends StatefulWidget {
  final Color initialColor;
  final ValueChanged<Color>? onChanged;
  const ColorField({
    super.key,
    this.onChanged,
    this.initialColor = AppColor.yellow,
  });
  
  @override
  State<ColorField> createState() => _ColorFieldState();
}

class _ColorFieldState extends State<ColorField> {
  final List<Color> colors = [
    AppColor.yellow,
    AppColor.lightGreen,
    AppColor.cyan,
    AppColor.lightPurple,
    AppColor.pink,
    AppColor.orange,
    AppColor.bluePurple,
    AppColor.purple,
  ];
  late Color selectedColor = AppColor.yellow;

  @override
  void initState() {
    super.initState();
    selectedColor = widget.initialColor;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 7),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColor.lightGray, width: 1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: colors.map((color) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ColorCircle(
              color: color,
              isFocused: selectedColor == color,
              onTap: () {
                setState(() {
                  selectedColor = color;
                });
                widget.onChanged?.call(color);
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
