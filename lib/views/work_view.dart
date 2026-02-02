import 'dart:developer';
import 'dart:math' hide log;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pie_menu/pie_menu.dart';
import 'package:submeowsions/models/publisher_model.dart';
import 'package:submeowsions/models/submission_model.dart';
import 'package:submeowsions/models/work_model.dart';
import 'package:submeowsions/providers/repository_providers/publisher_repo_provider.dart';
import 'package:submeowsions/providers/repository_providers/submission_repo_provider.dart';
import 'package:submeowsions/providers/repository_providers/work_repo_provider.dart';
import 'package:submeowsions/providers/theme_provider.dart';
import 'package:submeowsions/views/submissions_view.dart';

class WorkView extends HookConsumerWidget {
  final String workId;
  const WorkView({super.key, required this.workId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);

    AsyncValue<List<SubmissionModel>> submissionsStream = ref.watch(
      fetchSubmissionsWithWorkProvider(int.tryParse(workId) ?? 0),
    );

    AsyncValue<List<PublisherModel>> publishersStream = ref.watch(publishersProvider);

    AsyncValue<WorkModel> workStream = ref.watch(fetchWorkProvider(int.parse(workId)));

    var workModel = workStream.when(
      data: (data) => data,
      error: (_, _) => WorkModel(title: "ERROR"),
      loading: () => WorkModel(title: "LOADING not use effect"),
    );

    List<PublisherModel> publishersList = publishersStream.when(
      data: (data) => data,
      error: (error, stackTrace) => [],
      loading: () => [],
    );

    List<SubmissionModel> submissionsList = submissionsStream.when(
      data: (data) => data,
      error: (error, stackTrace) => [],
      loading: () => [],
    );
    bool hasAcceptedSubmission = submissionsList.any((element) => element.status == SubmissionStatus.accepted);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        clipBehavior: Clip.antiAlias,

        decoration: BoxDecoration(
          color: themeData.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 5,
                children: [
                  WorkTitle(model: workModel, titleColor: themeData.colorScheme.onSecondaryContainer),
                  WorkMenu(model: workModel, publishers: publishersList),
                  Expanded(
                    flex: 5,
                    child: SubmissionsView(
                      id: workId,
                      submissionViewType: SubmissionViewType.work,
                      submissions: submissionsList,
                    ),
                  ),
                ],
              ),
            ),

            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.close)),
            ),

            StampWidget(hasAcceptedSubmission: hasAcceptedSubmission),
          ],
        ),
      ),
    );
  }
}

class WorkTypeWidget extends ConsumerWidget {
  final WorkModel model;
  const WorkTypeWidget({super.key, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.read(themeProvider);
    PieTheme pieTheme = PieTheme(
      overlayColor: Colors.transparent,
      customAngleDiff: 60,
      radius: 40,
      buttonTheme: PieButtonTheme(
        backgroundColor: themeData.colorScheme.primaryContainer,
        iconColor: themeData.colorScheme.primary,
        decoration: null,
      ),
      buttonThemeHovered: PieButtonTheme(
        backgroundColor: themeData.colorScheme.primaryContainer,
        iconColor: themeData.colorScheme.primary,
        decoration: null,
      ),
      childBounceEnabled: false,
      regularPressShowsMenu: true,
      pieBounceDuration: Duration(milliseconds: 150),
      menuAlignment: Alignment.center,
      customAngleAnchor: PieAnchor.center,
      buttonSize: 38,
    );

    return PieMenu(
      theme: pieTheme,
      actions: [
        PieAction(
          tooltip: const Text(""),
          onSelect: () => ref.read(worksProvider.notifier).updateModel(model.copyWith(type: WorkType.poem)),
          child: Icon(_getIcon(WorkType.poem)),
        ),
        PieAction(
          tooltip: const Text(""),
          onSelect: () => ref.read(worksProvider.notifier).updateModel(model.copyWith(type: WorkType.fiction)),
          child: Icon(_getIcon(WorkType.fiction)),
        ),
        PieAction(
          tooltip: const Text(""),
          onSelect: () => ref.read(worksProvider.notifier).updateModel(model.copyWith(type: WorkType.nonfiction)),
          child: Icon(_getIcon(WorkType.nonfiction)),
        ),
        PieAction(
          tooltip: const Text(""),
          onSelect: () => ref.read(worksProvider.notifier).updateModel(model.copyWith(type: WorkType.visual)),
          child: Icon(_getIcon(WorkType.visual)),
        ),
        PieAction(
          tooltip: const Text(""),
          onSelect: () => ref.read(worksProvider.notifier).updateModel(model.copyWith(type: WorkType.audio)),
          child: Icon(_getIcon(WorkType.audio)),
        ),
        PieAction(
          tooltip: const Text(""),
          onSelect: () => ref.read(worksProvider.notifier).updateModel(model.copyWith(type: WorkType.hybrid)),
          child: Icon(_getIcon(WorkType.hybrid)),
        ),
      ],
      child: Icon(_getIcon(model.type), color: ref.read(themeProvider).colorScheme.primary),
    );
  }

  IconData _getIcon(WorkType type) {
    switch (type) {
      case WorkType.poem:
        return Icons.history_edu;
      case WorkType.fiction:
        return Icons.book;
      case WorkType.nonfiction:
        return Icons.newspaper;
      case WorkType.visual:
        return Icons.brush;
      case WorkType.audio:
        return Icons.audio_file;
      case WorkType.hybrid:
        return Icons.blender;
    }
  }
}

class WorkMenu extends ConsumerWidget {
  final WorkModel model;
  final List<PublisherModel> publishers;

  const WorkMenu({super.key, required this.model, required this.publishers});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: themeData.colorScheme.primaryContainer.withAlpha(150),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        spacing: 5,
        children: [
          Expanded(
            child: CustomSearchBar(themeData: themeData, model: model, publishers: publishers),
          ),
          Expanded(
            child: Row(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                WorkTypeWidget(model: model),
                DeleteButton(model: model),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StampWidget extends HookWidget {
  final bool hasAcceptedSubmission;
  const StampWidget({super.key, required this.hasAcceptedSubmission});

  @override
  Widget build(BuildContext context) {
    var stampOffset = useState(
      Offset(Random().nextInt(40) - 50, Random().nextInt(20) - 50) +
          MediaQuery.sizeOf(context).center(Offset(0, 0)) * 0.5,
    );
    var stampRotationAngles = useState((Random().nextInt(50) - 25) / 360);
    double opacity = hasAcceptedSubmission ? 0.9 : 0.0;
    return IgnorePointer(
      child: Transform.translate(
        // top: stampOffset.value.dx,
        // right: stampOffset.value.dy,
        offset: stampOffset.value,
        child: Transform.rotate(
          angle: stampRotationAngles.value,
          // turns: AlwaysStoppedAnimation(stampRotationAngles.value),
          child: Image.asset('assets/stamp2.png', opacity: AlwaysStoppedAnimation(opacity), scale: 5),
        ),
      ),
    );
  }
}

class WorkTitle extends ConsumerWidget {
  final WorkModel model;
  final Color titleColor;
  const WorkTitle({super.key, required this.titleColor, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 50,
      child: TextField(
        decoration: null,
        controller: TextEditingController(text: model.title),
        style: GoogleFonts.ebGaramond(fontSize: 42, height: 1, color: titleColor),
        onSubmitted: (value) => ref.read(worksProvider.notifier).updateModel(model.copyWith(title: value)),
        maxLines: 1,
      ),
    );
  }
}

class CustomSearchBar extends HookConsumerWidget {
  final WorkModel model;
  final List<PublisherModel> publishers;
  final ThemeData themeData;
  const CustomSearchBar({super.key, required this.themeData, required this.model, required this.publishers});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var controllerHook = useTextEditingController();
    var focusHook = useFocusNode();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 30,
      decoration: BoxDecoration(
        color: themeData.colorScheme.onPrimaryContainer.withAlpha(100),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Autocomplete<PublisherModel>(
          optionsBuilder: (textEditingValue) {
            List<PublisherModel> options = publishers
                .where((element) => element.title.toLowerCase().contains(textEditingValue.text.toLowerCase()))
                .toList();
            if (options.isEmpty) options.add(PublisherModel(id: -1, title: textEditingValue.text));
            return options;
          },
          onSelected: (option) => _add(ref, option.id!, controllerHook.text),
          textEditingController: controllerHook,

          focusNode: focusHook,
          fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) => TextField(
            selectAllOnFocus: true,
            decoration: InputDecoration.collapsed(hintText: "submit to...", hintStyle: GoogleFonts.robotoMono()),
            controller: textEditingController,
            focusNode: focusNode,
            onSubmitted: (value) => onFieldSubmitted,
          ),
          displayStringForOption: (option) => option.title,
          optionsViewBuilder: (context, onSelected, options) => Container(
            decoration: BoxDecoration(
              color: themeData.colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: options.length,
              itemBuilder: (context, index) => Card(
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      onSelected(options.elementAt(index));
                      controllerHook.text = "";
                      focusHook.unfocus();
                    },
                    child: Container(
                      height: 35,
                      decoration: BoxDecoration(
                        color: options.elementAt(index).id == -1
                            ? themeData.colorScheme.onTertiaryContainer
                            : themeData.colorScheme.tertiaryContainer,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          options.elementAt(index).id == -1 ? "[Add Publisher]" : options.elementAt(index).title,

                          textAlign: TextAlign.center,
                          style: GoogleFonts.robotoMono(
                            fontSize: 14,
                            color: options.elementAt(index).id == -1
                                ? themeData.colorScheme.tertiaryContainer
                                : themeData.colorScheme.onTertiaryContainer,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              separatorBuilder: (BuildContext context, int index) => SizedBox(height: 0),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _add(WidgetRef ref, int publisherId, String? entry) async {
    log("adding: $model, $publisherId");
    var pubId = publisherId;
    if (pubId == -1) {
      pubId = await ref.read(publishersProvider.notifier).add(entry!);
    }
    ref.read(submissionsProvider.notifier).add(model.id!, pubId);
  }
}

class DeleteButton extends ConsumerWidget {
  final WorkModel model;
  const DeleteButton({super.key, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    return IconButton(
      onPressed: () => _showDialog(context, ref),
      icon: Icon(Icons.delete, color: themeData.colorScheme.onError.withAlpha(150)),
    );
  }

  void _showDialog(BuildContext context, WidgetRef ref) {
    SimpleDialog simpleDialog = SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      title: Center(child: Text("Delete work?", style: GoogleFonts.robotoMono())),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SimpleDialogOption(
              child: TextButton(
                onPressed: context.pop,
                child: Text("Cancel", style: GoogleFonts.robotoMono()),
              ),
            ),
            SimpleDialogOption(
              child: TextButton(
                onPressed: () => _delete(context, ref, model.id!),
                child: Text("Confirm", style: GoogleFonts.robotoMono(color: ref.read(themeProvider).colorScheme.error)),
              ),
            ),
          ],
        ),
      ],
    );

    showDialog<void>(
      context: context,
      builder: (context) => Container(height: 300, child: simpleDialog),
    );
  }

  void _delete(BuildContext context, WidgetRef ref, int id) {
    ref.read(worksProvider.notifier).delete(id);
    context.pop();
    context.pop();
  }
}
