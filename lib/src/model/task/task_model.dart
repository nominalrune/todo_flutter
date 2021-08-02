import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/src/utils/id_allocator.dart';

import '../group/group.dart';
import '../user/user.dart';
import './task.dart';

class TaskModel extends ChangeNotifier {
  TaskModel(this._alloc, this._tasks);
  final IdAllocator _alloc;
  List<Task> _tasks;
  List<Task> get tasks => _tasks;
  Task create(User creator, String title,
      {String? description,
      User? assignee,
      Group? accessGroup,
      String? placement,
      double? estimatedHour,
      String? type,
      DateTime? due,
      DateTime? startAt,
      DateTime? finishAt,
      DateTime? startedAt,
      DateTime? finishedAt,
      DateTime? createdAt,
      DateTime? updatedAt}) {
    return addToList(Task(creator, _alloc.next, title,
        description: description,
        assignee: assignee,
        accessGroup: accessGroup,
        placement: placement,
        estimatedHour: estimatedHour,
        type: type,
        due: due,
        startAt: startAt,
        finishAt: finishAt,
        startedAt: startedAt,
        finishedAt: finishedAt,
        createdAt: createdAt,
        updatedAt: updatedAt))[_tasks.length - 1];
  }

  Task get(int id) {
    Task task = _tasks.firstWhere((item) => item.id == id, orElse: () {
      throw Exception("task with given ID not exist");
    });
    return task;
  }

  Task update(int id, Map<String,dynamic> props) {
    Task task = get(id);
    task.update(title:props["title"],description:props["description"]);
    print("debug: TaskModel's update func called. and then notify. ${task.title}, ${task.description}");
    notifyListeners();
    return task;
  }

  List<Task> addToList(Task newTask) {
    _tasks.add(newTask);
    notifyListeners();
    return _tasks;
  }
}
