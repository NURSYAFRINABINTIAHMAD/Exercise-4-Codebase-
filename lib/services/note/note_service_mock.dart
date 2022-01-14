// Turn of null-safety by writing the following line
// @dart=2.9

//TODO Complete the implementation of each method of this service class

import 'note_service.dart';
import '../../models/note.dart';

/// `NoteServiceMock` is a database service for notes that are stored in internal memory.
///
class NoteServiceMock extends NoteService {
  //? Sample of mock data is provided
  final _mockDb = <Note>[
    Note(
        id: 1,
        title: 'What is Flutter?',
        content:
            'Flutter is an open-source UI framework for creating native mobile applications. It allows developers to build mobile applications a single codebase.'),
    Note(
        id: 2,
        title: 'Stateful Widgets',
        content:
            'The widgets whose state can be altered once they are built are called stateful Widgets.'),
    Note(
        id:3,
        title: 'Conditional (ternary) operator',
        content:
            'The conditional (ternary) operator in Dart takes three operands: a condition, first expression (if truthy) and second expression (if falsy).'),
  ];

  @override
  Future<List<Note>> fetchNotes() async {
    await Future.delayed(Duration(seconds: 1));
    return [..._mockDb];
  }

  @override
  Future<Note> getNote(id) async {
    final item = _mockDb.firstWhere((note) => note.id == id, orElse: null);
    return Note.copy(item);
  }

  @override
  Future<Note> updateNote({id, Note data}) async {
    await Future.delayed(Duration(seconds: 1));
    final index = _mockDb.indexWhere((note) => note.id == id);
if (index == -1) return null;

Note item = data.copyWith(id: id);
_mockDb[index] = item;
    return Note.copy(_mockDb[index]);
  }

  @override
  Future<void> removeNote(id) async {
    await Future.delayed(Duration(seconds: 2));
    _mockDb.removeWhere((note) => note.id == id);
  }

  @override
  Future<Note> addNote(Note data) async {
    await Future.delayed(Duration(seconds: 1));
    int id = (_mockDb != null && _mockDb.length > 0) ? _mockDb.last.id + 1 : 1;
    Note item = data.copyWith(id: id);
    _mockDb.add(item);
    return Note.copy(item);
  }
}
