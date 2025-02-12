import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/bloc/post_bloc.dart';
import 'package:quickstart_flutter_bloc/features/post/presentation/post_page.dart';

import '../../../test_helpers/pump_app.dart';

class MockPostBloc extends MockBloc<PostEvent, PostState> implements PostBloc {}

void main() {
  group('PostPage', () {
    late PostBloc postBloc;

    setUp(() {
      postBloc = MockPostBloc();
      when(() => postBloc.state).thenReturn(const PostState());
    });

    testWidgets('renders page', (tester) async {
      await tester.pumpApp(
        BlocProvider.value(value: postBloc, child: const PostPage()),
      );
      await tester.pump();

      expect(find.byType(PostPage), findsOneWidget);
    });
  });
}
