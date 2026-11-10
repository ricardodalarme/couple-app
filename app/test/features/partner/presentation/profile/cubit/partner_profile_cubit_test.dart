import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/partner/data/models/partner_fact.dart';
import 'package:flutter_bloc_starter/features/partner/data/repositories/partner_repository.dart';
import 'package:flutter_bloc_starter/features/partner/presentation/profile/cubit/partner_profile_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class _MockPartnerRepository() extends Mock implements PartnerRepository;

void main() {
  late PartnerRepository repository;

  const fact = PartnerFact(id: 'f1', label: 'Café', value: 'Sem açúcar', category: 'likes');

  setUp(() {
    repository = _MockPartnerRepository();
    when(() => repository.getFacts()).thenAnswer((_) async => [fact]);
    when(
      () => repository.addFact(
        id: any(named: 'id'),
        label: any(named: 'label'),
        value: any(named: 'value'),
        category: any(named: 'category'),
      ),
    ).thenAnswer((_) async {});
    when(() => repository.deleteFact(any())).thenAnswer((_) async {});
  });

  PartnerProfileCubit build() => PartnerProfileCubit(partnerRepository: repository);

  test('a note needs a label and a value within their limits', () {
    final cubit = build()..onLabelChanged('Café');
    expect(cubit.state.canSave, isFalse);

    cubit.onValueChanged('a' * (partnerFactValueMaxLength + 1));
    expect(cubit.state.canSave, isFalse);

    cubit.onValueChanged('Sem açúcar');
    expect(cubit.state.canSave, isTrue);
  });

  test('saving clears the form and reads the notes again', () async {
    final cubit = build()
      ..onLabelChanged('Café')
      ..onValueChanged('Sem açúcar')
      ..onCategoryToggled('likes');

    await cubit.save();

    verify(
      () => repository.addFact(
        id: any(named: 'id'),
        label: 'Café',
        value: 'Sem açúcar',
        category: 'likes',
      ),
    ).called(1);
    expect(cubit.state.label, '');
    expect(cubit.state.category, isNull);
    verify(() => repository.getFacts()).called(1);
  });

  test('a failed save keeps the text and retries with the same id', () async {
    final ids = <String>[];
    when(
      () => repository.addFact(
        id: any(named: 'id'),
        label: any(named: 'label'),
        value: any(named: 'value'),
        category: any(named: 'category'),
      ),
    ).thenAnswer((invocation) async {
      ids.add(invocation.namedArguments[#id] as String);
      if (ids.length == 1) throw const LocalizedException(l10nKey: 'NETWORK');
    });
    final cubit = build()
      ..onLabelChanged('Café')
      ..onValueChanged('Sem açúcar');

    await cubit.save();
    expect(cubit.state.label, 'Café');

    await cubit.save();
    expect(ids.first, ids.last);
  });

  test('deleting reads the notes again', () async {
    final cubit = build();

    await cubit.delete(fact);

    verify(() => repository.deleteFact('f1')).called(1);
    verify(() => repository.getFacts()).called(1);
  });
}
