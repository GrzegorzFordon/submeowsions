import 'package:submeowsions/data/database.dart';
import 'package:submeowsions/models/submission_model.dart';

abstract class ISubmissionRepo {
  Future<List<SubmissionEntry>> getAll();
  Future<bool> update(SubmissionEntry entry);
  Stream<List<SubmissionEntry>> watchAll();
  Future<int> add(SubmissionModel submission);
  Future<int> delete(int id);
  Future<int> deleteAllFromPublisher(int pubId);
  Future<int> deleteAllFromWork(int workId);
}

class SubmissionRepo implements ISubmissionRepo {
  final AppDatabase db;
  const SubmissionRepo(this.db);

  @override
  Future<int> add(SubmissionModel submission) {
    return db
        .into(db.submissionsTable)
        .insert(
          SubmissionsTableCompanion.insert(
            work: submission.workId,
            publisher: submission.publisherId,
            status: submission.status,
            submissionDate: submission.submissionDate,
          ),
        );
  }

  @override
  Future<List<SubmissionEntry>> getAll() {
    return db.select(db.submissionsTable).get();
  }

  @override
  Future<bool> update(SubmissionEntry entry) {
    return db.update(db.submissionsTable).replace(entry);
  }

  @override
  Stream<List<SubmissionEntry>> watchAll() {
    return db.select(db.submissionsTable).watch();
  }

  @override
  Future<int> delete(int id) {
    return (db.delete(
      db.submissionsTable,
    )..where((tbl) => tbl.id.equals(id))).go();
  }

  @override
  Future<int> deleteAllFromPublisher(int pubId) {
    return (db.delete(
      db.submissionsTable,
    )..where((tbl) => tbl.publisher.equals(pubId))).go();
  }

    @override
  Future<int> deleteAllFromWork(int workId) {
    return (db.delete(
      db.submissionsTable,
    )..where((tbl) => tbl.work.equals(workId))).go();
  }
}
