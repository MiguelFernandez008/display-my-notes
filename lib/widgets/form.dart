import 'package:display_my_notes/models/note.dart';
import 'package:display_my_notes/providers/notes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _controller,
              validator: (value) {
                if (value.isEmpty) return "Este campo no puede estar vacío";
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              child: Container(
                width: double.infinity,
                child: FlatButton(
                  color: Colors.teal,
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      DateTime now = DateTime.now();
                      int size =
                          await Provider.of<NotesProvider>(context, listen: false)
                              .getNextId();
                      Note note =
                          new Note(id: size, contenido: _controller.text, fecha: now.toString());
                      Provider.of<NotesProvider>(context, listen: false)
                          .addNote(note);
                      Navigator.of(context).pop();
                    }
                  },
                  child: Text(
                    "Crear nota",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
