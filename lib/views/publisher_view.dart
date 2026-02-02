import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:submeowsions/models/publisher_model.dart';
import 'package:submeowsions/models/submission_model.dart';
import 'package:submeowsions/models/work_model.dart';
import 'package:submeowsions/providers/repository_providers/publisher_repo_provider.dart';
import 'package:submeowsions/providers/repository_providers/submission_repo_provider.dart';
import 'package:submeowsions/providers/repository_providers/work_repo_provider.dart';
import 'package:submeowsions/providers/theme_provider.dart';
import 'package:submeowsions/views/submissions_view.dart';

class PublisherView extends HookConsumerWidget {
  final String publisherId;
  const PublisherView({super.key, required this.publisherId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    AsyncValue<List<WorkModel>> worksStream = ref.watch(worksProvider);
    AsyncValue<PublisherModel> publisherStream = ref.watch(fetchPublisherProvider(int.parse(publisherId)));

    AsyncValue<List<SubmissionModel>> submissionsStream = ref.watch(
      fetchSubmissionsWithPublisherProvider(int.tryParse(publisherId) ?? 0),
    );

    PublisherModel publisherModel = publisherStream.when(
      data: (data) => data,
      error: (error, stackTrace) => PublisherModel(),
      loading: () => PublisherModel(),
    );
    List<WorkModel> worksList = worksStream.when(
      data: (data) => data,
      error: (error, stackTrace) => <WorkModel>[],
      loading: () => <WorkModel>[],
    );

    List<SubmissionModel> submissionsList = submissionsStream.when(
      data: (data) => data,
      error: (error, stackTrace) => [],
      loading: () => [],
    );
    return Padding(
      padding: EdgeInsetsGeometry.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: themeData.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            Align(child: BackgroundWidget()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                spacing: 5,
                children: [
                  PublisherTitle(model: publisherModel, titleColor: themeData.colorScheme.onSecondaryContainer),
                  PublisherMenu(model: publisherModel, works: worksList),
                  Expanded(
                    flex: 5,
                    child: SubmissionsView(
                      id: publisherId,
                      submissionViewType: SubmissionViewType.publisher,
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
          ],
        ),
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.asset(
        "assets/pub_bg.png",
        // opacity: AlwaysStoppedAnimation(0.5),
        fit: BoxFit.cover,
        repeat: ImageRepeat.repeat,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}

class PublisherTitle extends ConsumerWidget {
  final PublisherModel model;
  final Color titleColor;
  const PublisherTitle({super.key, required this.model, required this.titleColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 50,
      child: TextField(
        decoration: null,
        controller: TextEditingController(text: model.title),
        style: GoogleFonts.ebGaramond(fontSize: 42, height: 1, color: titleColor),
        onSubmitted: (value) => ref.read(publishersProvider.notifier).updatePublisher(model.copyWith(title: value)),
        maxLines: 1,
      ),
    );
  }
}

class PublisherMenu extends ConsumerWidget {
  final PublisherModel model;
  final List<WorkModel> works;
  const PublisherMenu({super.key, required this.model, required this.works});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    return Container(
      height: 56,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        color: themeData.colorScheme.primaryContainer.withAlpha(150),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          Expanded(
            child: CustomSearchBar(themeData: themeData, model: model, works: works),
          ),
          Expanded(
            child: Row(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [DeleteButton(model: model)],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSearchBar extends HookConsumerWidget {
  final PublisherModel model;
  final List<WorkModel> works;
  final ThemeData themeData;
  const CustomSearchBar({super.key, required this.themeData, required this.model, required this.works});

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
        child: Autocomplete<WorkModel>(
          optionsBuilder: (textEditingValue) {
            List<WorkModel> options = works
                .where((element) => element.title.toLowerCase().contains(textEditingValue.text.toLowerCase()))
                .toList();
            if (options.isEmpty) options.add(WorkModel(id: -1, title: textEditingValue.text));
            return options;
          },
          onSelected: (option) => _add(ref, option.id!, controllerHook.text),
          textEditingController: controllerHook,

          focusNode: focusHook,
          fieldViewBuilder: (context, textEditingController, focusNode, onFieldSubmitted) => TextField(
            selectAllOnFocus: true,
            decoration: InputDecoration.collapsed(hintText: "submit...", hintStyle: GoogleFonts.robotoMono()),
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
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Center(
                        child: Text(
                          options.elementAt(index).title + (options.elementAt(index).id == -1 ? "[NEW]" : ""),
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

  Future<void> _add(WidgetRef ref, int workId, String? entry) async {
    log("adding: $model, $workId");
    var wId = workId;
    if (wId == -1) {
      wId = await ref.read(worksProvider.notifier).add(entry!);
    }
    ref.read(submissionsProvider.notifier).add(wId, model.id!);
  }
}

class DeleteButton extends ConsumerWidget {
  final PublisherModel model;
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
      title: Center(child: Text("Delete publisher?", style: GoogleFonts.robotoMono())),
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
                child: Text("Confirm", style: GoogleFonts.robotoMono()),
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
    ref.read(publishersProvider.notifier).delete(id);
    context.pop();
    context.pop();
  }
}

class AddWorkTile extends ConsumerWidget {
  final PublisherModel model;
  final TextEditingController textEditingController;
  const AddWorkTile({super.key, required this.textEditingController, required this.model});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        tileColor: Colors.pink,
        title: Text("Add and Submit"),
        onTap: () async {
          var id = await ref.read(publishersProvider.notifier).add(textEditingController.text);
          ref.read(submissionsProvider.notifier).add(model.id!, id);
        },
      ),
    );
  }
}
