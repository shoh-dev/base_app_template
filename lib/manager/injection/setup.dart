import 'package:base_app_template/manager/redux/store/store.dart';
import 'package:get_it/get_it.dart';
import 'package:redux/redux.dart';
import 'package:base_app_template/manager/redux/state/app.state.dart';
import 'package:base_app_template/manager/router/router.dart';
import 'package:base_app_template/manager/supabase/client.dart';

final _getIt = GetIt.instance;

final appRouter = _getIt<AppRouter>();

final appStore = _getIt<Store<AppState>>();

final supaClient = _getIt<SupaClient>();

Future<void> setupInjection() async {
  _getIt.registerSingleton(reduxStore);

  _getIt.registerSingleton(SupaClient());
  await supaClient.initialize();

  _getIt.registerSingleton(AppRouter(_getIt.get()));
  await appRouter.initialize();
}
