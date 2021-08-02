import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/task/task_model.dart';
import '../../model/task/task.dart';
import '../../model/group/group.dart';
import '../../model/user/user.dart';
import '../../utils/id_allocator.dart';
/// routes
import './list.dart';
import './details.dart';

/// Displays detailed information about a Task.
class TaskMeta extends StatelessWidget {
  // TaskView({Key? key}) : super(key: key);

  IdAllocator alloc=IdAllocator(0);
  
  List<Task> get tasks{ //TODO somehow get tasks.
    return [];
  }
  static bool isTaskRelatedRoute(String route) {
    return RegExp(r"/tasks(/\d)*").hasMatch(route);
  }
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
		create: (context)=> TaskModel(alloc, tasks),
		child: TaskListView(items: tasks) 
	);
  }
}
