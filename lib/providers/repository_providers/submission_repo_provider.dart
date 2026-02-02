import 'dart:developer';

import 'package:drift/drift.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:submeowsions/data/database.dart';
import 'package:submeowsions/models/submission_model.dart';
import 'package:submeowsions/providers/database_provider.dart';
import 'package:submeowsions/data/repositories/submission_repo.dart';

part 'submission_repo_provider.g.dart';

@riverpod
class Submissions extends _$Submissions {
  late AppDatabase db;
  late SubmissionRepo repo;
  @override
  Stream<List<SubmissionModel>> build() {
    db = ref.watch(databaseProvider);
    repo = SubmissionRepo(db);
    var query = db.select(db.submissionsTable);
    return query
        .map(
          (entry) => SubmissionModel(
            id: entry.id,
            publisherId: entry.publisher,
            workId: entry.work,
            status: entry.status,
            submissionDate: entry.submissionDate,
          ),
        )
        .watch();
  }

  Future<int> add(int workId, int publisherId) async {
    SubmissionModel model = SubmissionModel(publisherId: publisherId, workId: workId, submissionDate: DateTime.now());
    return repo.add(model);
  }

  Future<bool> updateSubmission(SubmissionModel submission) {
    SubmissionEntry submissionEntry = SubmissionEntry(
      id: submission.id!,
      work: submission.workId,
      publisher: submission.publisherId,
      status: submission.status,
      submissionDate: submission.submissionDate,
    );
    return repo.update(submissionEntry);
  }

  Future<int> delete(int id) {
    return repo.delete(id);
  }

  Future<int> deleteAllFromPublisher(int publisherId) {
    return repo.deleteAllFromPublisher(publisherId);
  }

  Future<int> deleteAllFromWork(int workId) {
    return repo.deleteAllFromWork(workId);
  }
}

@riverpod
Stream<SubmissionModel> fetchSubmission(Ref ref, int id) {
  var db = ref.watch(databaseProvider);
  var query = db.select(db.submissionsTable)..where((tbl) => tbl.id.equals(id));
  return query
      .map(
        (entry) => SubmissionModel(
          id: entry.id,
          publisherId: entry.publisher,
          workId: entry.work,
          status: entry.status,
          submissionDate: entry.submissionDate,
        ),
      )
      .watchSingle();
}

@riverpod
Stream<List<SubmissionModel>> fetchSubmissionsWithWork(Ref ref, int workId) {
  var db = ref.watch(databaseProvider);
  var query = db.select(db.submissionsTable)
    ..where((tbl) => tbl.work.equals(workId))
    ..orderBy([(t) => OrderingTerm.desc(t.submissionDate)]);
  return query
      .map(
        (entry) => SubmissionModel(
          id: entry.id,
          publisherId: entry.publisher,
          workId: entry.work,
          status: entry.status,
          submissionDate: entry.submissionDate,
        ),
      )
      .watch();
}

@riverpod
Stream<List<SubmissionModel>> fetchSubmissionsWithPublisher(Ref ref, int publisherId) {
  var db = ref.watch(databaseProvider);
  var query = db.select(db.submissionsTable)
    ..where((tbl) => tbl.publisher.equals(publisherId))
    ..orderBy([(t) => OrderingTerm.desc(t.submissionDate)]);
  return query
      .map(
        (entry) => SubmissionModel(
          id: entry.id,
          publisherId: entry.publisher,
          workId: entry.work,
          status: entry.status,
          submissionDate: entry.submissionDate,
        ),
      )
      .watch();
}

@riverpod
Stream<List<SubmissionModel>> fetchSubmissionsPaginated(
  Ref ref,
  int limit,
  int? offset,
  List<SubmissionStatus> statusFilters,
) {
  var db = ref.watch(databaseProvider);
  var query = db.select(db.submissionsTable)
    ..where((tbl) => tbl.status.isInValues(statusFilters))
    ..limit(limit, offset: offset)
    ..orderBy([(t) => OrderingTerm.desc(t.submissionDate)]);

  return query
      .map(
        (entry) => SubmissionModel(
          id: entry.id,
          publisherId: entry.publisher,
          workId: entry.work,
          status: entry.status,
          submissionDate: entry.submissionDate,
        ),
      )
      .watch();
}

@riverpod
Stream<List<SubmissionModel>> fetchSubmissionsByDateRange(Ref ref,DateTime dateTimeStart,DateTime dateTimeEnd) {
  var db = ref.watch(databaseProvider);
  var query = db.select(db.submissionsTable)
    ..where((tbl) => tbl.submissionDate.isBetweenValues(dateTimeStart, dateTimeEnd))
    ..orderBy([(t) => OrderingTerm.desc(t.submissionDate)]);

  return query
      .map(
        (entry) => SubmissionModel(
          id: entry.id,
          publisherId: entry.publisher,
          workId: entry.work,
          status: entry.status,
          submissionDate: entry.submissionDate,
        ),
      )
      .watch();
}
