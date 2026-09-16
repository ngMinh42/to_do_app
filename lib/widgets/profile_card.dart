import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_app/common/app_assets.dart';
import 'package:to_do_app/common/app_color.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(22, 16, 18, 22),
      color: AppColor.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(AppAssets.avatar, height: 60, width: 60),
          SizedBox(width: 19),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: .start,
            children: [
              Text(
                'Nguyen Huu Hung',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
              Text(
                'dannamdinh49@gmail.com',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                  color: AppColor.gray,
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: null,
            icon: Image.asset(AppAssets.dropdownIcon),
          ),
        ],
      ),
    );
  }
}
