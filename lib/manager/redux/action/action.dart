import 'package:base_app_template/manager/injection/injection.dart';
import 'package:base_app_template/manager/redux/result/redux_state.dart';

abstract class ReduxAction<T> {
  const ReduxAction({
    this.showLoading = false,
  });

  final bool showLoading;

  Future<ReduxState<T>> call() async => await appStore.dispatch(this);

  //copyWith
  ReduxAction<T> copyWith({
    bool? showLoading,
  });
}
