import 'package:bloc_to_do_app/blocks/bloc_exports.dart';
import 'package:bloc_to_do_app/models/tasks.dart';
import 'package:bloc_to_do_app/widgets/tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techgrains/com/techgrains/view/tg_text.dart';
import 'package:techgrains/com/techgrains/view/tg_view.dart';

class TasksScreen extends StatelessWidget {
  TasksScreen({super.key});

  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> taskList = state.allTasks;
        return Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(child: Chip(label: Text('Tasks:'))),
              TasksList(taskList: taskList),
            ],
          ),
          floatingActionButton: FloatingActionButton(onPressed: () => _addTask(context), tooltip: 'Add Task', child: const Icon(Icons.add)),
        );
      },
    );
  }

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: TGView.columnContainer(
              padding: EdgeInsets.all(20),
              children: [
                TGView.emptySizedBox(height: 10),
                TGText.withStyle("Add Task", TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                TGView.emptySizedBox(height: 20),
                TextField(
                  autofocus: true,
                  controller: taskController,
                  decoration: InputDecoration(border: const OutlineInputBorder(), labelText: 'Title', hintText: 'Enter title'),
                ),
                TGView.emptySizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(backgroundColor: Colors.red),
                        child: TGText.labelLarge("Cancel", color: Colors.white),
                      ),
                    ),
                    TGView.emptySizedBox(width: 10),
                    Expanded(
                      child: TextButton(
                        style: TextButton.styleFrom(backgroundColor: Colors.blue),
                        onPressed: () {
                          TGView.clearFocus(context);
                          if (taskController.text.isEmpty) return;
                          var task = Task(title: taskController.text);
                          context.read<TasksBloc>().add(AddTaskEvent(task: task));
                          Navigator.of(context).pop();
                        },
                        child: TGText.labelLarge("Add", color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
