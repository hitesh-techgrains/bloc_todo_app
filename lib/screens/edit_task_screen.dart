import 'package:bloc_to_do_app/models/tasks.dart';
import 'package:bloc_to_do_app/services/guid_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';
import 'package:techgrains/com/techgrains/view/tg_text.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';

import '../blocks/tasks/tasks_bloc.dart';

class EditTaskScreen extends StatelessWidget {
  final Task oldTask;

  EditTaskScreen({super.key, required this.oldTask});

  @override
  Widget build(BuildContext context) {
    TextEditingController taskController = TextEditingController(text: oldTask.title);
    TextEditingController descriptionController = TextEditingController(text: oldTask.description);

    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: TGView.columnContainer(
        padding: const EdgeInsets.all(20),
        children: [
          TGView.emptySizedBox(height: 10),
          TGText.withStyle("Edit Task", const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          TGView.emptySizedBox(height: 20),
          TextField(
            autofocus: true,
            controller: taskController,
            decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Title', hintText: 'Enter title'),
          ),
          TGView.emptySizedBox(height: 20),
          TextField(
            autofocus: true,
            controller: descriptionController,
            minLines: 3,
            maxLines: 5,
            decoration: const InputDecoration(border: OutlineInputBorder(), labelText: 'Description', hintText: 'Enter description'),
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
                    final editedTask = Task(
                      title: taskController.text,
                      description: descriptionController.text,
                      id: GUIDGen.generate(),
                      isDone: false,
                      date: oldTask.date,
                      isFavorite: oldTask.isFavorite,
                    );
                    context.read<TasksBloc>().add(EditTaskEvent(newTask: editedTask, oldTask: oldTask));
                    Navigator.of(context).pop();
                  },
                  style: TextButton.styleFrom(backgroundColor: Colors.blue),
                  child: TGText.labelLarge("Save", color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
