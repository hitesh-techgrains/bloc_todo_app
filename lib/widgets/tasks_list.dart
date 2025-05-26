import 'package:bloc_to_do_app/models/tasks.dart';
import 'package:bloc_to_do_app/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  final List<Task> taskList;

  const TasksList({super.key, required this.taskList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          var task = taskList[index];
          return ListTileWidget(task: task);
        },
      ),
    );
  }
}
