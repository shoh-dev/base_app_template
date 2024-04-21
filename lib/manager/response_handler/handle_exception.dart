import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:worker_finder_app/manager/response_handler/result.dart';

Either<Failure, Success<T>> handleException<T>(dynamic e) {
  Either<Failure, Success<T>> switcher() {
    return switch (e) {
      SocketException _ =>
        Left(Failure("No internet connection", stackTrace: StackTrace.current)),
      FormatException _ =>
        Left(Failure(e.message, stackTrace: StackTrace.current)),
      TypeError _ => Left(Failure(
          e.toString(),
          stackTrace: e.stackTrace,
          error: e,
        )),

      ///Keep handling exceptions here
      _ => Left(Failure(e.toString(), stackTrace: StackTrace.current))
    };
  }

  return switcher();
}
