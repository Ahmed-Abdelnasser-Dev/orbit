import 'package:equatable/equatable.dart';

/// Base class for all failures in the application.
abstract class Failure extends Equatable {
  final String message;

  const Failure({required this.message});

  @override
  List<Object?> get props => [message];
}

/// Failure when caching/local storage fails.
class CacheFailure extends Failure {
  const CacheFailure({required super.message});
}

/// Failure when network request fails.
class NetworkFailure extends Failure {
  const NetworkFailure({required super.message});
}

/// Failure when server returns an error.
class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

/// Failure due to validation errors.
class ValidationFailure extends Failure {
  const ValidationFailure({required super.message});
}

/// Failure when permission is denied.
class PermissionFailure extends Failure {
  const PermissionFailure({required super.message});
}
