import 'package:bloc_to_do_app/models/tasks.dart';
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
          return ListTile(
            title: Text(task.title),
            trailing: Checkbox(
              value: task.isDone,
              onChanged: null, // Disabled checkbox
            ),
          );
        },
      ),
    );
  }
}
