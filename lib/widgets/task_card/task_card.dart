import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/common/app_assets.dart';
import 'package:to_do_app/common/app_color.dart';
import 'package:to_do_app/models/task.dart';
import 'package:to_do_app/widgets/task_card/task_tag.dart';
import '../../common/app_text_style.dart';
import '../../presentations/edit_task_screen.dart';
import '../../utils/dialog_utils.dart';
import '../../utils/task_status.dart';
import '../../utils/task_utils.dart';
import 'custom_finish_box.dart';

class TaskCard extends StatefulWidget {
  final Task task;
  final Future<void> Function() onTaskUpdate;
  const TaskCard({super.key, required this.task, required this.onTaskUpdate});
  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    final overdue = isOverdue(
      dueAt: widget.task.dueAt,
      status: widget.task.status,
    );
    final textColor = overdue ? AppColor.red : AppColor.black;
    // vuốt để xóa
    return Dismissible(
      key: ValueKey(widget.task.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) async {
        final shouldDelete = await showDeleteDialog(context);
        if (shouldDelete) {
          await deleteTask(widget.task);
          await widget.onTaskUpdate();
        }
        return shouldDelete;
      },
      // nút xóa
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: AppColor.red,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Icons.delete_outline, color: Colors.white, size: 30),
      ),
      // task card
      child: Container(
        decoration: BoxDecoration(
          color: widget.task.color,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.fromLTRB(23, 18, 16, 20),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      // 2 tag level và place
                      Flexible(child: TaskTag(content: widget.task.level)),
                      SizedBox(width: 9),
                      Flexible(
                        child: TaskTag(content: widget.task.place ?? ''),
                      ),
                    ],
                  ),
                  SizedBox(height: 14),
                  // title
                  Text(
                    widget.task.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: textColor,
                      fontSize: 20,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  if (widget.task.status != 1) SizedBox(height: 14),
                  // ngày
                  if (widget.task.status != 1)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          AppAssets.calendar,
                          height: 18,
                          width: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          widget.task.dueAt != null
                              ? '${widget.task.dueAt!.day}/'
                                    '${widget.task.dueAt!.month}/'
                                    '${widget.task.dueAt!.year}'
                              : 'Chưa có ngày',
                          style: AppTextStyle.taskCardDetail().copyWith(
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                  if (widget.task.status != 1) SizedBox(height: 14),
                  // giờ
                  if (widget.task.status != 1)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SvgPicture.asset(
                          AppAssets.clock,
                          height: 18,
                          width: 18,
                        ),
                        SizedBox(width: 8),
                        Text(
                          widget.task.dueAt != null
                              ? '${widget.task.dueAt!.hour.toString().padLeft(2, '0')}:'
                                    '${widget.task.dueAt!.minute.toString().padLeft(2, '0')}'
                              : 'Chưa có giờ',
                          style: AppTextStyle.taskCardDetail().copyWith(
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
            // nút edit
            if (widget.task.status != 1)
              Positioned(
                top: -10,
                right: -10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditTaskScreen(task: widget.task),
                          ),
                        );
                        if (result == true) {
                          await widget.onTaskUpdate();
                        }
                      },
                      icon: SvgPicture.asset(
                        AppAssets.edit,
                        width: 23,
                        height: 23,
                      ),
                    ),
                  ],
                ),
              ),
            // nút hoàn thành
            if (widget.task.status != 1)
              Positioned(
                right: 0,
                bottom: 0,
                child: CustomFinishBox(
                  value: widget.task.status == 1,
                  onChanged: (value) async {
                    if (value) {
                      await completeTask(widget.task);
                      await widget.onTaskUpdate();
                    }
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
