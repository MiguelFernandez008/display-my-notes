class Note {
  final int id;
  final String contenido;
  final String fecha;

  Note({this.id, this.contenido, this.fecha});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'contenido': contenido,
      'fecha': fecha,
    };
  }

  @override
  String toString() {
    return 'Note{id: $id, contenido: $contenido, fecha: $fecha}';
  }
}