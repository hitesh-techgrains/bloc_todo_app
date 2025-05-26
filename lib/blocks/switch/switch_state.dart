part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  final bool isSwitched;

  const SwitchState({this.isSwitched = false});

  @override
  List<Object?> get props => [isSwitched];

  Map<String, dynamic> toMap() {
    return {'isSwitched': isSwitched};
  }

  factory SwitchState.fromMap(Map<String, dynamic> map) {
    return SwitchState(isSwitched: map['isSwitched'] ?? false);
  }
}

class SwitchInitial extends SwitchState {
  const SwitchInitial({required bool isSwitched}) : super(isSwitched: false);
}
