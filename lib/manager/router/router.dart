import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:redux/redux.dart';
import 'package:base_app_template/manager/redux/state/app.state.dart';
import 'package:base_app_template/manager/router/routes.dart';
import 'package:base_app_template/ui/pages/pages.dart';
import 'package:base_app_template/utils/utils.dart';

export 'routes.dart';

class AppRouter {
  final Store<AppState> store;

  AppRouter(this.store);

  late final GoRouter router;

  Future<void> initialize() async {
    router = GoRouter(
      initialLocation: Routes.home,
      observers: [
        BotToastNavigatorObserver(),
      ],
      routes: [
        GoRoute(
          path: Routes.home,
          pageBuilder: (context, state) => const MaterialPage(
            child: HomePage(),
          ),
        ),
      ],
    );
    logger("GoRouter initialized");
  }
}
