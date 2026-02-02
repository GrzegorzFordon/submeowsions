import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:path/path.dart';
import 'package:submeowsions/data/database.dart';
import 'package:submeowsions/models/publisher_model.dart';
import 'package:submeowsions/models/work_model.dart';
import 'package:submeowsions/providers/recent_searches_provider.dart';
import 'package:submeowsions/providers/repository_providers/publisher_repo_provider.dart';
import 'package:submeowsions/providers/repository_providers/work_repo_provider.dart';
import 'package:submeowsions/providers/search_types_provider.dart';
import 'package:submeowsions/providers/theme_provider.dart';
import 'package:submeowsions/widgets/theme_variant_picker_widget.dart';

class SearchScreenMain extends HookConsumerWidget {
  const SearchScreenMain({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);

    var textController = useTextEditingController();
    AsyncValue<List<WorkModel>> works = ref.watch(worksProvider);
    AsyncValue<List<PublisherModel>> publishers = ref.watch(publishersProvider);

    List<WorkModel> worksList = works.maybeWhen(
      data: (data) => data,
      orElse: () => List.empty(),
    );
    List<PublisherModel> publishersList = publishers.maybeWhen(
      data: (data) => data,
      orElse: () => List.empty(),
    );

    return Stack(
      children: [
        Center(
          child: Icon(
            Symbols.raven,
            size: 256,
            color: themeData.colorScheme.secondaryContainer.withAlpha(10),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SearchBar(
                  textController: textController,
                  works: worksList,
                  publishers: publishersList,
                  themeData: themeData,
                ),
                SizedBox(child: SearchCategoriesWidget()),
                // Flexible(child: ThemeVariantPickerWidget()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class EmptyBuilderWidget extends StatelessWidget {
  final TextEditingController textEditingController;

  // final String entry;

  const EmptyBuilderWidget({
    super.key,
    // required this.entry,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    // return textEditingController.text == ""
    //     ? RecentEntriesWidget()
    //     : AddNewEntryWidget(textEditingController: textEditingController);
    return textEditingController.text == ""
        ? SizedBox()
        : AddNewEntryWidget(textEditingController: textEditingController);
  }
}

class AddNewEntryWidget extends ConsumerWidget {
  final TextEditingController textEditingController;
  // final String entry;
  const AddNewEntryWidget({
    super.key,
    // required this.entry,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    (bool, bool) searchTypes = ref.watch(searchTypesProvider);
    return ListView(
      shrinkWrap: true,
      children: [
        if (searchTypes.$1)
          ListTile(
            title: Text("Add as Work"),
            onTap: () async {
              var id = await ref
                  .read(worksProvider.notifier)
                  .add(textEditingController.text);
              context.push("/works/$id");
              textEditingController.clear();
            },
          ),
        if (searchTypes.$2)
          ListTile(
            title: Text("Add as Publisher"),
            onTap: () async {
              var id = await ref
                  .read(publishersProvider.notifier)
                  .add(textEditingController.text);
              context.push("/publishers/$id");
              textEditingController.clear();
            },
          ),
      ],
    );
  }
}

// class RecentEntriesWidget extends ConsumerWidget {
//   const RecentEntriesWidget({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     ThemeData themeData = ref.watch(themeProvider);
//     var recentSearches = ref.watch(recentSearchesProvider);
//     return ListView.builder(
//       reverse: true,
//       shrinkWrap: true,
//       itemCount: recentSearches.length,
//       itemBuilder: (_, value) {
//         if (recentSearches[value] is WorkModel) {
//           return ListTile(
//             tileColor: themeData.colorScheme.secondaryContainer,
//             title: Text(
//               recentSearches[value].title,
//               style: GoogleFonts.robotoMono(
//                 color: themeData.colorScheme.onSecondaryContainer,
//               ),
//             ),
//             onTap: () {
//               context.push("/works/${recentSearches[value].id}");
//               ref
//                   .read(recentSearchesProvider.notifier)
//                   .add(recentSearches[value]);
//             },
//             trailing: Icon(
//               recentSearches[value].getIcon(),
//               size: 18,
//               color: themeData.colorScheme.primary,
//             ),
//           );
//         } else if (recentSearches[value] is PublisherModel) {
//           return ListTile(
//             tileColor: themeData.colorScheme.secondaryContainer,
//             title: Text(
//               recentSearches[value].title,
//               style: GoogleFonts.robotoMono(
//                 color: themeData.colorScheme.tertiary,
//               ),
//             ),
//             onTap: () {
//               context.push("/publishers/${recentSearches[value].id}");
//               ref
//                   .read(recentSearchesProvider.notifier)
//                   .add(recentSearches[value]);
//             },
//             trailing: Icon(
//               Symbols.newsmode_rounded,
//               size: 18,
//               color: themeData.colorScheme.tertiary,
//             ),
//           );
//         } else {
//           return ListTile(title: Text("data"));
//         }
//       },
//     );
//   }
// }

class SearchBar extends ConsumerWidget {
  final List<WorkModel> works;
  final List<PublisherModel> publishers;
  final TextEditingController textController;
  final ThemeData themeData;
  const SearchBar({
    super.key,
    required this.textController,
    required this.works,
    required this.publishers,
    required this.themeData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    (bool, bool) searchTypes = ref.watch(searchTypesProvider);
    return SizedBox(
      width: 300,
      child: TypeAheadField(
        animationDuration: Duration(milliseconds: 100),
        debounceDuration: Duration(milliseconds: 50),
        controller: textController,
        builder: (context, controller, focusNode) => TextField(
          autofocus: true,
          controller: controller,
          focusNode: focusNode,
          style: GoogleFonts.robotoMono(),
          decoration: InputDecoration(border: UnderlineInputBorder()),
        ),
        itemBuilder: (context, value) {
          if (value is WorkModel) {
            return ListTile(
              tileColor: themeData.colorScheme.secondaryContainer,
              title: Text(
                value.title,
                style: GoogleFonts.robotoMono(
                  color: themeData.colorScheme.onSecondaryContainer,
                ),
              ),
              trailing: Icon(
                value.getIcon(),
                size: 18,
                color: themeData.colorScheme.primary,
              ),
            );
          } else if (value is PublisherModel) {
            return ListTile(
              tileColor: themeData.colorScheme.secondaryContainer,
              title: Text(
                value.title,
                style: GoogleFonts.robotoMono(
                  color: themeData.colorScheme.tertiary,
                ),
              ),
              trailing: Icon(
                Symbols.newsmode_rounded,
                size: 18,
                color: themeData.colorScheme.tertiary,
              ),
            );
          } else {
            return ListTile(title: Text("data"));
          }
        },

        onSelected: (value) {
          textController.clear();
          log("message");
          // ref.read(recentSearchesProvider.notifier).add(value);
          if (value is WorkModel) context.push("/works/${value.id}");
          if (value is PublisherModel) context.push("/publishers/${value.id}");
        },

        suggestionsCallback: (search) {
          List<WorkModel> worksQueryList = searchTypes.$1
              ? works
                    .where(
                      (element) => element.title.toLowerCase().contains(
                        search.toLowerCase(),
                      ),
                    )
                    .toList()
              : [];

          List<PublisherModel> publishersQueryList = searchTypes.$2
              ? publishers
                    .where(
                      (element) => element.title.toLowerCase().contains(
                        search.toLowerCase(),
                      ),
                    )
                    .toList()
              : [];

          return search == ""
              ? []
              : [...worksQueryList, ...publishersQueryList];
        },
        emptyBuilder: (context) =>
            EmptyBuilderWidget(textEditingController: textController),
      ),
    );
  }
}

class SearchCategoriesWidget extends ConsumerWidget {
  const SearchCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData themeData = ref.watch(themeProvider);
    (bool, bool) searchTypes = ref.watch(searchTypesProvider);
    return Row(
      spacing: 20,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: searchTypes.$1,
              onChanged: (value) => ref
                  .read(searchTypesProvider.notifier)
                  .set(works: !searchTypes.$1),
            ),
            Icon(
              Icons.edit_rounded,
              color: themeData.colorScheme.secondaryContainer,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: searchTypes.$2,
              onChanged: (value) => ref
                  .read(searchTypesProvider.notifier)
                  .set(pubs: !searchTypes.$2),
            ),
            Icon(
              Icons.book_outlined,
              color: themeData.colorScheme.secondaryContainer,
            ),
          ],
        ),
      ],
    );
  }
}
