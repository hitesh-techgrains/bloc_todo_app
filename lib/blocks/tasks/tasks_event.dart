part of 'tasks_bloc.dart';

class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object?> get props => [];
}

class AddTaskEvent extends TasksEvent {
  final Task task;

  const AddTaskEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

class UpdateTaskEvent extends TasksEvent {
  final Task task;

  const UpdateTaskEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

class DeleteTaskEvent extends TasksEvent {
  final Task task;

  const DeleteTaskEvent({required this.task});

  @override
  List<Object?> get props => [task];
}
