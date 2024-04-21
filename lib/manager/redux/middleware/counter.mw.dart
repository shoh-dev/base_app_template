import 'package:redux/redux.dart';
import 'package:worker_finder_app/manager/redux/action/action.dart';
import 'package:worker_finder_app/manager/redux/state/state.dart';
import 'package:worker_finder_app/manager/response_handler/handle_exception.dart';
import 'package:worker_finder_app/manager/response_handler/result.dart';
import 'package:either_dart/either.dart';

class IncrementAction extends ReduxAction<int> {
  const IncrementAction();
}

class CounterMiddleware extends MiddlewareClass<AppState> {
  @override
  dynamic call(Store<AppState> store, action, NextDispatcher next) {
    return switch (action.runtimeType) {
      const (IncrementAction) => _increment(store.state, action, next),
      _ => next(action),
    };
  }

  Future<ActionResult<int>> _increment(
      AppState state, IncrementAction action, NextDispatcher next) async {
    try {
      final counter = state.counterState.counter + 1;
      // Simulate a request delay
      await Future.delayed(const Duration(seconds: 2));
      next(UpdateCounterStateAction(counter: counter));
      return Right(Success(counter));
    } catch (e) {
      return handleException(e);
    }
  }
}
