part of 'capsules_cubit.dart';

final class const CapsulesState({
  final Resource<List<Capsule>> capsules = const Loading(),
  final FormInput<String> body = const FormInput(''),
  final FormInput<DateTime?> opensOn = const FormInput(null),
  final bool isShared = false,
  final Resource<void> saveAction = const Initial(),
  final Resource<void> deleteAction = const Initial(),
}) with Equatable {
  CapsulesState copyWith({
    Resource<List<Capsule>>? capsules,
    FormInput<String>? body,
    FormInput<DateTime?>? opensOn,
    bool clearDate = false,
    bool? isShared,
    Resource<void>? saveAction,
    Resource<void>? deleteAction,
  }) {
    return CapsulesState(
      capsules: capsules ?? this.capsules,
      body: body ?? this.body,
      opensOn: clearDate ? const FormInput(null) : opensOn ?? this.opensOn,
      isShared: isShared ?? this.isShared,
      saveAction: saveAction ?? this.saveAction,
      deleteAction: deleteAction ?? this.deleteAction,
    );
  }

  @override
  List<Object?> get props => [capsules, body, opensOn, isShared, saveAction, deleteAction];
}
