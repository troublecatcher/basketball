import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masonry_view/flutter_masonry_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../api/models/note.dart';
import '../api/notes.dart';

enum BottomSheetMode {
  create,
  edit,
}

final TextEditingController titleController = TextEditingController();
final TextEditingController contentController = TextEditingController();

@RoutePage()
class NotesScreen extends ConsumerStatefulWidget {
  const NotesScreen({Key? key}) : super(key: key);

  void _showBottomSheet(
      BuildContext context, WidgetRef ref, BottomSheetMode mode,
      {Note? note}) {
    titleController.text = note?.title ?? '';
    contentController.text = note?.content ?? '';

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 40,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Note details',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: titleController,
                    autofocus: true,
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Title...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: contentController,
                    maxLines: 8,
                    decoration: InputDecoration(
                      hintText: 'Content...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          titleController.clear();
                          contentController.clear();
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: () async {
                          final title = titleController.text;
                          final content = contentController.text;
                          if (title.isNotEmpty && content.isNotEmpty) {
                            if (mode == BottomSheetMode.create) {
                              ref.read(notesNotifierProvider.notifier).addNote(
                                    title: title,
                                    content: content,
                                  );
                            } else if (mode == BottomSheetMode.edit) {
                              final noteId = note?.id;
                              if (noteId != null) {
                                ref
                                    .read(notesNotifierProvider.notifier)
                                    .editNote(
                                      id: noteId,
                                      title: title,
                                      content: content,
                                    );
                              }
                            }
                            titleController.clear();
                            contentController.clear();
                            Navigator.pop(context);
                            ref
                                .read(notesNotifierProvider.notifier)
                                .fetchNotes();
                          }
                        },
                        child: const Text('Save'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  ConsumerState<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends ConsumerState<NotesScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(notesNotifierProvider.notifier).fetchNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: const Color.fromRGBO(82, 41, 17, 1),
        centerTitle: true,
        title: Text(
          'Notes',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: Consumer(builder: (context, watch, child) {
        final notes = ref.watch(notesNotifierProvider);
        return Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: MasonryView(
            listOfItem: notes,
            numberOfColumn: 2,
            itemBuilder: (note) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromRGBO(244, 117, 44, 1)),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: SvgPicture.asset(
                                'assets/icons/notes/trash.svg'),
                            onPressed: () {
                              ref
                                  .read(notesNotifierProvider.notifier)
                                  .deleteNote(
                                    id: note.id,
                                  );
                            },
                          ),
                          IconButton(
                            icon:
                                SvgPicture.asset('assets/icons/notes/edit.svg'),
                            onPressed: () {
                              widget._showBottomSheet(
                                  context, ref, BottomSheetMode.edit,
                                  note: note);
                            },
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 15, bottom: 15, left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              note.title,
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                            Text(
                              note.content,
                              style: Theme.of(context).textTheme.displaySmall,
                            ),
                          ],
                        ),
                      )
                    ]),
              );
            },
          ),
        );
      }),
      floatingActionButton: SizedBox(
        height: 100,
        width: 100,
        child: FittedBox(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: FloatingActionButton(
              onPressed: () async {
                // final SharedPreferences sharedPreferences =
                //     await SharedPreferences.getInstance();
                // print(sharedPreferences.getStringList('notes'));
                widget._showBottomSheet(context, ref, BottomSheetMode.create);
              },
              elevation: 0,
              backgroundColor: const Color.fromRGBO(244, 117, 44, 1),
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
