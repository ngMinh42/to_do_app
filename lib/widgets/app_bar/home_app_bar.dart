import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/common/app_assets.dart';
import 'package:to_do_app/common/app_color.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.white,
      leading: IconButton(
        onPressed: null,
        icon: SvgPicture.asset(AppAssets.menuIcon, width: 41, height: 41),
      ),
      title: Text('Task Manager'),
      actions: [
        IconButton(
          onPressed: null,
          icon: SvgPicture.asset(
            AppAssets.notificationIcon,
            height: 41,
            width: 41,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
