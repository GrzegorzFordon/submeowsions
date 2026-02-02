import 'package:submeowsions/data/database.dart';
import 'package:submeowsions/models/work_model.dart';

abstract class IWorkRepo {
  Future<List<WorkEntry>> getAll();
  Future<bool> update(WorkEntry entry);
  Stream<List<WorkEntry>> watchAll();
  Future<int> add(WorkModel work);
  Future<int> delete(int id);
}

class WorkRepo implements IWorkRepo {
  final AppDatabase db;
  const WorkRepo(this.db);

  @override
  Future<int> add(WorkModel work) {
    return db
        .into(db.worksTable)
        .insert(
          WorksTableCompanion.insert(workType: work.type, title: work.title),
        );
  }

  @override
  Future<List<WorkEntry>> getAll() {
    return db.select(db.worksTable).get();
  }

  @override
  Stream<List<WorkEntry>> watchAll() {
    return db.select(db.worksTable).watch();
  }

  @override
  Future<bool> update(WorkEntry entry) {
    return db.update(db.worksTable).replace(entry);
  }

  @override
  Future<int> delete(int id) {
    return (db.delete(db.worksTable)..where((tbl) => tbl.id.equals(id))).go();
  }
}
