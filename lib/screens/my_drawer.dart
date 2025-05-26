import 'package:bloc_to_do_app/blocks/bloc_exports.dart';
import 'package:bloc_to_do_app/blocks/switch/switch_bloc.dart';
import 'package:bloc_to_do_app/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Tasks Drawer', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return ListTile(
                leading: Icon(Icons.folder_special_outlined),
                title: Text('My Tasks'),
                trailing: Text("${state.pendingTasks.length}|${state.completedTasks.length}", style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRouteName.taskList);
                },
              );
            },
          ),
          Divider(),
          BlocBuilder<TasksBloc, TasksState>(
            builder: (context, state) {
              return ListTile(
                leading: Icon(Icons.delete_outline),
                title: Text('Bin'),
                trailing: Text(state.removedTasks.length.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRouteName.recycleBin);
                },
              );
            },
          ),
          Divider(),
          BlocBuilder<SwitchBloc, SwitchState>(
            builder: (context, state) {
              return Switch(
                value: state.isSwitched,
                onChanged: (newValue) {
                  newValue ? context.read<SwitchBloc>().add(SwitchOnEvent()) : context.read<SwitchBloc>().add(SwitchOffEvent());
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
