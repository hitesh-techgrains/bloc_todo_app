import 'package:bloc/bloc.dart';
import 'package:bloc_to_do_app/models/tasks.dart';
import 'package:equatable/equatable.dart';

part 'tasks_event.dart';

part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksState()) {
    on<AddTaskEvent>(_onAddTask);
    on<UpdateTaskEvent>(_onUpdateTask);
    on<DeleteTaskEvent>(_onDeleteTask);
  }

  void _onAddTask(AddTaskEvent event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(allTasks: List.from(state.allTasks)..add(event.task)));
  }

  void _onUpdateTask(UpdateTaskEvent event, Emitter<TasksState> emit) {}

  void _onDeleteTask(DeleteTaskEvent event, Emitter<TasksState> emit) {}
}
