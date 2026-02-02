import 'package:submeowsions/data/database.dart';
import 'package:submeowsions/models/publisher_model.dart';

abstract class IPublisherRepo {
  Future<List<PublisherEntry>> getAll();
  Future<bool> update(PublisherEntry entry);
  Stream<List<PublisherEntry>> watchAll();
  Future<int> add(PublisherModel work);
  Future<int> delete(int id);
}

class PublisherRepo implements IPublisherRepo {
  final AppDatabase db;
  const PublisherRepo(this.db);

  @override
  Future<int> add(PublisherModel work) {
    return db
        .into(db.publishersTable)
        .insert(PublishersTableCompanion.insert(title: work.title));
  }

  @override
  Future<List<PublisherEntry>> getAll() {
    return db.select(db.publishersTable).get();
  }

  @override
  Future<bool> update(PublisherEntry entry) {
    return db.update(db.publishersTable).replace(entry);
  }

  @override
  Stream<List<PublisherEntry>> watchAll() {
    return db.select(db.publishersTable).watch();
  }

  @override
  Future<int> delete(int id) {
    return (db.delete(
      db.publishersTable,
    )..where((tbl) => tbl.id.equals(id))).go();
  }
}
