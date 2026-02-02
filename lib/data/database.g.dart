// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CommentsTableTable extends CommentsTable
    with TableInfo<$CommentsTableTable, CommentEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CommentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _bodyMeta = const VerificationMeta('body');
  @override
  late final GeneratedColumn<String> body = GeneratedColumn<String>(
    'body',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, body];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'comments_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<CommentEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('body')) {
      context.handle(
        _bodyMeta,
        body.isAcceptableOrUnknown(data['body']!, _bodyMeta),
      );
    } else if (isInserting) {
      context.missing(_bodyMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CommentEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CommentEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      body: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body'],
      )!,
    );
  }

  @override
  $CommentsTableTable createAlias(String alias) {
    return $CommentsTableTable(attachedDatabase, alias);
  }
}

class CommentEntry extends DataClass implements Insertable<CommentEntry> {
  final int id;
  final String body;
  const CommentEntry({required this.id, required this.body});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['body'] = Variable<String>(body);
    return map;
  }

  CommentsTableCompanion toCompanion(bool nullToAbsent) {
    return CommentsTableCompanion(id: Value(id), body: Value(body));
  }

  factory CommentEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CommentEntry(
      id: serializer.fromJson<int>(json['id']),
      body: serializer.fromJson<String>(json['body']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'body': serializer.toJson<String>(body),
    };
  }

  CommentEntry copyWith({int? id, String? body}) =>
      CommentEntry(id: id ?? this.id, body: body ?? this.body);
  CommentEntry copyWithCompanion(CommentsTableCompanion data) {
    return CommentEntry(
      id: data.id.present ? data.id.value : this.id,
      body: data.body.present ? data.body.value : this.body,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CommentEntry(')
          ..write('id: $id, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, body);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CommentEntry && other.id == this.id && other.body == this.body);
}

class CommentsTableCompanion extends UpdateCompanion<CommentEntry> {
  final Value<int> id;
  final Value<String> body;
  const CommentsTableCompanion({
    this.id = const Value.absent(),
    this.body = const Value.absent(),
  });
  CommentsTableCompanion.insert({
    this.id = const Value.absent(),
    required String body,
  }) : body = Value(body);
  static Insertable<CommentEntry> custom({
    Expression<int>? id,
    Expression<String>? body,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (body != null) 'body': body,
    });
  }

  CommentsTableCompanion copyWith({Value<int>? id, Value<String>? body}) {
    return CommentsTableCompanion(id: id ?? this.id, body: body ?? this.body);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (body.present) {
      map['body'] = Variable<String>(body.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CommentsTableCompanion(')
          ..write('id: $id, ')
          ..write('body: $body')
          ..write(')'))
        .toString();
  }
}

class $PublishersTableTable extends PublishersTable
    with TableInfo<$PublishersTableTable, PublisherEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PublishersTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'publishers_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<PublisherEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PublisherEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PublisherEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
    );
  }

  @override
  $PublishersTableTable createAlias(String alias) {
    return $PublishersTableTable(attachedDatabase, alias);
  }
}

class PublisherEntry extends DataClass implements Insertable<PublisherEntry> {
  final int id;
  final String title;
  const PublisherEntry({required this.id, required this.title});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    return map;
  }

  PublishersTableCompanion toCompanion(bool nullToAbsent) {
    return PublishersTableCompanion(id: Value(id), title: Value(title));
  }

  factory PublisherEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PublisherEntry(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
    };
  }

  PublisherEntry copyWith({int? id, String? title}) =>
      PublisherEntry(id: id ?? this.id, title: title ?? this.title);
  PublisherEntry copyWithCompanion(PublishersTableCompanion data) {
    return PublisherEntry(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PublisherEntry(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PublisherEntry &&
          other.id == this.id &&
          other.title == this.title);
}

class PublishersTableCompanion extends UpdateCompanion<PublisherEntry> {
  final Value<int> id;
  final Value<String> title;
  const PublishersTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
  });
  PublishersTableCompanion.insert({
    this.id = const Value.absent(),
    required String title,
  }) : title = Value(title);
  static Insertable<PublisherEntry> custom({
    Expression<int>? id,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
    });
  }

  PublishersTableCompanion copyWith({Value<int>? id, Value<String>? title}) {
    return PublishersTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PublishersTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $WorksTableTable extends WorksTable
    with TableInfo<$WorksTableTable, WorkEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WorksTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<WorkType, int> workType =
      GeneratedColumn<int>(
        'work_type',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<WorkType>($WorksTableTable.$converterworkType);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, workType, title];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'works_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<WorkEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WorkEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WorkEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      workType: $WorksTableTable.$converterworkType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}work_type'],
        )!,
      ),
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
    );
  }

  @override
  $WorksTableTable createAlias(String alias) {
    return $WorksTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<WorkType, int, int> $converterworkType =
      const EnumIndexConverter<WorkType>(WorkType.values);
}

class WorkEntry extends DataClass implements Insertable<WorkEntry> {
  final int id;
  final WorkType workType;
  final String title;
  const WorkEntry({
    required this.id,
    required this.workType,
    required this.title,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['work_type'] = Variable<int>(
        $WorksTableTable.$converterworkType.toSql(workType),
      );
    }
    map['title'] = Variable<String>(title);
    return map;
  }

  WorksTableCompanion toCompanion(bool nullToAbsent) {
    return WorksTableCompanion(
      id: Value(id),
      workType: Value(workType),
      title: Value(title),
    );
  }

  factory WorkEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WorkEntry(
      id: serializer.fromJson<int>(json['id']),
      workType: $WorksTableTable.$converterworkType.fromJson(
        serializer.fromJson<int>(json['workType']),
      ),
      title: serializer.fromJson<String>(json['title']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'workType': serializer.toJson<int>(
        $WorksTableTable.$converterworkType.toJson(workType),
      ),
      'title': serializer.toJson<String>(title),
    };
  }

  WorkEntry copyWith({int? id, WorkType? workType, String? title}) => WorkEntry(
    id: id ?? this.id,
    workType: workType ?? this.workType,
    title: title ?? this.title,
  );
  WorkEntry copyWithCompanion(WorksTableCompanion data) {
    return WorkEntry(
      id: data.id.present ? data.id.value : this.id,
      workType: data.workType.present ? data.workType.value : this.workType,
      title: data.title.present ? data.title.value : this.title,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WorkEntry(')
          ..write('id: $id, ')
          ..write('workType: $workType, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, workType, title);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WorkEntry &&
          other.id == this.id &&
          other.workType == this.workType &&
          other.title == this.title);
}

class WorksTableCompanion extends UpdateCompanion<WorkEntry> {
  final Value<int> id;
  final Value<WorkType> workType;
  final Value<String> title;
  const WorksTableCompanion({
    this.id = const Value.absent(),
    this.workType = const Value.absent(),
    this.title = const Value.absent(),
  });
  WorksTableCompanion.insert({
    this.id = const Value.absent(),
    required WorkType workType,
    required String title,
  }) : workType = Value(workType),
       title = Value(title);
  static Insertable<WorkEntry> custom({
    Expression<int>? id,
    Expression<int>? workType,
    Expression<String>? title,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (workType != null) 'work_type': workType,
      if (title != null) 'title': title,
    });
  }

  WorksTableCompanion copyWith({
    Value<int>? id,
    Value<WorkType>? workType,
    Value<String>? title,
  }) {
    return WorksTableCompanion(
      id: id ?? this.id,
      workType: workType ?? this.workType,
      title: title ?? this.title,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (workType.present) {
      map['work_type'] = Variable<int>(
        $WorksTableTable.$converterworkType.toSql(workType.value),
      );
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WorksTableCompanion(')
          ..write('id: $id, ')
          ..write('workType: $workType, ')
          ..write('title: $title')
          ..write(')'))
        .toString();
  }
}

class $SubmissionsTableTable extends SubmissionsTable
    with TableInfo<$SubmissionsTableTable, SubmissionEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SubmissionsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _workMeta = const VerificationMeta('work');
  @override
  late final GeneratedColumn<int> work = GeneratedColumn<int>(
    'work',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES works_table (id)',
    ),
  );
  static const VerificationMeta _publisherMeta = const VerificationMeta(
    'publisher',
  );
  @override
  late final GeneratedColumn<int> publisher = GeneratedColumn<int>(
    'publisher',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES publishers_table (id)',
    ),
  );
  @override
  late final GeneratedColumnWithTypeConverter<SubmissionStatus, int> status =
      GeneratedColumn<int>(
        'status',
        aliasedName,
        false,
        type: DriftSqlType.int,
        requiredDuringInsert: true,
      ).withConverter<SubmissionStatus>(
        $SubmissionsTableTable.$converterstatus,
      );
  static const VerificationMeta _submissionDateMeta = const VerificationMeta(
    'submissionDate',
  );
  @override
  late final GeneratedColumn<DateTime> submissionDate =
      GeneratedColumn<DateTime>(
        'submission_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    work,
    publisher,
    status,
    submissionDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'submissions_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<SubmissionEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('work')) {
      context.handle(
        _workMeta,
        work.isAcceptableOrUnknown(data['work']!, _workMeta),
      );
    } else if (isInserting) {
      context.missing(_workMeta);
    }
    if (data.containsKey('publisher')) {
      context.handle(
        _publisherMeta,
        publisher.isAcceptableOrUnknown(data['publisher']!, _publisherMeta),
      );
    } else if (isInserting) {
      context.missing(_publisherMeta);
    }
    if (data.containsKey('submission_date')) {
      context.handle(
        _submissionDateMeta,
        submissionDate.isAcceptableOrUnknown(
          data['submission_date']!,
          _submissionDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_submissionDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SubmissionEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SubmissionEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      work: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}work'],
      )!,
      publisher: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}publisher'],
      )!,
      status: $SubmissionsTableTable.$converterstatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}status'],
        )!,
      ),
      submissionDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}submission_date'],
      )!,
    );
  }

  @override
  $SubmissionsTableTable createAlias(String alias) {
    return $SubmissionsTableTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SubmissionStatus, int, int> $converterstatus =
      const EnumIndexConverter<SubmissionStatus>(SubmissionStatus.values);
}

class SubmissionEntry extends DataClass implements Insertable<SubmissionEntry> {
  final int id;
  final int work;
  final int publisher;
  final SubmissionStatus status;
  final DateTime submissionDate;
  const SubmissionEntry({
    required this.id,
    required this.work,
    required this.publisher,
    required this.status,
    required this.submissionDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['work'] = Variable<int>(work);
    map['publisher'] = Variable<int>(publisher);
    {
      map['status'] = Variable<int>(
        $SubmissionsTableTable.$converterstatus.toSql(status),
      );
    }
    map['submission_date'] = Variable<DateTime>(submissionDate);
    return map;
  }

  SubmissionsTableCompanion toCompanion(bool nullToAbsent) {
    return SubmissionsTableCompanion(
      id: Value(id),
      work: Value(work),
      publisher: Value(publisher),
      status: Value(status),
      submissionDate: Value(submissionDate),
    );
  }

  factory SubmissionEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SubmissionEntry(
      id: serializer.fromJson<int>(json['id']),
      work: serializer.fromJson<int>(json['work']),
      publisher: serializer.fromJson<int>(json['publisher']),
      status: $SubmissionsTableTable.$converterstatus.fromJson(
        serializer.fromJson<int>(json['status']),
      ),
      submissionDate: serializer.fromJson<DateTime>(json['submissionDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'work': serializer.toJson<int>(work),
      'publisher': serializer.toJson<int>(publisher),
      'status': serializer.toJson<int>(
        $SubmissionsTableTable.$converterstatus.toJson(status),
      ),
      'submissionDate': serializer.toJson<DateTime>(submissionDate),
    };
  }

  SubmissionEntry copyWith({
    int? id,
    int? work,
    int? publisher,
    SubmissionStatus? status,
    DateTime? submissionDate,
  }) => SubmissionEntry(
    id: id ?? this.id,
    work: work ?? this.work,
    publisher: publisher ?? this.publisher,
    status: status ?? this.status,
    submissionDate: submissionDate ?? this.submissionDate,
  );
  SubmissionEntry copyWithCompanion(SubmissionsTableCompanion data) {
    return SubmissionEntry(
      id: data.id.present ? data.id.value : this.id,
      work: data.work.present ? data.work.value : this.work,
      publisher: data.publisher.present ? data.publisher.value : this.publisher,
      status: data.status.present ? data.status.value : this.status,
      submissionDate: data.submissionDate.present
          ? data.submissionDate.value
          : this.submissionDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SubmissionEntry(')
          ..write('id: $id, ')
          ..write('work: $work, ')
          ..write('publisher: $publisher, ')
          ..write('status: $status, ')
          ..write('submissionDate: $submissionDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, work, publisher, status, submissionDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SubmissionEntry &&
          other.id == this.id &&
          other.work == this.work &&
          other.publisher == this.publisher &&
          other.status == this.status &&
          other.submissionDate == this.submissionDate);
}

class SubmissionsTableCompanion extends UpdateCompanion<SubmissionEntry> {
  final Value<int> id;
  final Value<int> work;
  final Value<int> publisher;
  final Value<SubmissionStatus> status;
  final Value<DateTime> submissionDate;
  const SubmissionsTableCompanion({
    this.id = const Value.absent(),
    this.work = const Value.absent(),
    this.publisher = const Value.absent(),
    this.status = const Value.absent(),
    this.submissionDate = const Value.absent(),
  });
  SubmissionsTableCompanion.insert({
    this.id = const Value.absent(),
    required int work,
    required int publisher,
    required SubmissionStatus status,
    required DateTime submissionDate,
  }) : work = Value(work),
       publisher = Value(publisher),
       status = Value(status),
       submissionDate = Value(submissionDate);
  static Insertable<SubmissionEntry> custom({
    Expression<int>? id,
    Expression<int>? work,
    Expression<int>? publisher,
    Expression<int>? status,
    Expression<DateTime>? submissionDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (work != null) 'work': work,
      if (publisher != null) 'publisher': publisher,
      if (status != null) 'status': status,
      if (submissionDate != null) 'submission_date': submissionDate,
    });
  }

  SubmissionsTableCompanion copyWith({
    Value<int>? id,
    Value<int>? work,
    Value<int>? publisher,
    Value<SubmissionStatus>? status,
    Value<DateTime>? submissionDate,
  }) {
    return SubmissionsTableCompanion(
      id: id ?? this.id,
      work: work ?? this.work,
      publisher: publisher ?? this.publisher,
      status: status ?? this.status,
      submissionDate: submissionDate ?? this.submissionDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (work.present) {
      map['work'] = Variable<int>(work.value);
    }
    if (publisher.present) {
      map['publisher'] = Variable<int>(publisher.value);
    }
    if (status.present) {
      map['status'] = Variable<int>(
        $SubmissionsTableTable.$converterstatus.toSql(status.value),
      );
    }
    if (submissionDate.present) {
      map['submission_date'] = Variable<DateTime>(submissionDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SubmissionsTableCompanion(')
          ..write('id: $id, ')
          ..write('work: $work, ')
          ..write('publisher: $publisher, ')
          ..write('status: $status, ')
          ..write('submissionDate: $submissionDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CommentsTableTable commentsTable = $CommentsTableTable(this);
  late final $PublishersTableTable publishersTable = $PublishersTableTable(
    this,
  );
  late final $WorksTableTable worksTable = $WorksTableTable(this);
  late final $SubmissionsTableTable submissionsTable = $SubmissionsTableTable(
    this,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    commentsTable,
    publishersTable,
    worksTable,
    submissionsTable,
  ];
}

typedef $$CommentsTableTableCreateCompanionBuilder =
    CommentsTableCompanion Function({Value<int> id, required String body});
typedef $$CommentsTableTableUpdateCompanionBuilder =
    CommentsTableCompanion Function({Value<int> id, Value<String> body});

class $$CommentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $CommentsTableTable> {
  $$CommentsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CommentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $CommentsTableTable> {
  $$CommentsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get body => $composableBuilder(
    column: $table.body,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CommentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $CommentsTableTable> {
  $$CommentsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get body =>
      $composableBuilder(column: $table.body, builder: (column) => column);
}

class $$CommentsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CommentsTableTable,
          CommentEntry,
          $$CommentsTableTableFilterComposer,
          $$CommentsTableTableOrderingComposer,
          $$CommentsTableTableAnnotationComposer,
          $$CommentsTableTableCreateCompanionBuilder,
          $$CommentsTableTableUpdateCompanionBuilder,
          (
            CommentEntry,
            BaseReferences<_$AppDatabase, $CommentsTableTable, CommentEntry>,
          ),
          CommentEntry,
          PrefetchHooks Function()
        > {
  $$CommentsTableTableTableManager(_$AppDatabase db, $CommentsTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CommentsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CommentsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CommentsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> body = const Value.absent(),
              }) => CommentsTableCompanion(id: id, body: body),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String body}) =>
                  CommentsTableCompanion.insert(id: id, body: body),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CommentsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CommentsTableTable,
      CommentEntry,
      $$CommentsTableTableFilterComposer,
      $$CommentsTableTableOrderingComposer,
      $$CommentsTableTableAnnotationComposer,
      $$CommentsTableTableCreateCompanionBuilder,
      $$CommentsTableTableUpdateCompanionBuilder,
      (
        CommentEntry,
        BaseReferences<_$AppDatabase, $CommentsTableTable, CommentEntry>,
      ),
      CommentEntry,
      PrefetchHooks Function()
    >;
typedef $$PublishersTableTableCreateCompanionBuilder =
    PublishersTableCompanion Function({Value<int> id, required String title});
typedef $$PublishersTableTableUpdateCompanionBuilder =
    PublishersTableCompanion Function({Value<int> id, Value<String> title});

final class $$PublishersTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $PublishersTableTable, PublisherEntry> {
  $$PublishersTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$SubmissionsTableTable, List<SubmissionEntry>>
  _submissionsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.submissionsTable,
    aliasName: $_aliasNameGenerator(
      db.publishersTable.id,
      db.submissionsTable.publisher,
    ),
  );

  $$SubmissionsTableTableProcessedTableManager get submissionsTableRefs {
    final manager = $$SubmissionsTableTableTableManager(
      $_db,
      $_db.submissionsTable,
    ).filter((f) => f.publisher.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _submissionsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PublishersTableTableFilterComposer
    extends Composer<_$AppDatabase, $PublishersTableTable> {
  $$PublishersTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> submissionsTableRefs(
    Expression<bool> Function($$SubmissionsTableTableFilterComposer f) f,
  ) {
    final $$SubmissionsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.submissionsTable,
      getReferencedColumn: (t) => t.publisher,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubmissionsTableTableFilterComposer(
            $db: $db,
            $table: $db.submissionsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PublishersTableTableOrderingComposer
    extends Composer<_$AppDatabase, $PublishersTableTable> {
  $$PublishersTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PublishersTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $PublishersTableTable> {
  $$PublishersTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  Expression<T> submissionsTableRefs<T extends Object>(
    Expression<T> Function($$SubmissionsTableTableAnnotationComposer a) f,
  ) {
    final $$SubmissionsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.submissionsTable,
      getReferencedColumn: (t) => t.publisher,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubmissionsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.submissionsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PublishersTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PublishersTableTable,
          PublisherEntry,
          $$PublishersTableTableFilterComposer,
          $$PublishersTableTableOrderingComposer,
          $$PublishersTableTableAnnotationComposer,
          $$PublishersTableTableCreateCompanionBuilder,
          $$PublishersTableTableUpdateCompanionBuilder,
          (PublisherEntry, $$PublishersTableTableReferences),
          PublisherEntry,
          PrefetchHooks Function({bool submissionsTableRefs})
        > {
  $$PublishersTableTableTableManager(
    _$AppDatabase db,
    $PublishersTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PublishersTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PublishersTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PublishersTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
              }) => PublishersTableCompanion(id: id, title: title),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required String title}) =>
                  PublishersTableCompanion.insert(id: id, title: title),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$PublishersTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({submissionsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (submissionsTableRefs) db.submissionsTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (submissionsTableRefs)
                    await $_getPrefetchedData<
                      PublisherEntry,
                      $PublishersTableTable,
                      SubmissionEntry
                    >(
                      currentTable: table,
                      referencedTable: $$PublishersTableTableReferences
                          ._submissionsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$PublishersTableTableReferences(
                            db,
                            table,
                            p0,
                          ).submissionsTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.publisher == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$PublishersTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PublishersTableTable,
      PublisherEntry,
      $$PublishersTableTableFilterComposer,
      $$PublishersTableTableOrderingComposer,
      $$PublishersTableTableAnnotationComposer,
      $$PublishersTableTableCreateCompanionBuilder,
      $$PublishersTableTableUpdateCompanionBuilder,
      (PublisherEntry, $$PublishersTableTableReferences),
      PublisherEntry,
      PrefetchHooks Function({bool submissionsTableRefs})
    >;
typedef $$WorksTableTableCreateCompanionBuilder =
    WorksTableCompanion Function({
      Value<int> id,
      required WorkType workType,
      required String title,
    });
typedef $$WorksTableTableUpdateCompanionBuilder =
    WorksTableCompanion Function({
      Value<int> id,
      Value<WorkType> workType,
      Value<String> title,
    });

final class $$WorksTableTableReferences
    extends BaseReferences<_$AppDatabase, $WorksTableTable, WorkEntry> {
  $$WorksTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SubmissionsTableTable, List<SubmissionEntry>>
  _submissionsTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.submissionsTable,
    aliasName: $_aliasNameGenerator(db.worksTable.id, db.submissionsTable.work),
  );

  $$SubmissionsTableTableProcessedTableManager get submissionsTableRefs {
    final manager = $$SubmissionsTableTableTableManager(
      $_db,
      $_db.submissionsTable,
    ).filter((f) => f.work.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _submissionsTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$WorksTableTableFilterComposer
    extends Composer<_$AppDatabase, $WorksTableTable> {
  $$WorksTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<WorkType, WorkType, int> get workType =>
      $composableBuilder(
        column: $table.workType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> submissionsTableRefs(
    Expression<bool> Function($$SubmissionsTableTableFilterComposer f) f,
  ) {
    final $$SubmissionsTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.submissionsTable,
      getReferencedColumn: (t) => t.work,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubmissionsTableTableFilterComposer(
            $db: $db,
            $table: $db.submissionsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorksTableTableOrderingComposer
    extends Composer<_$AppDatabase, $WorksTableTable> {
  $$WorksTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get workType => $composableBuilder(
    column: $table.workType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WorksTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $WorksTableTable> {
  $$WorksTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<WorkType, int> get workType =>
      $composableBuilder(column: $table.workType, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  Expression<T> submissionsTableRefs<T extends Object>(
    Expression<T> Function($$SubmissionsTableTableAnnotationComposer a) f,
  ) {
    final $$SubmissionsTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.submissionsTable,
      getReferencedColumn: (t) => t.work,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SubmissionsTableTableAnnotationComposer(
            $db: $db,
            $table: $db.submissionsTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$WorksTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $WorksTableTable,
          WorkEntry,
          $$WorksTableTableFilterComposer,
          $$WorksTableTableOrderingComposer,
          $$WorksTableTableAnnotationComposer,
          $$WorksTableTableCreateCompanionBuilder,
          $$WorksTableTableUpdateCompanionBuilder,
          (WorkEntry, $$WorksTableTableReferences),
          WorkEntry,
          PrefetchHooks Function({bool submissionsTableRefs})
        > {
  $$WorksTableTableTableManager(_$AppDatabase db, $WorksTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WorksTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WorksTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WorksTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<WorkType> workType = const Value.absent(),
                Value<String> title = const Value.absent(),
              }) =>
                  WorksTableCompanion(id: id, workType: workType, title: title),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required WorkType workType,
                required String title,
              }) => WorksTableCompanion.insert(
                id: id,
                workType: workType,
                title: title,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$WorksTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({submissionsTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (submissionsTableRefs) db.submissionsTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (submissionsTableRefs)
                    await $_getPrefetchedData<
                      WorkEntry,
                      $WorksTableTable,
                      SubmissionEntry
                    >(
                      currentTable: table,
                      referencedTable: $$WorksTableTableReferences
                          ._submissionsTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$WorksTableTableReferences(
                            db,
                            table,
                            p0,
                          ).submissionsTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.work == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$WorksTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $WorksTableTable,
      WorkEntry,
      $$WorksTableTableFilterComposer,
      $$WorksTableTableOrderingComposer,
      $$WorksTableTableAnnotationComposer,
      $$WorksTableTableCreateCompanionBuilder,
      $$WorksTableTableUpdateCompanionBuilder,
      (WorkEntry, $$WorksTableTableReferences),
      WorkEntry,
      PrefetchHooks Function({bool submissionsTableRefs})
    >;
typedef $$SubmissionsTableTableCreateCompanionBuilder =
    SubmissionsTableCompanion Function({
      Value<int> id,
      required int work,
      required int publisher,
      required SubmissionStatus status,
      required DateTime submissionDate,
    });
typedef $$SubmissionsTableTableUpdateCompanionBuilder =
    SubmissionsTableCompanion Function({
      Value<int> id,
      Value<int> work,
      Value<int> publisher,
      Value<SubmissionStatus> status,
      Value<DateTime> submissionDate,
    });

final class $$SubmissionsTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $SubmissionsTableTable, SubmissionEntry> {
  $$SubmissionsTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $WorksTableTable _workTable(_$AppDatabase db) =>
      db.worksTable.createAlias(
        $_aliasNameGenerator(db.submissionsTable.work, db.worksTable.id),
      );

  $$WorksTableTableProcessedTableManager get work {
    final $_column = $_itemColumn<int>('work')!;

    final manager = $$WorksTableTableTableManager(
      $_db,
      $_db.worksTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_workTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $PublishersTableTable _publisherTable(_$AppDatabase db) =>
      db.publishersTable.createAlias(
        $_aliasNameGenerator(
          db.submissionsTable.publisher,
          db.publishersTable.id,
        ),
      );

  $$PublishersTableTableProcessedTableManager get publisher {
    final $_column = $_itemColumn<int>('publisher')!;

    final manager = $$PublishersTableTableTableManager(
      $_db,
      $_db.publishersTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_publisherTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SubmissionsTableTableFilterComposer
    extends Composer<_$AppDatabase, $SubmissionsTableTable> {
  $$SubmissionsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<SubmissionStatus, SubmissionStatus, int>
  get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get submissionDate => $composableBuilder(
    column: $table.submissionDate,
    builder: (column) => ColumnFilters(column),
  );

  $$WorksTableTableFilterComposer get work {
    final $$WorksTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.work,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableFilterComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PublishersTableTableFilterComposer get publisher {
    final $$PublishersTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.publisher,
      referencedTable: $db.publishersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PublishersTableTableFilterComposer(
            $db: $db,
            $table: $db.publishersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubmissionsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SubmissionsTableTable> {
  $$SubmissionsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get submissionDate => $composableBuilder(
    column: $table.submissionDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$WorksTableTableOrderingComposer get work {
    final $$WorksTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.work,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableOrderingComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PublishersTableTableOrderingComposer get publisher {
    final $$PublishersTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.publisher,
      referencedTable: $db.publishersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PublishersTableTableOrderingComposer(
            $db: $db,
            $table: $db.publishersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubmissionsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SubmissionsTableTable> {
  $$SubmissionsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SubmissionStatus, int> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get submissionDate => $composableBuilder(
    column: $table.submissionDate,
    builder: (column) => column,
  );

  $$WorksTableTableAnnotationComposer get work {
    final $$WorksTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.work,
      referencedTable: $db.worksTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$WorksTableTableAnnotationComposer(
            $db: $db,
            $table: $db.worksTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$PublishersTableTableAnnotationComposer get publisher {
    final $$PublishersTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.publisher,
      referencedTable: $db.publishersTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PublishersTableTableAnnotationComposer(
            $db: $db,
            $table: $db.publishersTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SubmissionsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SubmissionsTableTable,
          SubmissionEntry,
          $$SubmissionsTableTableFilterComposer,
          $$SubmissionsTableTableOrderingComposer,
          $$SubmissionsTableTableAnnotationComposer,
          $$SubmissionsTableTableCreateCompanionBuilder,
          $$SubmissionsTableTableUpdateCompanionBuilder,
          (SubmissionEntry, $$SubmissionsTableTableReferences),
          SubmissionEntry,
          PrefetchHooks Function({bool work, bool publisher})
        > {
  $$SubmissionsTableTableTableManager(
    _$AppDatabase db,
    $SubmissionsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SubmissionsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SubmissionsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SubmissionsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> work = const Value.absent(),
                Value<int> publisher = const Value.absent(),
                Value<SubmissionStatus> status = const Value.absent(),
                Value<DateTime> submissionDate = const Value.absent(),
              }) => SubmissionsTableCompanion(
                id: id,
                work: work,
                publisher: publisher,
                status: status,
                submissionDate: submissionDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int work,
                required int publisher,
                required SubmissionStatus status,
                required DateTime submissionDate,
              }) => SubmissionsTableCompanion.insert(
                id: id,
                work: work,
                publisher: publisher,
                status: status,
                submissionDate: submissionDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SubmissionsTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({work = false, publisher = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (work) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.work,
                                referencedTable:
                                    $$SubmissionsTableTableReferences
                                        ._workTable(db),
                                referencedColumn:
                                    $$SubmissionsTableTableReferences
                                        ._workTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (publisher) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.publisher,
                                referencedTable:
                                    $$SubmissionsTableTableReferences
                                        ._publisherTable(db),
                                referencedColumn:
                                    $$SubmissionsTableTableReferences
                                        ._publisherTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SubmissionsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SubmissionsTableTable,
      SubmissionEntry,
      $$SubmissionsTableTableFilterComposer,
      $$SubmissionsTableTableOrderingComposer,
      $$SubmissionsTableTableAnnotationComposer,
      $$SubmissionsTableTableCreateCompanionBuilder,
      $$SubmissionsTableTableUpdateCompanionBuilder,
      (SubmissionEntry, $$SubmissionsTableTableReferences),
      SubmissionEntry,
      PrefetchHooks Function({bool work, bool publisher})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CommentsTableTableTableManager get commentsTable =>
      $$CommentsTableTableTableManager(_db, _db.commentsTable);
  $$PublishersTableTableTableManager get publishersTable =>
      $$PublishersTableTableTableManager(_db, _db.publishersTable);
  $$WorksTableTableTableManager get worksTable =>
      $$WorksTableTableTableManager(_db, _db.worksTable);
  $$SubmissionsTableTableTableManager get submissionsTable =>
      $$SubmissionsTableTableTableManager(_db, _db.submissionsTable);
}
