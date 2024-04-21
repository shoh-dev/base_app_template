import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class CounterState extends Equatable {
  final int counter;

  const CounterState({
    required this.counter,
  });

  factory CounterState.initial() {
    return const CounterState(
      counter: 0,
    );
  }

  CounterState copyWith({
    int? counter,
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
  final int? counter;

  UpdateCounterStateAction({
    this.counter,
  });
}
