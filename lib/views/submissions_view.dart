import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:submeowsions/models/submission_model.dart';
import 'package:submeowsions/providers/theme_provider.dart';
import 'package:submeowsions/widgets/submission_widget.dart';

class SubmissionsView extends ConsumerWidget {
  final String id;
  final SubmissionViewType submissionViewType;
  final List<SubmissionModel> submissions;
  const SubmissionsView({super.key, required this.id, required this.submissionViewType, required this.submissions});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log(id);
    // AsyncValue<List<SubmissionModel>> submissions =
    //     submissionViewType == SubmissionViewType.work
    //     ? ref.watch(fetchSubmissionsWithWorkProvider(int.tryParse(id) ?? 0))
    //     : ref.watch(
    //         fetchSubmissionsWithPublisherProvider(int.tryParse(id) ?? 0),
    //       );

    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: ref.read(themeProvider).colorScheme.primaryContainer.withAlpha(100),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          itemCount: submissions.length,
          separatorBuilder: (context, index) => SizedBox(height: 5),
          itemBuilder: (context, index) => SubmissionWidget(
            model: submissions[index],
            showWorkTitle: submissionViewType == SubmissionViewType.publisher,
            showPublisherTitle: submissionViewType == SubmissionViewType.work,
          ),
        ),
      ),
    );
  }
}

enum SubmissionViewType { work, publisher }
