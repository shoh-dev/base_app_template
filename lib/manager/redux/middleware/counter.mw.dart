import 'package:base_app_template/manager/redux/result/redux_state.dart';
import 'package:redux/redux.dart';
import 'package:base_app_template/manager/redux/action/action.dart';
import 'package:base_app_template/manager/redux/state/state.dart';
import 'package:base_app_template/manager/response_handler/handle_exception.dart';
import 'package:base_app_template/manager/response_handler/result.dart';
import 'package:either_dart/either.dart';

class IncrementAction extends ReduxAction<int> {
  const IncrementAction({super.showLoading});

  @override
  IncrementAction copyWith({
    bool? showLoading,
  }) {
    return IncrementAction(showLoading: showLoading ?? this.showLoading);
  }
}

class CounterMiddleware extends MiddlewareClass<AppState> {
  @override
  dynamic call(Store<AppState> store, action, NextDispatcher next) {
    return switch (action.runtimeType) {
      const (IncrementAction) => _increment(store.state, action, next),
      _ => next(action),
    };
  }

  Future<ReduxState<int>> _increment(
      AppState state, IncrementAction action, NextDispatcher next) async {
    try {
      if (action.showLoading) {
        next(UpdateCounterStateAction(counter: const ReduxLoadingState()));
      }
      // Simulate a request delay
      await Future.delayed(const Duration(seconds: 2));

      ReduxState<int> counter = state.counterState.counter;

      if (counter.isInitial) {
        counter = const ReduxSuccessState(1);
      } else if (counter.isSuccess) {
        counter = ReduxSuccessState((counter as ReduxSuccessState).data + 1);
      }

      next(UpdateCounterStateAction(counter: counter));

      return ReduxSuccessState((counter as ReduxSuccessState).data);
    } catch (e) {
      next(UpdateCounterStateAction(
          counter: ReduxFailureState(handleReduxActionException(e))));

      return ReduxFailureState(handleReduxActionException(e));
    }
  }
}
