import 'package:equatable/equatable.dart';

final class Post with EquatableMixin {
  const Post({required this.id, required this.title, required this.body, this.authorImageUrl});

  final String id;
  final String title;
  final String body;
  final String? authorImageUrl;

  @override
  List<Object?> get props => [id, title, body, authorImageUrl];
}
