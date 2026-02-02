import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:submeowsions/models/submission_model.dart';
import 'package:submeowsions/providers/repository_providers/submission_repo_provider.dart';
import 'package:submeowsions/providers/theme_provider.dart';

class StatsScreenMain extends ConsumerWidget {
  const StatsScreenMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SubmissionsStatistic(dateRangeType: DateRangeType.month),
          Divider(color: themeData.colorScheme.onSurface.withAlpha(50),indent: 20,endIndent: 20,radius: BorderRadius.circular(5),),
          SubmissionsStatistic(dateRangeType: DateRangeType.year),
          Divider(color: themeData.colorScheme.onSurface.withAlpha(50),indent: 20,endIndent: 20,radius: BorderRadius.circular(5),),
          SubmissionsStatistic(dateRangeType: DateRangeType.all),
        ],
      ),
    );
  }

  // Future<void> createDatabaseBackup(AppDatabase database) async {
  //   final chosenDirectory = await FilePicker.platform.getDirectoryPath();
  //   if (chosenDirectory == null) return;
  //   final parent = Directory(chosenDirectory);
  //   final dateTime = DateFormat.yMd().format(DateTime.now());
  //   final file = File(p.join(chosenDirectory, "submissionsBackup.db"));
  //   if (!await parent.exists()) await parent.create(recursive: true);
  //   if (await file.exists()) await file.delete();
  //   await database.customStatement('VACUUM INTO ?', [file.absolute.path]);
  // }
  // void deleteAllEntries(WidgetRef ref) {
  //   ref.read(databaseProvider).delete(ref.read(databaseProvider).publishersTable).go();
  //   ref.read(databaseProvider).delete(ref.read(databaseProvider).worksTable).go();
  //   ref.read(databaseProvider).delete(ref.read(databaseProvider).submissionsTable).go();
  // }
}

class SubmissionsStatistic extends ConsumerWidget {
  final DateRangeType dateRangeType;
  const SubmissionsStatistic({super.key, required this.dateRangeType});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    DateTime dateTimeStart = switch (dateRangeType) {
      DateRangeType.month => DateTime(DateTime.now().year, DateTime.now().month),
      DateRangeType.year => DateTime(DateTime.now().year),
      DateRangeType.all => DateTime(0),
    };
    DateTime dateTimeEnd = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 1);
    String durationString = switch (dateRangeType) {
      DateRangeType.month => "this month",
      DateRangeType.year => "this year",
      DateRangeType.all => "(all time)",
    };

    var submissionsStream = ref.watch(fetchSubmissionsByDateRangeProvider(dateTimeStart, dateTimeEnd));
    var submissions = submissionsStream.maybeWhen(data: (data) => data, orElse: () => <SubmissionModel>[]);
    var submissionsAmount = submissions.length;
    var acceptedSubmissionsAmount = submissions.where((element) => element.status == SubmissionStatus.accepted).length;

    var textStyle = GoogleFonts.ebGaramond(color: themeData.colorScheme.onSurfaceVariant,fontSize: 24);
    return Column(
      children: [
        Text("Submissions $durationString: $submissionsAmount", style: textStyle),
        Text("Accepted Submissions $durationString: $acceptedSubmissionsAmount", style: textStyle),
      ],
    );
  }
}

enum DateRangeType { month, year, all }
