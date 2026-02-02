// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher_repo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Publishers)
final publishersProvider = PublishersProvider._();

final class PublishersProvider
    extends $StreamNotifierProvider<Publishers, List<PublisherModel>> {
  PublishersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'publishersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$publishersHash();

  @$internal
  @override
  Publishers create() => Publishers();
}

String _$publishersHash() => r'326920b55442f778b1b66513e37cc0fbdc6c4131';

abstract class _$Publishers extends $StreamNotifier<List<PublisherModel>> {
  Stream<List<PublisherModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<PublisherModel>>, List<PublisherModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<PublisherModel>>,
                List<PublisherModel>
              >,
              AsyncValue<List<PublisherModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(fetchPublisher)
final fetchPublisherProvider = FetchPublisherFamily._();

final class FetchPublisherProvider
    extends
        $FunctionalProvider<
          AsyncValue<PublisherModel>,
          PublisherModel,
          Stream<PublisherModel>
        >
    with $FutureModifier<PublisherModel>, $StreamProvider<PublisherModel> {
  FetchPublisherProvider._({
    required FetchPublisherFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'fetchPublisherProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchPublisherHash();

  @override
  String toString() {
    return r'fetchPublisherProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<PublisherModel> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<PublisherModel> create(Ref ref) {
    final argument = this.argument as int;
    return fetchPublisher(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPublisherProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchPublisherHash() => r'f5da311bfd2c7ab973a909e617dcd08c59c516fe';

final class FetchPublisherFamily extends $Family
    with $FunctionalFamilyOverride<Stream<PublisherModel>, int> {
  FetchPublisherFamily._()
    : super(
        retry: null,
        name: r'fetchPublisherProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchPublisherProvider call(int id) =>
      FetchPublisherProvider._(argument: id, from: this);

  @override
  String toString() => r'fetchPublisherProvider';
}
