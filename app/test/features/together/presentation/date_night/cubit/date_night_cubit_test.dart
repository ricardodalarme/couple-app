import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/profile/data/models/account_settings.dart';
import 'package:flutter_bloc_starter/features/profile/data/repositories/profile_repository.dart';
import 'package:flutter_bloc_starter/features/together/data/models/date_idea.dart';
import 'package:flutter_bloc_starter/features/together/data/models/date_idea_status.dart';
import 'package:flutter_bloc_starter/features/together/data/repositories/together_repository.dart';
import 'package:flutter_bloc_starter/features/together/presentation/date_night/cubit/date_night_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockTogetherRepository() extends Mock implements TogetherRepository;

class _MockProfileRepository() extends Mock implements ProfileRepository;

void main() {
  late TogetherRepository together;
  late ProfileRepository profile;

  const idea = DateIdea(id: 'd1', title: 'Piquenique', status: DateIdeaStatus.saved);
  const suggestion = DateIdeaSuggestion(slug: 'picnic', title: 'Piquenique no parque');

  setUpAll(() => registerFallbackValue(idea));

  setUp(() {
    together = _MockTogetherRepository();
    profile = _MockProfileRepository();
    when(() => together.getDateIdeas()).thenAnswer((_) async => [idea]);
    when(() => together.getDateIdeaSuggestions(any())).thenAnswer((_) async => [suggestion]);
    when(() => profile.getMySettings())
        .thenAnswer((_) async => const AccountSettings(theme: .rose, locale: 'pt-BR'));
    when(
      () => together.addDateIdea(
        id: any(named: 'id'),
        title: any(named: 'title'),
        slug: any(named: 'slug'),
      ),
    ).thenAnswer((_) async {});
    when(() => together.planDateIdea(any(), day: any(named: 'day'))).thenAnswer((_) async {});
    when(
      () => together.setDateIdeaDone(
        id: any(named: 'id'),
        isDone: any(named: 'isDone'),
      ),
    ).thenAnswer((_) async {});
    when(() => together.deleteDateIdea(any())).thenAnswer((_) async {});
  });

  DateNightCubit build() =>
      DateNightCubit(togetherRepository: together, profileRepository: profile);

  group('planDay', () {
    // A Tuesday.
    final now = DateTime(2026, 11, 10, 15);

    test('today and tomorrow are plain days', () {
      expect(planDay(PlanChoice.today, now), DateTime(2026, 11, 10));
      expect(planDay(PlanChoice.tomorrow, now), DateTime(2026, 11, 11));
    });

    test('the weekend choices land on the coming Saturday and Sunday', () {
      expect(planDay(PlanChoice.saturday, now), DateTime(2026, 11, 14));
      expect(planDay(PlanChoice.sunday, now), DateTime(2026, 11, 15));
    });

    test('a weekday that is today moves a week ahead', () {
      expect(planDay(PlanChoice.saturday, DateTime(2026, 11, 14)), DateTime(2026, 11, 21));
    });
  });

  test('load shows the ideas and offers no suggestions when there are some', () async {
    final cubit = build();

    await cubit.load();

    expect((cubit.state.ideas as Success<List<DateIdea>>).value, [idea]);
    expect(cubit.state.suggestions, isEmpty);
  });

  test('with no ideas a few editorial ones are offered', () async {
    when(() => together.getDateIdeas()).thenAnswer((_) async => const []);
    final cubit = build();

    await cubit.load();

    expect(cubit.state.suggestions, [suggestion]);
    verify(() => together.getDateIdeaSuggestions('pt-BR')).called(1);
  });

  test('saving a suggestion keeps its slug', () async {
    final cubit = build();

    await cubit.add(suggestion: suggestion);

    verify(
      () => together.addDateIdea(
        id: any(named: 'id'),
        title: 'Piquenique no parque',
        slug: 'picnic',
      ),
    ).called(1);
  });

  test('an empty idea cannot be saved', () async {
    final cubit = build()..onTitleChanged('  ');

    await cubit.add();

    verifyNever(
      () => together.addDateIdea(
        id: any(named: 'id'),
        title: any(named: 'title'),
        slug: any(named: 'slug'),
      ),
    );
  });

  test('planning sends the day for the chosen option', () async {
    final cubit = build();
    await cubit.load();

    await cubit.plan(idea, PlanChoice.tomorrow);

    verify(() => together.planDateIdea(idea, day: any(named: 'day'))).called(1);
  });

  test('a failed change keeps the ideas and reports once', () async {
    when(() => together.deleteDateIdea(any()))
        .thenThrow(const LocalizedException(l10nKey: 'NETWORK'));
    final cubit = build();
    await cubit.load();

    await cubit.delete(idea);

    expect((cubit.state.ideas as Success<List<DateIdea>>).value, [idea]);
    expect(cubit.state.changeAction, isA<Initial>());
  });
}
