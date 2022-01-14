//TODO Complete the implementation of this class
import 'dart:js';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:exercise4/models/note.dart';
import '../main/note_editor_tile.dart';
import '../main/main_viewmodel.dart';
import 'package:exercise4/screens/view.dart';

/// `NoteTile` is a custom ListTile widget.
/// What it should do basically only to refactor the code
/// to make the `MainBody` much cleaner.
/// This widget will be used for normal building of
/// the list tile on the `MainBody' (i.e, without any editing)
///
class NoteTile extends StatelessWidget {
  const NoteTile(this.index);

  final int index;

  @override
  Widget build(BuildContext context) {
    return SelectorView<MainViewmodel, Note>
    (
      selector: (_, vm) => vm.getNote(index),
      builder: (_, vm, note, ___) {
        print('Build ListTile $index');
    return ListTile(
      title: Text('${note.title}'),
      subtitle: Text('${note.content}'),
      onLongPress: () {
        vm.editNote(index);
      },
      onTap: () {
        vm.editNote(null);
      },
    );
      },
    );
  }
}
