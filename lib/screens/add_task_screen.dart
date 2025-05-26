import 'package:bloc_to_do_app/models/tasks.dart';
import 'package:bloc_to_do_app/services/guid_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/view/tg_text.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';

import '../blocks/tasks/tasks_bloc.dart';

class AddTaskScreen extends StatelessWidget {
  TextEditingController taskController = TextEditingController();

  AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: TGView.columnContainer(
        padding: const EdgeInsets.all(20),
        children: [
          TGView.emptySizedBox(height: 10),
          TGText.withStyle("Add Task", const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TGView.emptySizedBox(height: 20),
          TextField(
            autofocus: true,
            controller: taskController,
            decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Title', hintText: 'Enter title'),
          ),
          TGView.emptySizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  child: TGText.labelLarge("Cancel", color: Colors.white),
                ),
              ),
              TGView.emptySizedBox(width: 10),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    TGLog.d("onPressed");
                    TGView.clearFocus(context);
                    if (taskController.text.isEmpty) return;
                    final task = Task(title: taskController.text, id: GUIDGen.generate());
                    context.read<TasksBloc>().add(AddTaskEvent(task: task));
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  child: TGText.labelLarge("Add", color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
