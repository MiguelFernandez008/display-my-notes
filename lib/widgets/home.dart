import 'package:display_my_notes/widgets/form.dart';
import 'package:display_my_notes/widgets/notes.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatelessWidget {
  final String title;

  HomeWidget({this.title});

  void _showNewNote(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
              title: Text("Crear nueva nota"),
              content: FormWidget(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            this.title,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      body: Center(
        child: Container(
          child: NotesWidget(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showNewNote(context);
        },
        tooltip: 'Nueva nota',
        child: Icon(Icons.add),
      ),
    );
  }
}
