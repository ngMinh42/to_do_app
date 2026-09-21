import 'package:flutter/material.dart';
import '../widgets/warning/warning.dart';

Future<bool> showDeleteDialog(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return Warning(
        title: 'Delete task?',
        descrisption: 'This task will be permanently deleted.',
        agree: 'Delete',
        onCancel: () {
          Navigator.pop(dialogContext, false);
        },
        onAgree: () {
          Navigator.pop(dialogContext, true);
        },
      );
    },
  );
  return result ?? false;
}

Future<bool> showCompleteDialog(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return Warning(
        title: 'Complete task?',
        descrisption: 'This task will be marked as completed.',
        agree: 'Complete',
        onCancel: () {
          Navigator.pop(dialogContext, false);
        },
        onAgree: () {
          Navigator.pop(dialogContext, true);
        },
      );
    },
  );
  return result ?? false;
}

Future<bool> showDiscardDialog(BuildContext context) async {
  final result = await showDialog<bool>(
    context: context,
    barrierDismissible: false,
    builder: (dialogContext) {
      return Warning(
        title: 'Discard task?',
        descrisption: 'Your task will not be saved.',
        agree: 'Discard',
        onCancel: () {
          Navigator.pop(dialogContext, false);
        },
        onAgree: () {
          Navigator.pop(dialogContext, true);
        },
      );
    },
  );
  return result ?? false;
}
