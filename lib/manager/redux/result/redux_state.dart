import 'package:base_app_template/manager/response_handler/result.dart';

abstract class ReduxState<T> {
  const ReduxState();
}

extension ReduxStateHelper on ReduxState {
  bool get isLoading => this is ReduxLoadingState;

  bool get isSuccess => this is ReduxSuccessState;

  bool get isFailure => this is ReduxFailureState;

  bool get isInitial => this is ReduxInitialState;
}

class ReduxLoadingState<T> extends ReduxState<T> {
  const ReduxLoadingState();
}

class ReduxSuccessState<T> extends ReduxState<T> {
  final T data;

  const ReduxSuccessState(this.data);
}

class ReduxFailureState<T> extends ReduxState<T> {
  final Failure error;

  const ReduxFailureState(this.error);
}

class ReduxInitialState<T> extends ReduxState<T> {
  const ReduxInitialState();
}
