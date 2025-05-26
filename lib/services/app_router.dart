import 'package:bloc_to_do_app/common/constants.dart';
import 'package:bloc_to_do_app/screens/recycle_bin.dart';
import 'package:bloc_to_do_app/screens/tabs_screen.dart';
import 'package:bloc_to_do_app/screens/pending_tasks_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.taskList:
        return MaterialPageRoute(builder: (_) => const PendingTasksScreen());
      case AppRouteName.recycleBin:
        return MaterialPageRoute(builder: (_) => const RecycleBinScreen());
      case AppRouteName.tabs:
        return MaterialPageRoute(builder: (_) => TabsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(body: Center(child: Text('No route defined for ${settings.name}'))),
        );
    }
  }
}
