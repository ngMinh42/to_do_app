import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/app_bar/home_app_bar.dart';

import '../common/app_color.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final TextEditingController test = TextEditingController();

  @override
  void dispose() {
    test.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      body: Container(
        color: AppColor.white,
        padding: const EdgeInsets.all(20),
        child: TextField(controller: test),
      ),
    );
  }
}
