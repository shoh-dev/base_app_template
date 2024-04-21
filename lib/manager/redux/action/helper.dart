import 'dart:async';

import 'package:worker_finder_app/manager/redux/store/store.dart';
import 'package:worker_finder_app/manager/response_handler/result.dart';

import 'action.dart';

extension ReduxActionHelpers<T> on ReduxAction<T> {
  FutureOr<ActionResult<T>> payload() {
    return appStore.dispatch(this);
  }
}
