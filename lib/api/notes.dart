import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/note.dart';

final notesNotifierProvider = StateNotifierProvider<NotesNotifier, List<Note>>(
  (ref) => NotesNotifier([]),
);

class NotesNotifier extends StateNotifier<List<Note>> {
  NotesNotifier(List<Note> state) : super(state);

  Future<void> fetchNotes() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final notes = sharedPreferences.getStringList('notes') ?? [];
    final parsedNotes = notes.map((note) {
      final noteParts = note.split(':');
      return Note(
        id: UniqueKey().toString(),
        title: noteParts[0],
        content: noteParts[1],
      );
    }).toList();
    state = parsedNotes;
  }

  Future<void> addNote({
    required String title,
    required String content,
  }) async {
    final newNote = Note(
      id: UniqueKey().toString(),
      title: title,
      content: content,
    );
    state = [...state, newNote];
    await saveNotes();
  }

  Future<void> editNote({
    required String id,
    required String title,
    required String content,
  }) async {
    final noteIndex = state.indexWhere((note) => note.id == id);
    if (noteIndex != -1) {
      final updatedNote = Note(
        id: id,
        title: title,
        content: content,
      );
      state[noteIndex] = updatedNote;
      await saveNotes();
    }
  }

  Future<void> deleteNote({
    required String id,
  }) async {
    state = state.where((note) => note.id != id).toList();
    await saveNotes();
  }

  Future<void> saveNotes() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final notes = state.map((note) => '${note.title}:${note.content}').toList();
    await sharedPreferences.setStringList('notes', notes);
  }
}
