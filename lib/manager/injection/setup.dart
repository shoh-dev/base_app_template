import 'package:base_app_template/manager/redux/store/store.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';
import 'package:base_app_template/manager/redux/state/app.state.dart';
import 'package:base_app_template/manager/router/router.dart';
import 'package:base_app_template/manager/supabase/client.dart';

final _getIt = GetIt.instance;

final appRouter = _getIt<AppRouter>();

final appStore = _getIt<Store<AppState>>();

final supaCLient = _getIt<SupaClient>();

Future<void> setupInjection() async {
  _getIt.registerSingleton(reduxStore);

  _getIt.registerSingletonAsync(() async => SupaClient()..initialize());

  _getIt.registerSingletonAsync(
      () async => AppRouter(_getIt.get())..initialize());
}
