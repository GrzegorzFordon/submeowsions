// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_types_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchTypes)
final searchTypesProvider = SearchTypesProvider._();

final class SearchTypesProvider
    extends $NotifierProvider<SearchTypes, (bool, bool)> {
  SearchTypesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchTypesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchTypesHash();

  @$internal
  @override
  SearchTypes create() => SearchTypes();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue((bool, bool) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<(bool, bool)>(value),
    );
  }
}

String _$searchTypesHash() => r'ef47abf6b31eda96588a407d403640da70d1caca';

abstract class _$SearchTypes extends $Notifier<(bool, bool)> {
  (bool, bool) build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<(bool, bool), (bool, bool)>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<(bool, bool), (bool, bool)>,
              (bool, bool),
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
