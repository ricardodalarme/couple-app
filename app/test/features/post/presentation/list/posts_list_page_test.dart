import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/list/bloc/posts_list_bloc.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/list/posts_list_page.dart';

import '../../../../test_helpers/pump_app.dart';

class MockPostsListBloc extends MockBloc<PostsListEvent, PostsListState>
    implements PostsListBloc {}

void main() {
  group('PostsListPage', () {
    late PostsListBloc postsListBloc;

    setUp(() {
      postsListBloc = MockPostsListBloc();
      when(() => postsListBloc.state).thenReturn(const PostsListState());
    });

    testWidgets('renders page', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(value: postsListBloc, child: const PostsListPage()),
      );
      await tester.pump();

      expect(find.byType(PostsListPage), findsOneWidget);
    });
  });
}
