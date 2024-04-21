import 'package:either_dart/either.dart';

class Success<T> {
  final T data;

  const Success(this.data);
}

class Failure {
  final String? message;
  final StackTrace? stackTrace;
  final dynamic error;

  const Failure(this.message, {this.stackTrace, this.error});
}

class Void extends Success<void> {
  const Void() : super(null);
}

typedef ActionResult<T> = Either<Failure, Success<T>>;
