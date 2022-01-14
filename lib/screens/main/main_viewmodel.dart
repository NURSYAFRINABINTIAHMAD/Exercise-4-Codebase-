// Turn of null-safety by writing the following line
// @dart=2.9

//TODO Complete the implementation of the viewmodel for the main screen

import 'dart:html';

import '../viewmodel.dart';
import 'package:exercise4/app/service_locator.dart';
import 'package:exercise4/services/note/note_service.dart';
import '../../models/note.dart';

/// `MainViewmodel` the class for the viewmodel of the main screen.
/// Things that you will implement in this class:
///
///  - Declare all related attributes mainly the states
///  - Method method to handle fetching notes from the data service.
///  - Method to handle adding a new note.
///  - Method to handle deleting a note.
///  - Method to handle updating a note.
class MainViewmodel extends Viewmodel {
  final _service = locator<NoteService>();
  List<Note> _list;

  Note getNote(int index) => _list == null ? null : _list[index];
  int get dataCount => _list == null ? 0 : _list.length;

  int _index;
  int get editIndex => _index;
  set editIndex(value) => _index = value;

init() => update(() async {
  _list = await _service.fetchNotes();
  super.init();
}
);
  void editNote(int index) => update(() async {
    _index = index;

  });

  void addNote(Note note) => update(() async {
        _index = null;
        final item = await _service.addNote(note);
        _list.add(item);
  });

  void removeNote(dynamic id) => update(() async {
    _index = null;
    await _service.removeNote(id);
    _list.removeAt(id);
  });

  void updateNote({dynamic id, Note data}) => update(() async {
    final index = _list.indexWhere((note) => note.id == id);
    if (index == -1) return null;
    _list[index] = data.copyWith(id: id);
  });
}




    

    

