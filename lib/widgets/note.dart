import 'package:display_my_notes/models/note.dart';
import 'package:display_my_notes/providers/notes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteWidget extends StatelessWidget {
  final Note note;

  NoteWidget({this.note});

  void _onSelected(BuildContext context, int result) {
    switch(result) {
      case 1:
        Provider.of<NotesProvider>(context, listen: false).deleteNote(note.id);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        child: ListTile(
            title: Text(note.contenido),
            trailing: PopupMenuButton<int>(
              elevation: 5,
              onSelected: (int result) {
                _onSelected(context, result);
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      SizedBox(width: 10.0,),
                      Text("Borrar")
                    ],
                  ),
                ),
              ],
            )),
        decoration: BoxDecoration(
          color: Colors.grey[300],
        ),
      ),
    );
  }
}
