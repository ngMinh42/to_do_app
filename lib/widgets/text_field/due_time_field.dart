import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'custom_text_field.dart';

class DueTimeField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<DateTime>? onChanged;
  final String? hintText;
  final Widget? suffixIcon;
  final TextStyle? style;
  const DueTimeField({
    super.key,
    required this.controller,
    this.onChanged,
    this.hintText,
    this.suffixIcon,
    this.style,
  });

  @override
  State<DueTimeField> createState() => _DueTimeFieldState();
}

class _DueTimeFieldState extends State<DueTimeField> {
  DateTime? dueAt;

  @override
  void initState() {
    super.initState();
    dueAt = DateTime.now().add(const Duration(hours: 24));
    widget.controller.text = DateFormat('d MMMM yyyy, hh:mm a').format(dueAt!);
    widget.onChanged?.call(dueAt!);
  }

  Future<void> selectDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: dueAt ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (date == null) return;
    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(dueAt ?? DateTime.now()),
    );
    if (time == null) return;
    if (!mounted) return;
    dueAt = DateTime(date.year, date.month, date.day, time.hour, time.minute);
    widget.controller.text = DateFormat('d MMMM yyyy, hh:mm a').format(dueAt!);
    widget.onChanged?.call(dueAt!);
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: widget.controller,
      hintText: widget.hintText,
      suffixIcon: widget.suffixIcon,
      style: widget.style,
      readOnly: true,
      onTap: selectDateTime,
    );
  }
}
