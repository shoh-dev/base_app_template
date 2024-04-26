import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:base_app_template/manager/injection/setup.dart';
import 'package:base_app_template/manager/redux/state/state.dart';

class AppBase extends StatefulWidget {
  const AppBase({super.key});

  @override
  State<AppBase> createState() => _AppBaseState();
}

class _AppBaseState extends State<AppBase> {
  final botToastBuilder = BotToastInit();

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: appStore,
      child: MaterialApp.router(
        routerConfig: appRouter.router,
        builder: (context, child) {
          child = botToastBuilder(context, child);
          return child;
        },
      ),
    );
  }
}
