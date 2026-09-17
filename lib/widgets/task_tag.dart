import 'package:flutter/widgets.dart';
import 'package:to_do_app/common/app_color.dart';

class TaskTag extends StatelessWidget {
  final String content;
  const TaskTag({super.key, required this.content});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 6, 16, 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColor.gray),
      ),
      child: Text(
        content,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 13,
          color: AppColor.black,
        ),
      ),
    );
  }
}
