import 'package:redux/redux.dart';
import 'package:base_app_template/manager/redux/middleware/middleware.dart';

import '../reducer/reducer.dart';
import '../state/app.state.dart';

final appStore = Store<AppState>(
  appReducer,
  initialState: AppState.initial(),
  middleware: [
    CounterMiddleware().call,
  ],
);
