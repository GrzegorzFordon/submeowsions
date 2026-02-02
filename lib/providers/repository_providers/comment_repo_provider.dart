import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:submeowsions/data/database.dart';
import 'package:submeowsions/providers/database_provider.dart';
import 'package:submeowsions/data/repositories/comment_repo.dart';

part 'comment_repo_provider.g.dart';

@riverpod
class Comments extends _$Comments {
  @override
  CommentRepo build() {
    AppDatabase database = ref.read(databaseProvider);
    return CommentRepo(database);
  }
}
