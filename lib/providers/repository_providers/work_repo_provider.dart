import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:submeowsions/data/database.dart';
import 'package:submeowsions/models/work_model.dart';
import 'package:submeowsions/providers/database_provider.dart';
import 'package:submeowsions/data/repositories/work_repo.dart';
import 'package:submeowsions/providers/repository_providers/submission_repo_provider.dart';

part 'work_repo_provider.g.dart';

@riverpod
class Works extends _$Works {
  late AppDatabase db;
  late WorkRepo repo;

  @override
  Stream<List<WorkModel>> build() {
    db = ref.watch(databaseProvider);
    repo = WorkRepo(db);
    var query = db.select(db.worksTable);
    return query
        .map(
          (entry) =>
              WorkModel(id: entry.id, title: entry.title, type: entry.workType),
        )
        .watch();
  }

  Future<int> add(String title) async {
    WorkModel model = WorkModel(title: title);
    return repo.add(model);
  }

  Future<bool> updateModel(WorkModel model) {
    WorkEntry entry = WorkEntry(
      id: model.id!,
      workType: model.type,
      title: model.title,
    );
    return repo.update(entry);
  }

  Future<int> delete(int id) {
    ref.read(submissionsProvider.notifier).deleteAllFromWork(id);
    return repo.delete(id);
  }
}

@Riverpod(keepAlive: true)
Stream<WorkModel> fetchWork(Ref ref, int id) {
  log("fetchwork");
  var db = ref.watch(databaseProvider);
  var query = db.select(db.worksTable)..where((tbl) => tbl.id.equals(id));
  return query
      .map(
        (entry) =>
            WorkModel(id: entry.id, title: entry.title, type: entry.workType),
      )
      .watchSingle();
}
