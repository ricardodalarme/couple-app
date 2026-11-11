import 'package:core/core.dart';
import 'package:flutter_bloc_starter/features/authentication/data/repositories/authentication_repository.dart';
import 'package:flutter_bloc_starter/features/notes/data/data_sources/notes_data_source.dart';
import 'package:flutter_bloc_starter/features/notes/data/repositories/notes_repository.dart';
import 'package:flutter_bloc_starter/features/notes/presentation/compose/cubit/compose_cubit.dart';
import 'package:flutter_bloc_starter/features/notes/presentation/compose/widgets/drawing_painter.dart';
import 'package:flutter_bloc_starter/features/pairing/data/repositories/pairing_repository.dart';
import 'package:network/network.dart';
import 'package:storage_service/storage_service.dart';

class NotesInjectionModule() implements InjectionModule {
  @override
  void registerDependencies({required Injector injector}) => injector
    ..registerLazySingleton<NotesDataSource>(
      () => NotesDataSource(client: injector.get<GQLClient>()),
    )
    ..registerLazySingleton<NotesRepository>(
      () => NotesRepository(
        dataSource: injector.get<NotesDataSource>(),
        storageService: injector.get<StorageService>(),
        authenticationRepository: injector.get<AuthenticationRepository>(),
      ),
    )
    ..registerFactory<ComposeCubit>(
      () => ComposeCubit(
        notesRepository: injector.get<NotesRepository>(),
        pairingRepository: injector.get<PairingRepository>(),
        exportDrawing: renderDrawingPng,
      ),
    );
}
