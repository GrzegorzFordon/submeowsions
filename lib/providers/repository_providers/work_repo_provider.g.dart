// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_repo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Works)
final worksProvider = WorksProvider._();

final class WorksProvider
    extends $StreamNotifierProvider<Works, List<WorkModel>> {
  WorksProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'worksProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$worksHash();

  @$internal
  @override
  Works create() => Works();
}

String _$worksHash() => r'eb7bb990998e5f6db9f5cb45cb830c8738201bfa';

abstract class _$Works extends $StreamNotifier<List<WorkModel>> {
  Stream<List<WorkModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<WorkModel>>, List<WorkModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<WorkModel>>, List<WorkModel>>,
              AsyncValue<List<WorkModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(fetchWork)
final fetchWorkProvider = FetchWorkFamily._();

final class FetchWorkProvider
    extends
        $FunctionalProvider<AsyncValue<WorkModel>, WorkModel, Stream<WorkModel>>
    with $FutureModifier<WorkModel>, $StreamProvider<WorkModel> {
  FetchWorkProvider._({
    required FetchWorkFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'fetchWorkProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchWorkHash();

  @override
  String toString() {
    return r'fetchWorkProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<WorkModel> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<WorkModel> create(Ref ref) {
    final argument = this.argument as int;
    return fetchWork(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchWorkProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchWorkHash() => r'ffb40b76ec878fffe346788eaf3c2e78fbcbb762';

final class FetchWorkFamily extends $Family
    with $FunctionalFamilyOverride<Stream<WorkModel>, int> {
  FetchWorkFamily._()
    : super(
        retry: null,
        name: r'fetchWorkProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  FetchWorkProvider call(int id) =>
      FetchWorkProvider._(argument: id, from: this);

  @override
  String toString() => r'fetchWorkProvider';
}
