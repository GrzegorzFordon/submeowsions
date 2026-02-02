import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:submeowsions/models/submission_model.dart';
import 'package:submeowsions/models/work_model.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

@DriftDatabase(
  tables: [CommentsTable, PublishersTable, SubmissionsTable, WorksTable],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'database',
      native: DriftNativeOptions(
        databasePath: () async {
          final dbFolder = await getApplicationDocumentsDirectory();
          final file = File(p.join(dbFolder.path,'database.db'));
          if(!await file.exists()){
            final blob = await rootBundle.load('assets/data.db');
            final buffer = blob.buffer;
            await file.writeAsBytes(buffer.asUint8List(blob.offsetInBytes,blob.lengthInBytes));
          }
          return file.path;
        }
      ),
    );
  }
}

@DataClassName("CommentEntry")
class CommentsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get body => text()();
}

@DataClassName("PublisherEntry")
class PublishersTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
}

@DataClassName("SubmissionEntry")
class SubmissionsTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get work => integer().references(WorksTable, #id)();
  IntColumn get publisher => integer().references(PublishersTable, #id)();
  IntColumn get status => intEnum<SubmissionStatus>()();
  DateTimeColumn get submissionDate => dateTime()();
}

@DataClassName("WorkEntry")
class WorksTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workType => intEnum<WorkType>()();
  TextColumn get title => text()();
}
