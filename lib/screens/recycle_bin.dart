import 'package:bloc_to_do_app/blocks/tasks/tasks_bloc.dart';
import 'package:bloc_to_do_app/screens/my_drawer.dart';
import 'package:bloc_to_do_app/widgets/tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/tasks.dart' show Task;

class RecycleBinScreen extends StatelessWidget {
  const RecycleBinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> removedTaskList = state.removedTasks;
        return Scaffold(
          resizeToAvoidBottomInset: true,
          drawer: MyDrawer(),
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    onTap: () => context.read<TasksBloc>().add(const DeleteAllTasksEvent()),
                    child: TextButton.icon(onPressed: null, label: const Text('Delete all tasks'), icon: const Icon(Icons.delete_forever_outlined)),
                  ),
                ],
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(child: Chip(label: Text('Tasks: ${removedTaskList.length}'))),
              TasksList(taskList: removedTaskList),
            ],
          ),
        );
      },
    );
  }
}
