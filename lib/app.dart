import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:base_app_template/manager/redux/action/helper.dart';
import 'package:base_app_template/manager/redux/middleware/counter.mw.dart';
import 'package:base_app_template/manager/redux/state/state.dart';
import 'package:base_app_template/manager/redux/store/store.dart';
import 'package:base_app_template/ui/loader/loading.helper.dart';
import 'package:base_app_template/utils/redux.helper.dart';

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
      child: MaterialApp(
        builder: (context, child) {
          child = botToastBuilder(context, child);
          return child;
        },
        navigatorObservers: [
          BotToastNavigatorObserver(),
        ],
        home: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final res = await const IncrementAction().payload().loading();
              res.fold((left) => print(left.message), (right) => null);
            },
            child: const Icon(Icons.add),
          ),
          body: Center(
            child: reduxConnector(
              converter: (store) => store.state.counterState.counter,
              builder: (context, vm) => Text(vm.toString()),
            ),
          ),
        ),
      ),
    );
  }
}
