import 'package:core/core.dart';
import 'package:meta/meta.dart';

/// Base Result class
/// [S] represents the type of the success value
sealed class const Resource<S>() {
  bool get isLoading => this is Loading;
}

@immutable
final class const Initial() extends Resource<Never>;

@immutable
final class const Loading() extends Resource<Never>;

@immutable
final class const Success<S>(final S value) extends Resource<S> {
  @override
  bool operator ==(Object other) =>
      other is Success && other.runtimeType == runtimeType && other.value == value;

  @override
  int get hashCode => value.hashCode;
}

@immutable
final class const Failure(final LocalizedException exception) extends Resource<Never> {
  factory fromObject(Object object) => switch (object) {
    LocalizedException() => Failure(object),
    _ => const Failure(UnknownException()),
  };

  @override
  bool operator ==(Object other) =>
      other is Failure && other.runtimeType == runtimeType && other.exception == exception;

  @override
  int get hashCode => exception.hashCode;
}
