import 'package:flutter/material.dart';
import 'package:to_do_app/presentations/create_task_screen.dart';
import 'package:to_do_app/presentations/task_manager_screen.dart';
import 'package:to_do_app/widgets/task_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do App',
      theme: ThemeData(fontFamily: 'Arial'),
      home: TaskCard(),
    );
  }
}
