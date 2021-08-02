import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/src/view/task/helper/edit.dart';

import '../../model/task/task_model.dart';
import '../../model/task/task.dart';
import '../../model/group/group.dart';
import '../../model/user/user.dart';
import '../../utils/id_allocator.dart';

String neighboring = "Neighboring";

/// Displays detailed information about a Task.
class TaskDetailsView extends StatefulWidget {
  TaskDetailsView(final this.id, {Key? key}) : super(key: key);
  final int id;
  late final String routeName = '/tasks/$id';
  static bool isRouteToGo(String routeName) {
    return RegExp(r"/tasks/\d+").hasMatch(routeName);
  }

  @override
  _TaskDetailsViewState createState() => _TaskDetailsViewState();
}

/// FormState; not taskList's state.
class _TaskDetailsViewState extends State<TaskDetailsView> {
  late String title;
  String? description;
  User? assignee;
  Group? accessGroup;
  String? type;
  String? importance;
  String? placement;
  double? estimatedHour;
  DateTime? startAt;
  DateTime? finishAt;
  DateTime? due;
  DateTime? startedAt;
  DateTime? finishedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskModel>(builder: (context, taskModel, child) {
      Task _task = taskModel.get(widget.id); // StatefulWidget's param: int id;
      title = _task.title;
      description = _task.description;
      assignee = _task.assignee;
      accessGroup = _task.accessGroup;
      type = _task.type;
      importance = _task.importance;
      placement = _task.placement;
      estimatedHour = _task.estimatedHour;
      startAt = _task.startAt;
      finishAt = _task.finishAt;
      due = _task.due;
      startedAt = _task.startedAt;
      finishedAt = _task.finishedAt;
      print(
          "debug: TaskDetailsView: id:${_task.id}, title:${_task.title}, description:${_task.description}");

      final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
      return Scaffold(
          appBar: AppBar(
            title: Text(_task.title),
          ),
          body: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            // onChanged: () {
            //   Form.of(this.context)!.save();
            // },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  /// title
                  key: ValueKey("title_${widget.id}"),
                  initialValue: _task.title,
                  decoration: const InputDecoration(
                    hintText: 'title',
                  ),
                  onChanged: (String? value) {
                    title = value ?? _task.title;
                  },
                ),
                TextFormField(

                    /// description
                    key: ValueKey("description_${widget.id}"),
                    decoration: const InputDecoration(
                      hintText: 'description',
                    ),
                    initialValue: _task.description,
                    // validator: (String? value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter some text';
                    //   }
                    //   return null;
                    // },
                    onChanged: (String? value) {
                      print("debug: value:$value");
                      description = value ?? _task.description;
                      print("debug:description:$description");
                    }),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      print(
                          "debug: form submitted to save task state. ${_task.title}, ${_task.description}");
                      taskModel.update(widget.id,
                          {"title": title, "description": description});
                    },
                    child: const Text('Submit'),
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
// class TaskDetailsState extends State<TaskDetailsView> {
//   TaskDetailsState(final this.id, {Key? key}):super(key: key);
//   final int id;
//   late final String routeName= '/tasks/$id';
//   static bool isRouteToGo(String routeName) {
//     return RegExp(r"/tasks/\d+").hasMatch(routeName);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<TaskModel>(builder: (context, taskModel, child) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text(taskModel.get(id).title),
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             TextFormField( /// title
//               key:ValueKey("title_$id"),
//               decoration: const InputDecoration(
//                 hintText: 'title',
//               ),
//               validator: (String? value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter some text';
//                 }
//                 return null;
//               },
//             ),
//             TextFormField( /// description
//               key:ValueKey("description_$id"),
//               decoration: const InputDecoration(
//                 hintText: 'description',
//               ),
//               validator: (String? value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter some text';
//                 }
//                 return null;
//               },
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 16.0),
//               child: ElevatedButton(
//                 onPressed: () {
//                   taskModel.get(id).update({details:})
//                 },
//                 child: const Text('Submit'),
//               ),
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
