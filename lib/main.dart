import 'dart:async' as BlocOverrides;

import 'package:bloc_to_do_app/blocks/tasks/tasks_bloc.dart';
import 'package:bloc_to_do_app/models/tasks.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/tasks_screen.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksBloc()..add(AddTaskEvent(task: Task(title: 'Task 1', isDone: false))),
      child: MaterialApp(
        title: 'Flutter Tasks App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: TasksScreen(),
      ),
    );
  }
}
