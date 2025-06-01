import 'package:bloc_to_do_app/screens/edit_task_screen.dart';
import 'package:bloc_to_do_app/widgets/pop_up_menu_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';

import '../blocks/tasks/tasks_bloc.dart';
import '../models/tasks.dart';

class TaskTileWidget extends StatelessWidget {
  const TaskTileWidget({super.key, required this.task});

  final Task task;

  void _removeOrDeleteTask(BuildContext context, Task task) {
    if (task.isDeleted!) {
      context.read<TasksBloc>().add(DeleteTaskEvent(task: task));
    } else {
      context.read<TasksBloc>().add(RemoveTaskEvent(task: task));
    }
  }

  void _editTask(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(child: EditTaskScreen(oldTask: task));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(task.isFavorite! ? Icons.star : Icons.star_outline),
                    TGView.emptySizedBox(width: 10),
                    Expanded(
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        task.title,
                        style: TextStyle(decoration: task.isDone! ? TextDecoration.lineThrough : TextDecoration.none, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                TGView.emptySizedBox(height: 5),
                Text(
                  overflow: TextOverflow.ellipsis,
                  DateFormat('MMM dd, yyyy hh:mm:ss').format(DateTime.parse(task.date)),
                  style: TextStyle(decoration: task.isDone! ? TextDecoration.lineThrough : TextDecoration.none, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                value: task.isDone,
                onChanged: (value) {
                  task.isDeleted! == false ? context.read<TasksBloc>().add(UpdateTaskEvent(task: task)) : null;
                },
              ),
              PopUpMenuWidget(
                likeOrDislikeCallback: () => context.read<TasksBloc>().add(MarkFavoriteOrUnFavoriteEvent(task: task)),
                cancelOrDeleteCallback: () => _removeOrDeleteTask(context, task),
                task: task,
                editTaskCallback: () => _editTask(context),
                restoreTaskCallback: () => context.read<TasksBloc>().add(RestoreTaskEvent(task: task)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
