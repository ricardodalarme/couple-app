import 'dart:typed_data';

import 'package:file_picker_service/file_picker_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_models.dart';
import 'package:flutter_bloc_starter/features/widgets/data/models/widget_payload.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/couple_photo_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/data/repositories/widgets_repository.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/couple_photos/couple_photos_widget_page.dart';
import 'package:flutter_bloc_starter/features/widgets/presentation/couple_photos/cubit/couple_photos_widget_cubit.dart';
import 'package:flutter_bloc_starter/l10n/translations.g.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../test_helpers/pump_app.dart';

class _MockWidgetsRepository() extends Mock implements WidgetsRepository;

class _MockCouplePhotoRepository() extends Mock implements CouplePhotoRepository;

class _MockFilePickerService() extends Mock implements FilePickerService;

final class _FakePlatformFile({
  @override required final String name,
  required final Uint8List bytes,
}) extends PlatformFile {
  @override
  Uri get uri => Uri.file('/tmp/$name');

  @override
  Never get xFile => throw UnimplementedError();

  @override
  int? lengthSync() => bytes.length;

  @override
  Future<int?> length() async => bytes.length;

  @override
  Future<Uint8List> readAsBytes() async => bytes;

  @override
  Stream<Uint8List> readAsByteStream() => Stream.value(bytes);
}

void main() {
  late WidgetsRepository widgetsRepository;
  late CouplePhotoRepository couplePhotoRepository;
  late FilePickerService filePickerService;
  final bytes = Uint8List.fromList([1, 2, 3]);

  WidgetOverview buildOverview({
    bool isPaired = true,
    bool hasPlus = true,
    bool isDiscreet = false,
    bool hasPhoto = false,
    String? photoPath,
  }) => WidgetOverview.fake().copyWith(
    payload: WidgetPayload.fake().copyWith(
      isPaired: isPaired,
      hasPlus: hasPlus,
      discreet: isDiscreet,
      cachedPhotoPath: photoPath,
    ),
    hasPhoto: hasPhoto,
  );

  setUpAll(() {
    LocaleSettings.setLocaleSync(AppLocale.pt);
    registerFallbackValue(FileType.any);
    registerFallbackValue(Uint8List(0));
  });

  setUp(() {
    widgetsRepository = _MockWidgetsRepository();
    couplePhotoRepository = _MockCouplePhotoRepository();
    filePickerService = _MockFilePickerService();

    when(() => widgetsRepository.loadAndSync()).thenAnswer((_) async => buildOverview());
    when(
      () => couplePhotoRepository.upload(
        bytes: any(named: 'bytes'),
        contentType: any(named: 'contentType'),
      ),
    ).thenAnswer((_) async {});
    when(() => couplePhotoRepository.remove()).thenAnswer((_) async {});
    when(
      () => filePickerService.pickFile(
        dialogTitle: any(named: 'dialogTitle'),
        type: any(named: 'type'),
        allowedExtensions: any(named: 'allowedExtensions'),
      ),
    ).thenAnswer((_) async => _FakePlatformFile(name: 'photo.jpg', bytes: bytes));
  });

  CouplePhotosWidgetCubit build() => CouplePhotosWidgetCubit(
    widgetsRepository: widgetsRepository,
    couplePhotoRepository: couplePhotoRepository,
    filePickerService: filePickerService,
  );

  Future<CouplePhotosWidgetCubit> pumpPage(WidgetTester tester) async {
    final cubit = build();
    addTearDown(cubit.close);
    await cubit.load();
    await tester.pumpApp(BlocProvider.value(value: cubit, child: const CouplePhotosWidgetPage()));
    await tester.pump();
    return cubit;
  }

  testWidgets('paired with Plus and no photo offers only the choose action', (tester) async {
    await pumpPage(tester);

    expect(find.text('Escolher foto'), findsOneWidget);
    expect(find.text('Remover foto'), findsNothing);
    expect(find.text('Conhecer o Plus'), findsNothing);
  });

  testWidgets('a cached photo offers both choose and remove actions', (tester) async {
    when(() => widgetsRepository.loadAndSync())
        .thenAnswer((_) async => buildOverview(photoPath: '/tmp/repara_widget_photo.jpg'));

    await pumpPage(tester);

    expect(find.text('Escolher foto'), findsOneWidget);
    expect(find.text('Remover foto'), findsOneWidget);
  });

  testWidgets('a row photo without a local cache still offers remove', (tester) async {
    when(() => widgetsRepository.loadAndSync())
        .thenAnswer((_) async => buildOverview(hasPhoto: true));

    await pumpPage(tester);

    expect(find.text('Escolher foto'), findsOneWidget);
    expect(find.text('Remover foto'), findsOneWidget);
  });

  testWidgets('discreet mode disables choose but keeps remove', (tester) async {
    when(() => widgetsRepository.loadAndSync())
        .thenAnswer((_) async => buildOverview(hasPhoto: true, isDiscreet: true));

    await pumpPage(tester);

    expect(find.text('Escolher foto'), findsOneWidget);
    expect(find.text('Remover foto'), findsOneWidget);
  });

  testWidgets('without a partner the page shows the neutral invite state only', (tester) async {
    when(() => widgetsRepository.loadAndSync())
        .thenAnswer((_) async => buildOverview(isPaired: false));

    await pumpPage(tester);

    expect(find.text('Convide para ver aqui'), findsWidgets);
    expect(find.text('Escolher foto'), findsNothing);
    expect(find.text('Remover foto'), findsNothing);
  });

  testWidgets('without Plus the page shows the Plus action only', (tester) async {
    when(() => widgetsRepository.loadAndSync())
        .thenAnswer((_) async => buildOverview(hasPlus: false));

    await pumpPage(tester);

    expect(find.text('Conhecer o Plus'), findsOneWidget);
    expect(find.text('Escolher foto'), findsNothing);
    expect(find.text('Remover foto'), findsNothing);
  });

  testWidgets('choosing a photo uploads it and refreshes the preview', (tester) async {
    await pumpPage(tester);

    await tester.tap(find.text('Escolher foto'));
    await tester.pumpAndSettle();

    verify(() => couplePhotoRepository.upload(bytes: bytes, contentType: 'image/jpeg')).called(1);
    expect(find.text('Foto salva no widget.'), findsOneWidget);
  });

  testWidgets('removing a photo deletes it and clears the preview', (tester) async {
    when(() => widgetsRepository.loadAndSync())
        .thenAnswer((_) async => buildOverview(photoPath: '/tmp/repara_widget_photo.jpg'));
    await pumpPage(tester);

    await tester.tap(find.text('Remover foto'));
    await tester.pumpAndSettle();

    verify(() => couplePhotoRepository.remove()).called(1);
    expect(find.text('Foto removida do widget.'), findsOneWidget);
  });

  testWidgets('a picker failure shows the localized error', (tester) async {
    when(
      () => filePickerService.pickFile(
        dialogTitle: any(named: 'dialogTitle'),
        type: any(named: 'type'),
        allowedExtensions: any(named: 'allowedExtensions'),
      ),
    ).thenThrow(FilePickerException(Exception('picker failed')));
    await pumpPage(tester);

    await tester.tap(find.text('Escolher foto'));
    await tester.pumpAndSettle();

    expect(find.text('Não foi possível abrir o seletor de fotos.'), findsOneWidget);
  });
}
