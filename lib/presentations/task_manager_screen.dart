import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_assets.dart';
import 'package:to_do_app/common/app_color.dart';
import 'package:to_do_app/widgets/add_task_button.dart';
import 'package:to_do_app/widgets/custom_app_bar.dart';
import 'package:to_do_app/widgets/custom_search_bar.dart';
import 'package:to_do_app/widgets/home_app_bar.dart';
import 'package:to_do_app/widgets/profile_card.dart';

import '../models/task.dart';
import '../utils/search_utils.dart';
import '../utils/task_utils.dart';

class TaskManagerScreen extends StatefulWidget {
  const TaskManagerScreen({super.key});
  @override
  State<TaskManagerScreen> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManagerScreen> {
  List<Task> tasks = [];
  List<Task> filteredTasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Stack(
        children: [
          Container(
            color: AppColor.white,
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CustomSearchBar(
                  onSearch: (keyword) {
                    setState(() {
                      filteredTasks = searchTasks(
                        tasks: tasks,
                        keyword: keyword,
                      );
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            child: Positioned(
              bottom: 34,
              left: 0,
              right: 0,
              child: Center(child: AddTaskButton()),
            ),
          ),
        ],
      ),
    );
  }
}
