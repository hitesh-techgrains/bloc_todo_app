part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> pendingTasks;
  final List<Task> completedTasks;
  final List<Task> favoritesTasks;
  final List<Task> removedTasks;

  const TasksState({this.pendingTasks = const [], this.completedTasks = const [], this.favoritesTasks = const [], this.removedTasks = const []});

  @override
  List<Object> get props => [pendingTasks, removedTasks];

  Map<String, dynamic> toJson() {
    return {
      'pendingTasks': pendingTasks.map((task) => task.toMap()).toList(),
      'completedTasks': completedTasks.map((task) => task.toMap()).toList(),
      'favoritesTasks': favoritesTasks.map((task) => task.toMap()).toList(),
      'removedTasks': removedTasks.map((task) => task.toMap()).toList(),
    };
  }

  factory TasksState.fromJson(Map<String, dynamic> map) {
    return TasksState(
      pendingTasks: List<Task>.from(map['pendingTasks']?.map((task) => Task.fromMap(task)) ?? []),
      completedTasks: List<Task>.from(map['completedTasks']?.map((task) => Task.fromMap(task)) ?? []),
      favoritesTasks: List<Task>.from(map['favoritesTasks']?.map((task) => Task.fromMap(task)) ?? []),
      removedTasks: List<Task>.from(map['removedTasks']?.map((task) => Task.fromMap(task)) ?? []),
    );
  }
}
