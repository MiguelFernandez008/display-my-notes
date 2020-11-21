import 'package:display_my_notes/database/database.dart';
import 'package:display_my_notes/models/note.dart';
import 'package:flutter/material.dart';

class NotesProvider extends ChangeNotifier {
  final DatabaseController dbController = DatabaseController();

  void addNote(Note note) async {
    await dbController.insertNote(note);
    notifyListeners();
  }

  void deleteNote(int index) async {
    await dbController.deleteNote(index);
    notifyListeners();
  }

  Future<List<Note>> getNotes() async {
    return await dbController.getNotes();
  }

  Future<int> getNextId() async {
    return await dbController.getNextIndex();
  }
}