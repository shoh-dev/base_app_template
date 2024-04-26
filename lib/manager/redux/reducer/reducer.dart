import 'package:redux/redux.dart';
import 'package:base_app_template/manager/redux/state/state.dart';

AppState appReducer(AppState state, dynamic action) {
  var newState = state.copyWith(
    counterState: _counterReducer(state.counterState, action),
  );

  return newState;
}

///
/// Counter Reducer
///
final _counterReducer = combineReducers<CounterState>([
  TypedReducer<CounterState, UpdateCounterStateAction>(_updateCounterState).call
]);

CounterState _updateCounterState(
    CounterState state, UpdateCounterStateAction action) {
  return state.copyWith(
    counter: action.counter ?? state.counter,
  );
}
