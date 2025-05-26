import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocks/tasks/tasks_bloc.dart';
import '../models/tasks.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key, required this.task});

  final Task task;

  void _removeOrDeleteTask(BuildContext context, Task task) {
    if (task.isDeleted!) {
      context.read<TasksBloc>().add(DeleteTaskEvent(task: task));
    } else {
      context.read<TasksBloc>().add(RemoveTaskEvent(task: task));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(task.title, style: TextStyle(decoration: task.isDone! ? TextDecoration.lineThrough : TextDecoration.none)),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: (value) {
          task.isDeleted! == false ? context.read<TasksBloc>().add(UpdateTaskEvent(task: task)) : null;
        },
      ),
      onLongPress: () => _removeOrDeleteTask(context, task),
    );
  }
}
