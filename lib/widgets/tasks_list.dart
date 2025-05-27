import 'package:bloc_to_do_app/models/tasks.dart';
import 'package:bloc_to_do_app/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';

class TasksList extends StatelessWidget {
  final List<Task> taskList;

  const TasksList({super.key, required this.taskList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: ExpansionPanelList.radio(
          children: taskList.map((task) {
            return ExpansionPanelRadio(
              value: task.id,
              headerBuilder: (context, isExpanded) {
                return ListTileWidget(task: task);
              },
              body: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SelectableText.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Title:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' ${task.title}\n \n',
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                        const TextSpan(
                          text: 'Description:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' ${task.description}\n',
                          style: const TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// return Expanded(
// child: ListView.builder(
// itemCount: taskList.length,
// itemBuilder: (context, index) {
// var task = taskList[index];
// return ListTileWidget(task: task);
// },
// ),
// );
