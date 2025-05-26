import 'package:bloc_to_do_app/screens/my_drawer.dart';
import 'package:flutter/material.dart';

class RecycleBinScreen extends StatelessWidget {
  const RecycleBinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text('Recycle Bin'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Chip(label: Text('Tasks: 0'))), // Placeholder for task count
          Expanded(
            child: Center(
              child: Text('No tasks in the recycle bin yet.', style: TextStyle(fontSize: 18, color: Colors.grey)),
            ),
          ),
        ],
      ),
    );
  }
}
