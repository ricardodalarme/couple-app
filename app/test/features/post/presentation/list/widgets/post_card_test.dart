import 'package:common_ui/common_ui.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quickstart_flutter_bloc/features/post/data/models/post.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/list/widgets/post_card.dart';

import '../../../../../test_helpers/pump_app.dart';

void main() {
  group('PostCard', () {
    testWidgets('PostCard should display correct information', (
      WidgetTester tester,
    ) async {
      const post = Post(id: '1', title: 'Test Title', body: 'Test Body');

      await tester.pumpApp(const PostCard(post: post));

      expect(find.byType(ProfilePicture), findsOneWidget);

      expect(find.text('Test Title'), findsOneWidget);
      expect(find.text('Test Body'), findsOneWidget);
    });
  });
}
