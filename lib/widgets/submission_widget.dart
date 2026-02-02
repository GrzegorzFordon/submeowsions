import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:submeowsions/models/publisher_model.dart';
import 'package:submeowsions/models/submission_model.dart';
import 'package:submeowsions/models/work_model.dart';
import 'package:submeowsions/providers/repository_providers/publisher_repo_provider.dart';
import 'package:submeowsions/providers/repository_providers/submission_repo_provider.dart';
import 'package:submeowsions/providers/repository_providers/work_repo_provider.dart';
import 'package:submeowsions/providers/theme_provider.dart';

class SubmissionWidget extends ConsumerWidget {
  final bool showWorkTitle;
  final bool showPublisherTitle;
  final SubmissionModel model;
  const SubmissionWidget({super.key, required this.model, this.showWorkTitle = true, this.showPublisherTitle = true});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    AsyncValue<WorkModel> work = ref.watch(fetchWorkProvider(model.workId));
    AsyncValue<PublisherModel> publisher = ref.watch(fetchPublisherProvider(model.publisherId));

    WorkModel workModel = work.maybeWhen(data: (data) => data, orElse: () => WorkModel());

    PublisherModel publisherModel = publisher.maybeWhen(data: (data) => data, orElse: () => PublisherModel());

    TextStyle textStyle = GoogleFonts.robotoMono(
      color: themeData.colorScheme.onSecondaryContainer,
      fontSize: 12,
      decoration: model.status == SubmissionStatus.rejected ? TextDecoration.lineThrough : null,
    );

    Color containerColor = themeData.colorScheme.secondaryContainer;

    switch (model.status) {
      case SubmissionStatus.accepted:
        containerColor = const Color.fromARGB(255, 112, 161, 90);
        break;
      case SubmissionStatus.rejected:
        containerColor = themeData.colorScheme.surfaceBright;
      default:
    }

    return AnimatedContainer(
      duration: Duration(milliseconds: 100),
      alignment: Alignment.center,
      padding: EdgeInsets.all(8.0),
      height: 50,
      decoration: BoxDecoration(color: containerColor.withAlpha(150), borderRadius: BorderRadius.circular(5)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (showWorkTitle)
            Expanded(
              child: CustomButton(
                text: workModel.title,
                onTapCallback: () => context.push("/works/${workModel.id!}"),
                textStyle: textStyle,
              ),
            ),
          if (showPublisherTitle)
            Expanded(
              child: CustomButton(
                text: publisherModel.title,
                onTapCallback: () => context.push("/publishers/${publisherModel.id!}"),
                textStyle: textStyle,
              ),
            ),
          Expanded(
            child: CustomButton(
              text: DateFormat.yMd().format(model.submissionDate),
              onTapCallback: () {
                showDatePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime.now(),).then(
                  (value) => ref
                      .read(submissionsProvider.notifier)
                      .updateSubmission(model.copyWith(submissionDate: value ?? model.submissionDate)),
                );
              },
              textStyle: textStyle,
              // DateFormat.Hms().format(model.submissionDate),
              // style: textStyle,
              // textAlign: TextAlign.center,
            ),
          ),
          Expanded(child: StatusPieMenu(model: model)),
        ],
      ),
    );
  }
}

class StatusPieMenu extends ConsumerWidget {
  final SubmissionModel model;

  const StatusPieMenu({super.key, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    return PieMenu(
      actions: [
        PieAction(
          buttonTheme: PieButtonTheme(
            backgroundColor: themeData.colorScheme.tertiaryContainer,
            iconColor: themeData.colorScheme.onTertiaryContainer,
          ),
          buttonThemeHovered: PieButtonTheme(
            backgroundColor: themeData.colorScheme.tertiaryContainer,
            iconColor: themeData.colorScheme.onTertiaryContainer,
          ),
          tooltip: const Text(""),
          onSelect: () => _updateStatus(newStatus: SubmissionStatus.accepted, ref: ref),
          child: Icon(_getIcon(SubmissionStatus.accepted)),
        ),
        PieAction(
          tooltip: const Text(""),
          onSelect: () => _updateStatus(newStatus: SubmissionStatus.pending, ref: ref),
          child: Icon(_getIcon(SubmissionStatus.pending)),
        ),
        PieAction(
          buttonTheme: PieButtonTheme(
            backgroundColor: themeData.colorScheme.surface,
            iconColor: themeData.colorScheme.onErrorContainer,
          ),
          buttonThemeHovered: PieButtonTheme(
            backgroundColor: themeData.colorScheme.surface,
            iconColor: themeData.colorScheme.onErrorContainer,
          ),
          tooltip: const Text(""),
          onSelect: () => _updateStatus(newStatus: SubmissionStatus.rejected, ref: ref),
          child: Icon(_getIcon(SubmissionStatus.rejected)),
        ),

        PieAction(
          buttonTheme: PieButtonTheme(
            backgroundColor: themeData.colorScheme.errorContainer,
            iconColor: themeData.colorScheme.onErrorContainer,
          ),
          buttonThemeHovered: PieButtonTheme(
            backgroundColor: themeData.colorScheme.errorContainer,
            iconColor: themeData.colorScheme.onErrorContainer,
          ),
          tooltip: const Text(""),
          onSelect: () => ref.read(submissionsProvider.notifier).delete(model.id!),
          child: Icon(Icons.delete),
        ),
        PieAction(
          tooltip: const Text(""),
          onSelect: () => _updateStatus(newStatus: SubmissionStatus.withdrawn, ref: ref),
          child: Icon(_getIcon(SubmissionStatus.withdrawn)),
        ),
      ],
      child: Icon(_getIcon(model.status), color: themeData.colorScheme.onSecondaryContainer),
    );
  }

  void _updateStatus({required SubmissionStatus newStatus, required WidgetRef ref}) {
    ref.read(submissionsProvider.notifier).updateSubmission(model.copyWith(status: newStatus));
  }

  IconData _getIcon(SubmissionStatus status) {
    switch (status) {
      case SubmissionStatus.pending:
        return Symbols.nest_clock_farsight_analog_rounded;
      case SubmissionStatus.accepted:
        return Symbols.editor_choice_rounded;
      case SubmissionStatus.rejected:
        return Symbols.heart_broken_rounded;
      case SubmissionStatus.withdrawn:
        return Symbols.remove_selection_rounded;
    }
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTapCallback;
  final TextStyle textStyle;
  const CustomButton({super.key, required this.text, required this.onTapCallback, required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTapCallback,
        child: Text(text, style: textStyle, textAlign: TextAlign.center),
      ),
    );
  }
}
