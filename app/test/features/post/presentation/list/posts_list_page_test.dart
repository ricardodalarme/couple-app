import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/notifications/presentation/badge/cubit/notifications_badge_cubit.dart';
import 'package:flutter_bloc_starter/features/post/presentation/list/cubit/posts_list_cubit.dart';
import 'package:flutter_bloc_starter/features/post/presentation/list/posts_list_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class MockPostsListCubit() extends MockCubit<PostsListState> implements PostsListCubit;

class MockNotificationsBadgeCubit()
    extends MockCubit<NotificationsBadgeState>
    implements NotificationsBadgeCubit;

void main() {
  group('PostsListPage', () {
    late PostsListCubit postsListCubit;
    late NotificationsBadgeCubit notificationsBadgeCubit;

    setUp(() {
      postsListCubit = MockPostsListCubit();
      notificationsBadgeCubit = MockNotificationsBadgeCubit();

      when(() => postsListCubit.state).thenReturn(const PostsListState());
      when(() => notificationsBadgeCubit.state).thenReturn(const NotificationsBadgeState());
    });

    tearDown(() async {
      await postsListCubit.close();
      await notificationsBadgeCubit.close();
    });

    testWidgets('renders page', (tester) async {
      await tester.pumpApp(
        MultiBlocProvider(
          providers: [
            BlocProvider.value(value: postsListCubit),
            BlocProvider.value(value: notificationsBadgeCubit),
          ],
          child: const PostsListPage(),
        ),
      );
      await tester.pump();

      expect(find.byType(PostsListPage), findsOneWidget);
    });
  });
}
