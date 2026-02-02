import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:submeowsions/data/database.dart';
import 'package:submeowsions/models/publisher_model.dart';
import 'package:submeowsions/providers/database_provider.dart';
import 'package:submeowsions/data/repositories/publisher_repo.dart';
import 'package:submeowsions/providers/repository_providers/submission_repo_provider.dart';

part 'publisher_repo_provider.g.dart';

@riverpod
class Publishers extends _$Publishers {
  late AppDatabase db;
  late PublisherRepo repo;

  @override
  Stream<List<PublisherModel>> build() {
    db = ref.watch(databaseProvider);
    repo = PublisherRepo(db);
    var query = db.select(db.publishersTable);
    return query
        .map((entry) => PublisherModel(id: entry.id, title: entry.title))
        .watch();
  }

  Future<int> add(String title) async {
    PublisherModel model = PublisherModel(title: title);
    return repo.add(model);
  }

  Future<bool> updatePublisher(PublisherModel model) {
    PublisherEntry entry = PublisherEntry(id: model.id!, title: model.title);
    return repo.update(entry);
  }

  Future<int> delete(int id){
    ref.read(submissionsProvider.notifier).deleteAllFromPublisher(id);
    return repo.delete(id);
  }
}

@riverpod
Stream<PublisherModel> fetchPublisher(Ref ref, int id) {
  var db = ref.watch(databaseProvider);
  var query = db.select(db.publishersTable)..where((tbl) => tbl.id.equals(id));
  return query
      .map((entry) => PublisherModel(id: entry.id, title: entry.title))
      .watchSingle();
}
