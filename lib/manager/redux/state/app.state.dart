import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';
import 'package:base_app_template/manager/redux/state/state.dart';

@immutable
class AppState extends Equatable {
  final CounterState counterState;

  const AppState({
    required this.counterState,
  });

  factory AppState.initial() {
    return AppState(
      counterState: CounterState.initial(),
    );
  }

  AppState copyWith({
    CounterState? counterState,
  }) {
    return AppState(
      counterState: counterState ?? this.counterState,
    );
  }

  @override
  List<Object> get props => [
        counterState,
      ];
}
