import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_types_provider.g.dart';

@Riverpod(keepAlive: true)
class SearchTypes extends _$SearchTypes {
  @override
  (bool, bool) build() {
    return (true, true);
  }

  void set({bool? works, bool? pubs}) {
    var newState = (works ?? state.$1, pubs ?? state.$2);
    if (newState == (false, false))
      state = (!state.$1, !state.$2);
    else
      state = newState;
  }
}
