import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:submeowsions/models/submission_model.dart';
import 'package:submeowsions/providers/repository_providers/submission_repo_provider.dart';
import 'package:submeowsions/providers/theme_provider.dart';
import 'package:submeowsions/widgets/submission_widget.dart';

class ListScreenMain extends HookConsumerWidget {
  const ListScreenMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int limit = 6;
    ValueNotifier<int> page = useState(0);

    ValueNotifier<Set<SubmissionStatus>> filters = useState(<SubmissionStatus>{
      SubmissionStatus.accepted,
      SubmissionStatus.pending,
      SubmissionStatus.rejected,
      SubmissionStatus.withdrawn,
    });

    var filterslist = useState(filters.value.toList());
    useEffect(() {
      filterslist.value = filters.value.toList();
      return null;
    }, [filters.value]);

    var submissions = ref.watch(
      fetchSubmissionsPaginatedProvider(
        limit,
        page.value * limit,
        filterslist.value,
      ),
    );
    
    bool currentPageHasValues = submissions.hasValue & submissions.hasValue
        ? submissions.value!.isNotEmpty
        : false;

    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              spacing: 5,
              children: [
                FilterWidget(filters: filters),
                Expanded(
                  child: SubmissionsWidget(
                    submissions: submissions.maybeWhen(
                      data: (data) => data,
                      orElse: () => [],
                    ),
                  ),
                ),
                PageWidget(
                  page: page,
                  currentPageHasValues: currentPageHasValues,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SubmissionsWidget extends ConsumerWidget {
  final List<SubmissionModel> submissions;
  const SubmissionsWidget({super.key, required this.submissions});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);

    return Stack(
      children: [
        Center(
          child: Icon(
            Symbols.emoji_nature_rounded,
            size: 256,
            color: themeData.colorScheme.secondaryContainer.withAlpha(10),
          ),
        ),
        ListView.separated(
          itemBuilder: (context, index) =>
              SubmissionWidget(model: submissions[index]),
          separatorBuilder: (_, _) => SizedBox(height: 5),
          itemCount: submissions.length,
        ),
      ],
    );
  }
}

class FilterWidget extends ConsumerWidget {
  final ValueNotifier<Set<SubmissionStatus>> filters;
  const FilterWidget({super.key, required this.filters});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SegmentedButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(5))),
            elevation: WidgetStatePropertyAll(0),
          ),
          emptySelectionAllowed: true,
          showSelectedIcon: false,
          segments: SubmissionStatus.values
              .map(
                (e) => ButtonSegment(
                  icon: Icon(_getIcon(e)),
                  value: e,
                  enabled: true,
                ),
              )
              .toList(),
          selected: filters.value,
          onSelectionChanged: (newSelection) => filters.value = newSelection,
          multiSelectionEnabled: true,
        ),
      ],
    );
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

class PageWidget extends StatelessWidget {
  final ValueNotifier<int> page;
  final bool currentPageHasValues;
  const PageWidget({
    super.key,
    required this.page,
    required this.currentPageHasValues,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: page.value == 0
              ? null
              : () => page.value = max(page.value - 1, 0),
          icon: Icon(Icons.arrow_back_rounded),
        ),
        Text("${page.value}"),
        IconButton(
          onPressed: !currentPageHasValues
              ? null
              : () => page.value = page.value + 1,
          icon: Icon(Icons.arrow_forward_rounded),
        ),
      ],
    );
  }
}
