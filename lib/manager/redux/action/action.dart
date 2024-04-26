import 'package:base_app_template/manager/injection/setup.dart';
import 'package:base_app_template/manager/response_handler/result.dart';

abstract class ReduxAction<T> {
  const ReduxAction();

  Future<ActionResult<T>> call() async => await appStore.dispatch(this);
}
