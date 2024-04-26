import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:base_app_template/app.dart';
import 'package:base_app_template/manager/redux/state/state.dart';
import 'package:base_app_template/manager/redux/store/store.dart';

void main() {
  runApp(StoreProvider<AppState>(store: appStore, child: const AppBase()));
}
