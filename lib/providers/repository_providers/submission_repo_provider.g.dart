// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submission_repo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Submissions)
final submissionsProvider = SubmissionsProvider._();

final class SubmissionsProvider
    extends $StreamNotifierProvider<Submissions, List<SubmissionModel>> {
  SubmissionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'submissionsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$submissionsHash();

  @$internal
  @override
  Submissions create() => Submissions();
}

String _$submissionsHash() => r'06122fec6039c4f2f7c76d6e496359cd5f26efad';

abstract class _$Submissions extends $StreamNotifier<List<SubmissionModel>> {
  Stream<List<SubmissionModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref
            as $Ref<AsyncValue<List<SubmissionModel>>, List<SubmissionModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<SubmissionModel>>,
                List<SubmissionModel>
              >,
              AsyncValue<List<SubmissionModel>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(fetchSubmission)
final fetchSubmissionProvider = FetchSubmissionFamily._();

final class FetchSubmissionProvider
    extends
        $FunctionalProvider<
          AsyncValue<SubmissionModel>,
          SubmissionModel,
          Stream<SubmissionModel>
        >
    with $FutureModifier<SubmissionModel>, $StreamProvider<SubmissionModel> {
  FetchSubmissionProvider._({
    required FetchSubmissionFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'fetchSubmissionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchSubmissionHash();

  @override
  String toString() {
    return r'fetchSubmissionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<SubmissionModel> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<SubmissionModel> create(Ref ref) {
    final argument = this.argument as int;
    return fetchSubmission(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchSubmissionProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchSubmissionHash() => r'270947e27a0eae01bbc65b871fd5fbaf714a165e';

final class FetchSubmissionFamily extends $Family
    with $FunctionalFamilyOverride<Stream<SubmissionModel>, int> {
  FetchSubmissionFamily._()
    : super(
        retry: null,
        name: r'fetchSubmissionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchSubmissionProvider call(int id) =>
      FetchSubmissionProvider._(argument: id, from: this);

  @override
  String toString() => r'fetchSubmissionProvider';
}

@ProviderFor(fetchSubmissionsWithWork)
final fetchSubmissionsWithWorkProvider = FetchSubmissionsWithWorkFamily._();

final class FetchSubmissionsWithWorkProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SubmissionModel>>,
          List<SubmissionModel>,
          Stream<List<SubmissionModel>>
        >
    with
        $FutureModifier<List<SubmissionModel>>,
        $StreamProvider<List<SubmissionModel>> {
  FetchSubmissionsWithWorkProvider._({
    required FetchSubmissionsWithWorkFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'fetchSubmissionsWithWorkProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchSubmissionsWithWorkHash();

  @override
  String toString() {
    return r'fetchSubmissionsWithWorkProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<SubmissionModel>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<SubmissionModel>> create(Ref ref) {
    final argument = this.argument as int;
    return fetchSubmissionsWithWork(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchSubmissionsWithWorkProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchSubmissionsWithWorkHash() =>
    r'1879b6974a1f3f65e6b7073565a9955e78ba5995';

final class FetchSubmissionsWithWorkFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<SubmissionModel>>, int> {
  FetchSubmissionsWithWorkFamily._()
    : super(
        retry: null,
        name: r'fetchSubmissionsWithWorkProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchSubmissionsWithWorkProvider call(int workId) =>
      FetchSubmissionsWithWorkProvider._(argument: workId, from: this);

  @override
  String toString() => r'fetchSubmissionsWithWorkProvider';
}

@ProviderFor(fetchSubmissionsWithPublisher)
final fetchSubmissionsWithPublisherProvider =
    FetchSubmissionsWithPublisherFamily._();

final class FetchSubmissionsWithPublisherProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SubmissionModel>>,
          List<SubmissionModel>,
          Stream<List<SubmissionModel>>
        >
    with
        $FutureModifier<List<SubmissionModel>>,
        $StreamProvider<List<SubmissionModel>> {
  FetchSubmissionsWithPublisherProvider._({
    required FetchSubmissionsWithPublisherFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'fetchSubmissionsWithPublisherProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchSubmissionsWithPublisherHash();

  @override
  String toString() {
    return r'fetchSubmissionsWithPublisherProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<SubmissionModel>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<SubmissionModel>> create(Ref ref) {
    final argument = this.argument as int;
    return fetchSubmissionsWithPublisher(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchSubmissionsWithPublisherProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchSubmissionsWithPublisherHash() =>
    r'31264e0062e9d9a9615ebd6c30ff53396a33762e';

final class FetchSubmissionsWithPublisherFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<SubmissionModel>>, int> {
  FetchSubmissionsWithPublisherFamily._()
    : super(
        retry: null,
        name: r'fetchSubmissionsWithPublisherProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchSubmissionsWithPublisherProvider call(int publisherId) =>
      FetchSubmissionsWithPublisherProvider._(
        argument: publisherId,
        from: this,
      );

  @override
  String toString() => r'fetchSubmissionsWithPublisherProvider';
}

@ProviderFor(fetchSubmissionsPaginated)
final fetchSubmissionsPaginatedProvider = FetchSubmissionsPaginatedFamily._();

final class FetchSubmissionsPaginatedProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SubmissionModel>>,
          List<SubmissionModel>,
          Stream<List<SubmissionModel>>
        >
    with
        $FutureModifier<List<SubmissionModel>>,
        $StreamProvider<List<SubmissionModel>> {
  FetchSubmissionsPaginatedProvider._({
    required FetchSubmissionsPaginatedFamily super.from,
    required (int, int?, List<SubmissionStatus>) super.argument,
  }) : super(
         retry: null,
         name: r'fetchSubmissionsPaginatedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchSubmissionsPaginatedHash();

  @override
  String toString() {
    return r'fetchSubmissionsPaginatedProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<List<SubmissionModel>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<SubmissionModel>> create(Ref ref) {
    final argument = this.argument as (int, int?, List<SubmissionStatus>);
    return fetchSubmissionsPaginated(
      ref,
      argument.$1,
      argument.$2,
      argument.$3,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FetchSubmissionsPaginatedProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchSubmissionsPaginatedHash() =>
    r'3c776acfe634b37983f54e89fa96d7e6cbe33e2d';

final class FetchSubmissionsPaginatedFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<List<SubmissionModel>>,
          (int, int?, List<SubmissionStatus>)
        > {
  FetchSubmissionsPaginatedFamily._()
    : super(
        retry: null,
        name: r'fetchSubmissionsPaginatedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchSubmissionsPaginatedProvider call(
    int limit,
    int? offset,
    List<SubmissionStatus> statusFilters,
  ) => FetchSubmissionsPaginatedProvider._(
    argument: (limit, offset, statusFilters),
    from: this,
  );

  @override
  String toString() => r'fetchSubmissionsPaginatedProvider';
}

@ProviderFor(fetchSubmissionsByDateRange)
final fetchSubmissionsByDateRangeProvider =
    FetchSubmissionsByDateRangeFamily._();

final class FetchSubmissionsByDateRangeProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<SubmissionModel>>,
          List<SubmissionModel>,
          Stream<List<SubmissionModel>>
        >
    with
        $FutureModifier<List<SubmissionModel>>,
        $StreamProvider<List<SubmissionModel>> {
  FetchSubmissionsByDateRangeProvider._({
    required FetchSubmissionsByDateRangeFamily super.from,
    required (DateTime, DateTime) super.argument,
  }) : super(
         retry: null,
         name: r'fetchSubmissionsByDateRangeProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchSubmissionsByDateRangeHash();

  @override
  String toString() {
    return r'fetchSubmissionsByDateRangeProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $StreamProviderElement<List<SubmissionModel>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<SubmissionModel>> create(Ref ref) {
    final argument = this.argument as (DateTime, DateTime);
    return fetchSubmissionsByDateRange(ref, argument.$1, argument.$2);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchSubmissionsByDateRangeProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchSubmissionsByDateRangeHash() =>
    r'e3c232f7ac8d97a6433bad27b4150fb0907ec83b';

final class FetchSubmissionsByDateRangeFamily extends $Family
    with
        $FunctionalFamilyOverride<
          Stream<List<SubmissionModel>>,
          (DateTime, DateTime)
        > {
  FetchSubmissionsByDateRangeFamily._()
    : super(
        retry: null,
        name: r'fetchSubmissionsByDateRangeProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchSubmissionsByDateRangeProvider call(
    DateTime dateTimeStart,
    DateTime dateTimeEnd,
  ) => FetchSubmissionsByDateRangeProvider._(
    argument: (dateTimeStart, dateTimeEnd),
    from: this,
  );

  @override
  String toString() => r'fetchSubmissionsByDateRangeProvider';
}
