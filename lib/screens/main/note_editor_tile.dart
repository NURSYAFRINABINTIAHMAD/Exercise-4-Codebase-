//TODO Complete the implementation of this class
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:exercise4/models/note.dart';
import 'package:exercise4/screens/view.dart';
import '../main/main_viewmodel.dart';
import 'widgets/custom_text_field.dart';

/// `NoteEditorTile` is a custom ListTile widget that should be
/// shown when a note is under editing.
///
class NoteEditorTile extends StatelessWidget {
  const NoteEditorTile(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return SelectorView<MainViewmodel, Note>(
      selector: (_, vm) => vm.getNote(index),
      builder: (_, vm, note, __){
        print('Build ListTile $index');
  
    return ListTile(
      title: CustomTextField(
        initialValue: '${note.title}',
        onChanged: (value) {
          vm.getNote(index).title = value;
        },
      ),
      subtitle: CustomTextField(
        maxLines: 3,
        initialValue: '${note.content}',
        onChanged: (value) {
          vm.getNote(index).content = value;
        },
      ),
      trailing: IconButton(
        icon: Icon(
          Icons.delete,
          color: Colors.blue,
        ),
        onPressed: () => vm.removeNote(vm.getNote(index).id),
      ),
    );
  },
    );
  }
}
