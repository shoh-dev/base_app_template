import 'package:base_app_template/manager/redux/result/redux_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class CounterState extends Equatable {
  final ReduxState<int> counter;

  const CounterState({
    required this.counter,
  });

  factory CounterState.initial() {
    return const CounterState(
      counter: ReduxInitialState(),
    );
  }

  CounterState copyWith({
    ReduxState<int>? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }

  @override
  List<Object> get props => [
        counter,
      ];
}

class UpdateCounterStateAction {
  final ReduxState<int>? counter;

  UpdateCounterStateAction({
    this.counter,
  });
}
