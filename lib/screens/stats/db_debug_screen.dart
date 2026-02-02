import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:submeowsions/providers/database_provider.dart';
import 'package:submeowsions/providers/recent_searches_provider.dart';

class DbDebugScreen extends ConsumerWidget {
  const DbDebugScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var db = ref.watch(databaseProvider);
    return Padding(
      padding: EdgeInsetsGeometry.all(8.0),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 300, width: 500, child: DriftDbViewer(db)),
            ],
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton.small(
              onPressed: () {
                ref
                    .read(databaseProvider)
                    .delete(ref.read(databaseProvider).publishersTable)
                    .go();
                ref
                    .read(databaseProvider)
                    .delete(ref.read(databaseProvider).worksTable)
                    .go();
                ref
                    .read(databaseProvider)
                    .delete(ref.read(databaseProvider).submissionsTable)
                    .go();
                ref.read(recentSearchesProvider.notifier).clear();
              },
              child: Icon(Icons.delete_forever),
            ),
          ),
        ],
      ),
    );
  }
}
