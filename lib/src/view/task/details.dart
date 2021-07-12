import 'package:flutter/material.dart';

import '../../model/task/task.dart';

/// Displays detailed information about a Task.
class TaskDetailsView extends StatelessWidget {
  const TaskDetailsView({Key? key, required this.task}) : super(key: key);

  static const routeName = this.task.title;
  final Task task;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
      ),
      body: Center(
        child: TextFormField(initialValue:'More Information Here'),
      ),
    );
  }
}
