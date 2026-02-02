
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recent_searches_provider.g.dart';

@Riverpod(keepAlive: true)
class RecentSearches extends _$RecentSearches {
  @override
  List<(Type,int)> build() {
    return [];
  }

  void add(Type type, int id) {
    if (state.contains((type,id))) state = state..remove((type,id));
    state = state..add((type,id));
    if(state.length > 5) state = state..removeAt(0);
  }

  void clear() => state = [];
}
enum Type {work,publisher}