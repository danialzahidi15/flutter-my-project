import 'package:flutter_riverpod/flutter_riverpod.dart';

class Notes {
  final String title;
  final String contents;

  Notes({
    required this.title,
    required this.contents,
  });
}

class NotesNotifier extends StateNotifier<List<Notes>> {
  NotesNotifier() : super([]);

  void addNote(Notes note) {
    state = [...state, note];
  }

  void deleteNote(Notes note) {
    state = state.where((element) => element != note).toList();
  }
}
