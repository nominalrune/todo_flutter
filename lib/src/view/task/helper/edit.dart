import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../model/task/task_model.dart';
import '../../../model/task/task.dart';
import '../../../model/group/group.dart';
import '../../../model/user/user.dart';
import '../../../utils/id_allocator.dart';

  abstract class Touple<T,U> with List{
    
  }
/// Displays detailed information about a Task.
class TaskDetailsEditView extends StatelessWidget {
  TaskDetailsEditView(final this.task, {Key? key});
  Task task;
  var formItem =[
    [String, "title"],
    [User, "creator"],
    [User, "assignee"],
    [Group, "accessGroup"],
    [String, "description"],
    [String, "type"],
    [String, "importance"],
    [String, "placement"],
    [double, "estimatedHour"],
    [DateTime, "startAt"],
    [DateTime, "finishAt"],
    [DateTime, "due"],
    [DateTime, "startedAt"],
    [DateTime, "finishedAt"],
  ];
  // Widget buildList(Task task){
  //   return ListView(
  //     children: (BuildContext context)
  //     {
  //       final item = items[index];
  //       return ListTile(
  //             title: TextFormField(
  //         decoration: const InputDecoration(
  //           hintText: 'formItem.',
  //         ),
  //         validator: (String? value) {
  //           if (value == null || value.isEmpty) {
  //             return 'Please enter some text';
  //           }
  //           return null;
  //         },
  //       ),)
  // }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(
            hintText: 'Enter your email',
          ),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: ElevatedButton(
            onPressed: () {
              // Validate will return true if the form is valid, or false if
              // the form is invalid.
            },
            child: const Text('Submit'),
          ),
        ),
      ],
    );
  }
}

class titleForm extends StatelessWidget {
  const titleForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
