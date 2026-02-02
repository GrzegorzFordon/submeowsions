// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_repo_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Comments)
final commentsProvider = CommentsProvider._();

final class CommentsProvider extends $NotifierProvider<Comments, CommentRepo> {
  CommentsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commentsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commentsHash();

  @$internal
  @override
  Comments create() => Comments();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommentRepo value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommentRepo>(value),
    );
  }
}

String _$commentsHash() => r'31cc2a3e6ec13c8bb986cb653d202914ced7b06a';

abstract class _$Comments extends $Notifier<CommentRepo> {
  CommentRepo build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CommentRepo, CommentRepo>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CommentRepo, CommentRepo>,
              CommentRepo,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
