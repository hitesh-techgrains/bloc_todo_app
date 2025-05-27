import 'package:bloc_to_do_app/screens/add_task_screen.dart';
import 'package:bloc_to_do_app/screens/completed_tasks_screen.dart';
import 'package:bloc_to_do_app/screens/favorites_tasks_screen.dart';
import 'package:bloc_to_do_app/screens/my_drawer.dart';
import 'package:bloc_to_do_app/screens/pending_tasks_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, dynamic>> _pageDetails = const [
    {'title': 'Pending Tasks', 'pageName': PendingTasksScreen()},
    {'title': 'Completed Tasks', 'pageName': CompletedTasksScreen()},
    {'title': 'Favorite Tasks', 'pageName': FavoritesTasksScreen()},
  ];

  int _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      useSafeArea: true,
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(child: AddTaskScreen());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageDetails[_selectedPageIndex]['title'] as String),
        actions: [if (_selectedPageIndex == 0) IconButton(onPressed: () => _addTask(context), icon: const Icon(Icons.add))],
      ),
      drawer: MyDrawer(),
      body: _pageDetails[_selectedPageIndex]['pageName'] as Widget,
      floatingActionButton: _selectedPageIndex != 0
          ? null
          : FloatingActionButton(onPressed: () => _addTask(context), tooltip: 'Add Task', child: const Icon(Icons.add)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.incomplete_circle_outlined), label: 'Pending Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.done_outlined), label: 'Completed Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'Favorite Tasks'),
        ],
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
      ),
    );
  }
}
