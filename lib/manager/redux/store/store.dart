import 'package:redux/redux.dart';
import 'package:worker_finder_app/manager/redux/middleware/middleware.dart';

import '../reducer/reducer.dart';
import '../state/app.state.dart';

final appStore = Store<AppState>(
  appReducer,
  initialState: AppState.initial(),
  middleware: [
    CounterMiddleware().call,
  ],
);
