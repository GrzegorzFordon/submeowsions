import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:submeowsions/data/database.dart';
part 'database_provider.g.dart';

@Riverpod(keepAlive: true)
class Database extends _$Database {
  @override
  AppDatabase build() {
    return AppDatabase();
  }
}
