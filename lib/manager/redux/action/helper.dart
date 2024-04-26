import 'dart:async';

import 'package:base_app_template/manager/redux/store/store.dart';
import 'package:base_app_template/manager/response_handler/result.dart';

import 'action.dart';

extension ReduxActionHelpers<T> on ReduxAction<T> {
  FutureOr<ActionResult<T>> payload() {
    return appStore.dispatch(this);
  }
}
