//import 'dart:html';

import 'package:flutter/material.dart';

import '../../settings/settings_view.dart';
import '../../model/task/task.dart';
import './details.dart';

// class TaskListView extends StatefulWidget {
//   const TaskListView({ Key? key }) : super(key: key);

//   @override
//   _TaskListViewState createState() => _TaskListViewState();
// }

// class _TaskListViewState extends State<TaskListView> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(

//     );
//   }
// }
class TaskListView extends StatelessWidget {
  const TaskListView({
    Key? key,
    required this.items
  }) : super(key: key);

  static const routeName = '/tasks';
  final List<Task> items;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),

      body: ListView.builder(
        // Providing a restorationId allows the ListView to restore the
        // scroll position when a user leaves and returns to the app after it
        // has been killed while running in the background.
        restorationId: 'TaskListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
              title: Text(item.title),
              leading: const CircleAvatar(
                // Display the Flutter Logo image asset.
                foregroundImage: AssetImage('assets/images/flutter_logo.png'),
              ),
              onTap: () {
                // Navigate to the details page. If the user leaves and returns to
                // the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.pushNamed(
                  context,
                  "/tasks/${item.id}",
                    arguments: item.id
                );
              });
        },
      ),
    );
  }
}
