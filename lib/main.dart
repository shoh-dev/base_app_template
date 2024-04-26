import 'package:base_app_template/manager/injection/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:base_app_template/app.dart';
import 'package:base_app_template/manager/redux/state/state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await setupInjection();

  runApp(StoreProvider<AppState>(store: appStore, child: const AppBase()));
}
