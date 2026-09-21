import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/widgets/text_field/custom_text_field.dart';

import '../../common/app_assets.dart';
import '../../common/app_color.dart';

class CustomSearchBar extends StatefulWidget {
  final ValueChanged<String>? onSearch;
  const CustomSearchBar({super.key, this.onSearch});

  @override
  State<CustomSearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<CustomSearchBar> {
  bool isEditing = false;
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void dispose() {
    controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isEditing
        ? TextField(
            controller: controller,
            focusNode: focusNode,
            onChanged: (value) {
              widget.onSearch?.call(value);
            },
            autofocus: true,
            onTapOutside: (event) {
              focusNode.unfocus();
              setState(() {
                isEditing = false;
              });
            },
            style: TextStyle(
              color: AppColor.white,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.black,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: AppColor.white, width: 1),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  controller.clear();
                  widget.onSearch?.call('');
                },
                icon: SvgPicture.asset(
                  AppAssets.deleteText,
                  width: 20,
                  height: 20,
                ),
              ),
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: AppColor.black,
                    ),
                  ),
                  SizedBox(height: 13),
                  Text(
                    'Here\' Update Today',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: AppColor.black,
                    ),
                  ),
                ],
              ),

              IconButton(
                onPressed: () {
                  setState(() {
                    isEditing = true;
                  });
                },
                icon: Image.asset(AppAssets.search, height: 50, width: 50),
              ),
            ],
          );
  }
}
