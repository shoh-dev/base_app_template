import 'package:worker_finder_app/manager/response_handler/result.dart';

import '../store/store.dart';

abstract class ReduxAction<T> {
  const ReduxAction();

  Future<ActionResult<T>> call() async => await appStore.dispatch(this);
}
