import 'package:bloc_to_do_app/blocks/bloc_exports.dart';
import 'package:bloc_to_do_app/models/tasks.dart';
import 'package:bloc_to_do_app/screens/add_task_screen.dart';
import 'package:bloc_to_do_app/widgets/tasks_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techgrains/com/techgrains/common/tg_log.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TGLog.d("its rebuild");
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
              Center(child: Chip(label: Text('Tasks: ${taskList.length}'))),
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
        return SingleChildScrollView(child: AddTaskScreen());
      },
    );
  }
}
