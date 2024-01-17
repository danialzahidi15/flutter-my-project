import 'package:flutter/material.dart';
import 'package:flutter_danthocode/features/notes/controller/note_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final noteProvider = StateNotifierProvider<NotesNotifier, List<Notes>>((ref) => NotesNotifier());

class NotesScreen extends ConsumerStatefulWidget {
  const NotesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotesScreenState();
}

class _NotesScreenState extends ConsumerState<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    final noteList = ref.watch(noteProvider);
    final titleController = TextEditingController();
    final contentController = TextEditingController();

    return Scaffold(
      appBar: AppBar(),
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      content: Column(
                        children: [
                          TextField(
                            controller: titleController,
                            decoration: InputDecoration(
                                labelText: 'Title',
                                labelStyle: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(height: 20),
                          TextField(
                            controller: contentController,
                            decoration: InputDecoration(
                                labelText: 'Notes',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            ref.read(noteProvider.notifier).addNote(Notes(
                                  title: titleController.text,
                                  contents: contentController.text,
                                ));
                            Navigator.pop(context);
                          },
                          child: const Text('Add note'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 2,
                primary: Colors.white,
              ),
              child: const Text(
                'Add Note',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            noteList.isEmpty
                ? const Text('Add Note')
                : ListView.builder(
                    shrinkWrap: true,
                    itemCount: noteList.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: ListTile(
                          title: Text(noteList[index].title),
                          subtitle: Text(noteList[index].contents),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete_outline),
                            onPressed: () {
                              ref.read(noteProvider.notifier).deleteNote(noteList[index]);
                            },
                          ),
                          shape: Border.all(
                            color: Colors.black26,
                          ),
                        ),
                      );
                    }),
                  ),
          ],
        ),
      ),
    );
  }
}
