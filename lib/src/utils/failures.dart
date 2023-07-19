import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}

class BadRequestFailure extends Failure {
  const BadRequestFailure(String message) : super(message);
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(String message) : super(message);
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(String message) : super(message);
}

class LoginFailure extends Failure {
  const LoginFailure(String message) : super(message);
}

class LogoutFailure extends Failure {
  const LogoutFailure(String message) : super(message);
}
