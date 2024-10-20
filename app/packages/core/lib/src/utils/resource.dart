import 'package:core/core.dart';
import 'package:meta/meta.dart';

/// Base Result class
/// [S] represents the type of the success value
sealed class Resource<S> {
  const Resource();

  bool get isLoading => this is Loading;
}

@immutable
final class Initial extends Resource<Never> {
  const Initial();
}

@immutable
final class Loading extends Resource<Never> {
  const Loading();
}

@immutable
final class Success<S> extends Resource<S> {
  const Success(this.value);

  final S value;

  @override
  bool operator ==(Object other) =>
      other is Success &&
      other.runtimeType == runtimeType &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;
}

@immutable
final class Failure extends Resource<Never> {
  const Failure(this.exception);

  factory Failure.fromObject(Object object) => switch (object) {
        L10nPlaceholderException() => Failure(object),
        _ => const Failure(UnknownException()),
      };

  final L10nPlaceholderException exception;

  @override
  bool operator ==(Object other) =>
      other is Failure &&
      other.runtimeType == runtimeType &&
      other.exception == exception;

  @override
  int get hashCode => exception.hashCode;
}
