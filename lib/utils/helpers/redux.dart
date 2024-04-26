import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../manager/redux/state/app.state.dart';

Widget reduxConnector<T>({
  required StoreConverter<AppState, T> converter,
  required ViewModelBuilder<T> builder,
}) {
  return StoreConnector<AppState, T>(
    converter: converter,
    builder: builder,
  );
}
