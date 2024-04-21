import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:worker_finder_app/app.dart';
import 'package:worker_finder_app/manager/redux/state/state.dart';
import 'package:worker_finder_app/manager/redux/store/store.dart';

void main() {
  runApp(StoreProvider<AppState>(store: appStore, child: const AppBase()));
}
