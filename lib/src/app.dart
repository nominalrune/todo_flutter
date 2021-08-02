import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart'; //.dart_toolのpackage_config.jsonをいじったらよくなった。
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'package:todo_flutter/src/model/task/task.dart';
import 'package:todo_flutter/src/model/task/task_model.dart';

import 'package:todo_flutter/src/view/task/list.dart';
import 'package:todo_flutter/src/model/user/user.dart';
import 'package:todo_flutter/src/view/task/details.dart';
import 'package:todo_flutter/src/view/task/new.dart';
//import 'package:todo_flutter/src/view/task/update.dart;
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

import './utils/id_allocator.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;
  IdAllocator alloc = IdAllocator(0);
  List<Task> tasks = [
    Task(User("Kei"),1,"01title",description:"desc."),
    Task(User("Kei"),2,"02title",description:"desc2."),
    Task(User("Kei"),3,"03title",description:"desc3."),
    ];
    

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return ChangeNotifierProvider(
            create: (context) => TaskModel(alloc, tasks),
            child: MaterialApp(
              // Providing a restorationScopeId allows the Navigator built by the
              // MaterialApp to restore the navigation stack when a user leaves and
              // returns to the app after it has been killed while running in the
              // background.
              restorationScopeId: 'app',

              // Provide the generated AppLocalizations to the MaterialApp. This
              // allows descendant Widgets to display the correct translations
              // depending on the user's locale.
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('en', ''), // English, no country code
              ],


              home: TaskListView(items: tasks),
              onGenerateTitle: (BuildContext context) =>
                  AppLocalizations.of(context)!.appTitle,

              theme: ThemeData(),
              darkTheme: ThemeData.dark(),
              themeMode: settingsController.themeMode,

              onGenerateRoute: (RouteSettings routeSettings) {
                return MaterialPageRoute<void>(
                    settings: routeSettings,
                    builder: (BuildContext context) {
                      var r = routeSettings.name;
                      if (r == SettingsView.routeName) {
                        return SettingsView(controller: settingsController);
                      } else if (r is String &&
                          routeSettings.arguments is int &&
                          TaskDetailsView.isRouteToGo(r)) {
                        return TaskDetailsView(
                            (routeSettings.arguments as int));
                      } else //if (r== TaskListView.routeName)
                      {
                        return TaskListView(items: tasks);
                      }
                    });
              },
            ));
      },
    );
  }
}
