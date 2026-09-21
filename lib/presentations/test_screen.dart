import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/app_bar/home_app_bar.dart';
import 'package:to_do_app/widgets/task_card/task_card.dart';
import 'package:to_do_app/widgets/warning/warning.dart';

import '../common/app_color.dart';
import '../models/task.dart';
import '../widgets/app_bar/custom_app_bar.dart';
import '../widgets/task_card/custom_finish_box.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});
  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Stack(
        children: [
          Container(
            color: AppColor.white,
            padding: EdgeInsets.all(20),
            child: (Warning(
              title: 'Log out',
              descrisption: 'Are you sure you want to log out? You\'ll need to login again to use the app.',
              agree: 'Log out',
            )),
          ),
        ],
      ),
    );
  }
}
