import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_assets.dart';
import 'package:to_do_app/common/app_color.dart';
import '../../utils/dialog_utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isEdit;
  final VoidCallback? onDelete;
  const CustomAppBar({super.key, this.isEdit = false, this.onDelete});
  // hàm cảnh báo khi bấm back
  Future<void> _showWarning(BuildContext context) async {
    final shouldDiscard = await showDiscardDialog(context);
    if (shouldDiscard && context.mounted) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.white,
      // nút back
      leading: IconButton(
        onPressed: () {
          _showWarning(context);
        },
        icon: Image.asset(AppAssets.backIcon, width: 33, height: 33),
      ),
      // title
      title: Text(isEdit ? 'Edit Task' : 'Create Task'),
      // nút delete
      actions: [
        if (isEdit)
          IconButton(
            onPressed: onDelete,
            icon: Icon(Icons.delete_outline, size: 33, color: AppColor.red),
          ),
      ],
    );
  }

  @override
  // chiều cao = 56
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
