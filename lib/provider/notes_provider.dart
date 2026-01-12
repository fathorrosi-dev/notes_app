import 'package:flutter/material.dart';
import 'package:notes_app/data/local_data_source.dart';
import 'package:notes_app/model/note_model.dart';

class NotesProvider with ChangeNotifier {
  List<NoteModel> _notes = [];
  LocalDataSource localDataSource = LocalDataSource.instance;

  List<NoteModel> get notes => _notes;

  Future<void> loadNotes() async {
    _notes = await localDataSource.readAllNotes();
    notifyListeners();
  }

  Future<void> addNote(NoteModel note) async {
    await localDataSource.create(note);
    await loadNotes();
  }

  Future<void> updateNote(NoteModel note) async {
    await localDataSource.update(note);
    await loadNotes();
  }

  Future<void> deleteNoteById(int id) async {
    await localDataSource.delete(id);
    await loadNotes();
  }
}
