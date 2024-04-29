import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:base_app_template/manager/redux/result/redux_state.dart';

import '../../manager/redux/state/app.state.dart';

class ReduxStateConnector<T> extends StatelessWidget {
  final StoreConverter<AppState, ReduxState<T>> converter;

  final ViewModelBuilder<ReduxFailureState<T>>? failureBuilder;
  final ViewModelBuilder<ReduxLoadingState<T>>? loadingBuilder;
  final ViewModelBuilder<ReduxInitialState<T>>? initialBuilder;
  final ViewModelBuilder<ReduxSuccessState<T>> successBuilder;

  final OnInitialBuildCallback<ReduxState<T>>? onInitialBuild;

  final OnDisposeCallback<AppState>? onDispose;

  const ReduxStateConnector({
    super.key,
    required this.converter,
    required this.successBuilder,
    this.failureBuilder,
    this.loadingBuilder,
    this.initialBuilder,
    this.onInitialBuild,
    this.onDispose,
  });

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ReduxState<T>>(
      converter: converter,
      onInitialBuild: onInitialBuild,
      onDispose: onDispose,
      distinct: true,
      builder: (context, vm) {
        if (vm.isLoading) {
          if (loadingBuilder != null) {
            return loadingBuilder!(context, vm as ReduxLoadingState<T>);
          }
          return const Center(child: CircularProgressIndicator());
        }
        if (vm.isInitial) {
          if (initialBuilder != null) {
            return initialBuilder!(context, vm as ReduxInitialState<T>);
          }
          return const SizedBox.shrink();
        }
        if (vm.isFailure) {
          if (failureBuilder != null) {
            return failureBuilder!(context, vm as ReduxFailureState<T>);
          }
          return Center(
              child: Text((vm as ReduxFailureState).error.message ??
                  "Error in ReduxConnector"));
        }

        return successBuilder(context, vm as ReduxSuccessState<T>);
      },
    );
  }
}

Widget reduxConnector<T>({
  required StoreConverter<AppState, T> converter,
  required ViewModelBuilder<T> builder,
}) {
  return StoreConnector<AppState, T>(
    converter: converter,
    builder: builder,
  );
}
