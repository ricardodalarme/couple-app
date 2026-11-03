import 'package:equatable/equatable.dart';

final class const Post({
  required final String id,
  required final String title,
  required final String body,
  final String? authorImageUrl,
}) with Equatable {
  static const Post fake = Post(
    id: '1',
    title: 'Lorem ipsum dolor sit amet',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec auctor, nisl eget ultricies lacinia, nunc nisl aliquam nisl, eget aliquam nunc nisl eget nunc.',
    authorImageUrl: 'https://i.pravatar.cc/150?img=1',
  );

  @override
  List<Object?> get props => [id, title, body, authorImageUrl];
}
