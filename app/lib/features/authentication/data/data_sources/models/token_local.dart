import 'package:equatable/equatable.dart';

final class TokenLocal with EquatableMixin {
  const TokenLocal({required this.expires, required this.token});

  TokenLocal.fromMap(Map<String, dynamic> map)
    : expires = DateTime.parse(map['expires'] as String),
      token = map['token'] as String;

  final DateTime expires;
  final String token;

  Map<String, dynamic> toMap() => {'expires': expires.toIso8601String(), 'token': token};

  @override
  List<Object?> get props => [expires, token];
}
