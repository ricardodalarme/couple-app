import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/list/cubit/posts_list_cubit.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/list/posts_list_page.dart';

import '../../../../test_helpers/pump_app.dart';

class MockPostsListCubit extends MockCubit<PostsListState> implements PostsListCubit {}

void main() {
  group('PostsListPage', () {
    late PostsListCubit postsListCubit;

    setUp(() {
      postsListCubit = MockPostsListCubit();
      when(() => postsListCubit.state).thenReturn(const PostsListState());
    });

    testWidgets('renders page', (tester) async {
      await tester.pumpApp(BlocProvider.value(value: postsListCubit, child: const PostsListPage()));
      await tester.pump();

      expect(find.byType(PostsListPage), findsOneWidget);
    });
  });
}
