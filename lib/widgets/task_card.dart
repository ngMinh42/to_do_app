import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/common/app_assets.dart';
import 'package:to_do_app/common/app_color.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/widgets/task_tag.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  const TaskCard({super.key, required this.task});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(23, 18, 16, 20),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    TaskTag(content: widget.task.level.title),
                    SizedBox(width: 9),
                    TaskTag(content: widget.task.place ?? ''),
                  ],
                ),
                SizedBox(height: 14),
                Text(
                  widget.task.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColor.black,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppAssets.calendar, height: 18, width: 18),
                    SizedBox(width: 8),
                    Text(
                      widget.task.dueAt != null
                          ? '${widget.task.dueAt!.day}/'
                                '${widget.task.dueAt!.month}/'
                                '${widget.task.dueAt!.year}'
                          : 'Chưa có ngày',
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(AppAssets.clock, height: 18, width: 18),
                    SizedBox(width: 8),
                    Text(
                      widget.task.dueAt != null
                          ? '${widget.task.dueAt!.hour.toString().padLeft(2, '0')}:'
                                '${widget.task.dueAt!.minute.toString().padLeft(2, '0')}'
                          : 'Chưa có giờ',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
