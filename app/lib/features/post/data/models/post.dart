import 'package:equatable/equatable.dart';

final class Post with EquatableMixin {
  const Post({required this.id, required this.title, required this.body, this.authorImageUrl});

  final String id;
  final String title;
  final String body;
  final String? authorImageUrl;

  static const Post fake = Post(
    id: '1',
    title: 'Lorem ipsum dolor sit amet',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc.',
    authorImageUrl: 'https://i.pravatar.cc/150?img=1',
  );

  @override
  List<Object?> get props => [id, title, body, authorImageUrl];
}
