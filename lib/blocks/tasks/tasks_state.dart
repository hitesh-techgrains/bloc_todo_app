part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;
  final List<Task> removedTasks;

  const TasksState({this.allTasks = const [], this.removedTasks = const []});

  @override
  List<Object> get props => [allTasks, removedTasks];

  Map<String, dynamic> toJson() {
    return {'allTasks': allTasks.map((task) => task.toMap()).toList(), 'removedTasks': removedTasks.map((task) => task.toMap()).toList()};
  }

  factory TasksState.fromJson(Map<String, dynamic> map) {
    return TasksState(
      allTasks: List<Task>.from(map['allTasks']?.map((task) => Task.fromMap(task)) ?? []),
      removedTasks: List<Task>.from(map['removedTasks']?.map((task) => Task.fromMap(task)) ?? []),
    );
  }
}
