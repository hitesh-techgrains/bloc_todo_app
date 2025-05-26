import 'package:bloc_to_do_app/models/tasks.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksState()) {
    on<AddTaskEvent>(_onAddTask);
    on<UpdateTaskEvent>(_onUpdateTask);
    on<DeleteTaskEvent>(_onDeleteTask);
    on<RemoveTaskEvent>(_onRemoveTask);
  }

  void _onAddTask(AddTaskEvent event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        pendingTasks: List.from(state.pendingTasks)..add(event.task),
        completedTasks: List.from(state.completedTasks),
        favoritesTasks: List.from(state.favoritesTasks),
        removedTasks: state.removedTasks,
      ),
    );
  }

  void _onUpdateTask(UpdateTaskEvent event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.task;

    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    task.isDone == false
        ? {pendingTasks = List.from(pendingTasks)..remove(task), completedTasks = List.from(completedTasks)..insert(0, task.copyWith(isDone: true))}
        : {completedTasks = List.from(completedTasks)..remove(task), pendingTasks = List.from(pendingTasks)..insert(0, task.copyWith(isDone: false))};
    emit(
      TasksState(pendingTasks: pendingTasks, completedTasks: completedTasks, favoritesTasks: state.favoritesTasks, removedTasks: state.removedTasks),
    );
  }

  void _onDeleteTask(DeleteTaskEvent event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favoritesTasks: state.favoritesTasks,
        removedTasks: List.from(state.removedTasks)..remove(event.task),
      ),
    );
  }

  void _onRemoveTask(RemoveTaskEvent event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        completedTasks: List.from(state.completedTasks)..remove(event.task),
        favoritesTasks: List.from(state.favoritesTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)..add(event.task.copyWith(isDeleted: true)),
      ),
    );
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toJson();
  }
}
