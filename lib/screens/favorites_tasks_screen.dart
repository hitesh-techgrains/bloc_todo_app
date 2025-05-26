import 'package:bloc_to_do_app/blocks/bloc_exports.dart';
import 'package:bloc_to_do_app/models/tasks.dart';
import 'package:bloc_to_do_app/widgets/tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';

class FavoritesTasksScreen extends StatelessWidget {
  const FavoritesTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TGLog.d("its rebuild");
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.favoritesTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Chip(label: Text('Tasks: ${taskList.length}'))),
            TasksList(taskList: taskList),
          ],
        );
      },
    );
  }
}
