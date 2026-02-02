// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_searches_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RecentSearches)
final recentSearchesProvider = RecentSearchesProvider._();

final class RecentSearchesProvider
    extends $NotifierProvider<RecentSearches, List<(Type, int)>> {
  RecentSearchesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recentSearchesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recentSearchesHash();

  @$internal
  @override
  RecentSearches create() => RecentSearches();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<(Type, int)> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<(Type, int)>>(value),
    );
  }
}

String _$recentSearchesHash() => r'b20571b72493d7d33b2d50a52c3bbd54151848e9';

abstract class _$RecentSearches extends $Notifier<List<(Type, int)>> {
  List<(Type, int)> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<(Type, int)>, List<(Type, int)>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<(Type, int)>, List<(Type, int)>>,
              List<(Type, int)>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
