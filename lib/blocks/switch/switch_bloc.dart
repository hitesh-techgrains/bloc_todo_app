import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'switch_event.dart';

part 'switch_state.dart';

class SwitchBloc extends HydratedBloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(SwitchInitial(isSwitched: false)) {
    on<SwitchOnEvent>((event, emit) {
      emit(SwitchState(isSwitched: true));
    });

    on<SwitchOffEvent>((event, emit) {
      emit(SwitchState(isSwitched: false));
    });
  }

  @override
  SwitchState? fromJson(Map<String, dynamic> json) {
    return SwitchState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(SwitchState state) {
    return state.toMap();
  }
}
