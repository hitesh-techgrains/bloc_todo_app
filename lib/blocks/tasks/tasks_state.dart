part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTasks;

  const TasksState({this.allTasks = const []});

  @override
  List<Object> get props => [allTasks];

  Map<String, dynamic> toJson() {
    return {'allTasks': allTasks.map((task) => task.toMap()).toList()};
  }

  factory TasksState.fromJson(Map<String, dynamic> map) {
    return TasksState(allTasks: List<Task>.from(map['allTasks']?.map((task) => Task.fromMap(task)) ?? []));
  }
}
