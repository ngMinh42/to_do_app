import 'package:flutter/material.dart';
import 'package:to_do_app/common/app_color.dart';
import 'package:to_do_app/presentations/create_task_screen.dart';
import 'package:to_do_app/widgets/buttons/add_task_button.dart';
import 'package:to_do_app/widgets/text_field/custom_search_bar.dart';
import 'package:to_do_app/widgets/app_bar/home_app_bar.dart';
import 'package:to_do_app/widgets/chip_tab_level/tab_field.dart';
import '../data/database_helper.dart';
import '../models/task.dart';
import '../utils/search_utils.dart';
import '../utils/task_status.dart';
import '../widgets/task_card/task_card.dart';

class TaskManagerScreen extends StatefulWidget {
  const TaskManagerScreen({super.key});
  @override
  State<TaskManagerScreen> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManagerScreen> {
  List<Task> tasks = [];
  TaskStatus selectedStatus = TaskStatus.today;
  // lọc task theo status và tìm kiếm
  String searchKeyword = '';
  List<Task> get filteredTasks {
    final searchedTasks = searchTasks(tasks: tasks, keyword: searchKeyword);
    return searchedTasks.where((task) {
      return getTaskStatus(dueAt: task.dueAt, status: task.status) ==
          selectedStatus;
    }).toList();
  }
  //logic load lại danh sách task ở trang manager
  Future<void> loadTasks() async {
    final data = await DatabaseHelper.instance.getTasks();
    setState(() {
      tasks = data.map((map) => Task.fromMap(map)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

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
                // thanh search bar
                CustomSearchBar(
                  onSearch: (keyword) {
                    setState(() {
                      searchKeyword = keyword;
                    });
                  },
                ),
                SizedBox(height: 20),
                // các ô tab
                TabField(
                  selectedStatus: selectedStatus,
                  onStatusChanged: (status) {
                    setState(() {
                      selectedStatus = status;
                    });
                  },
                ),
                SizedBox(height: 25),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: loadTasks,
                    // danh sách task
                    child: ListView.separated(
                      itemCount: filteredTasks.length,
                      itemBuilder: (context, index) {
                        final task = filteredTasks[index];
                        return TaskCard(task: task, onTaskUpdate: loadTasks);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 23);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // nút thêm task
          Positioned(
            bottom: 34,
            left: 0,
            right: 0,
            child: Center(
              child: AddTaskButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateTaskScreen(),
                    ),
                  );
                  await loadTasks();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
