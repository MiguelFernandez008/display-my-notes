import 'dart:math';

import 'package:display_my_notes/database/database.dart';
import 'package:display_my_notes/models/note.dart';
import 'package:display_my_notes/providers/notes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'note.dart';

class NotesWidget extends StatelessWidget {
  final DatabaseController dbController = DatabaseController();
  @override
  Widget build(BuildContext context) {
    return Consumer<NotesProvider>(
      builder: (context, notes, child) => FutureBuilder<List<Note>>(
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                Note note = snapshot.data[index];
                return NoteWidget(note: note);
              },
            );
          } else {
            return Text("Cargando notas");
          }
        },
        future: dbController.getNotes(),
      ),
    );
  }
}