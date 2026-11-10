import 'package:common_ui/common_ui.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:design_system/design_system_l10n.dart';
import 'package:flutter_test/flutter_test.dart';

Widget _host(Widget child) {
  return BaseApp(theme: AppTheme.light(AppThemeVariant.rose), home: child);
}

void main() {
  const fakeValue = 'fake value';
  const successValue = 'real value';

  Widget buildWidget(Resource<String> resource, {FailureBuilder? failureBuilder}) {
    return SkeletonizerResourceWidget<String>(
      resource,
      fakeValue: fakeValue,
      successBuilder: Text.new,
      failureBuilder: failureBuilder ?? (_) => const Text('failure'),
    );
  }

  group('SkeletonizerResourceWidget', () {
    testWidgets('renders nothing on Initial', (tester) async {
      await tester.pumpWidget(_host(buildWidget(const Initial())));

      expect(find.text(fakeValue), findsNothing);
      expect(find.text(successValue), findsNothing);
      expect(find.text('failure'), findsNothing);
    });

    testWidgets('renders the real value on Success', (tester) async {
      await tester.pumpWidget(_host(buildWidget(const Success(successValue))));

      expect(find.text(successValue), findsOneWidget);
      expect(find.text(fakeValue), findsNothing);
    });

    testWidgets('renders the failure builder on Failure', (tester) async {
      const exception = LocalizedException(l10nKey: 'common.genericError');
      LocalizedException? receivedException;

      await tester.pumpWidget(
        _host(
          buildWidget(
            const Failure(exception),
            failureBuilder: (exception) {
              receivedException = exception;
              return const Text('failure');
            },
          ),
        ),
      );

      expect(find.text('failure'), findsOneWidget);
      expect(receivedException, exception);
    });

    testWidgets('renders the fake value inside Skeletonizer on Loading', (tester) async {
      await tester.pumpWidget(_host(buildWidget(const Loading())));

      expect(find.text(fakeValue), findsOneWidget);
      expect(find.byWidgetPredicate((widget) => widget is Skeletonizer), findsOneWidget);
    });

    testWidgets('exposes loading as a live region and hides the fake content', (tester) async {
      final semantics = tester.ensureSemantics();

      await tester.pumpWidget(_host(buildWidget(const Loading())));

      expect(find.bySemanticsLabel(AppLocale.en.buildSync().common.loading), findsOneWidget);
      expect(find.bySemanticsLabel(fakeValue), findsNothing);

      semantics.dispose();
    });
  });
}
