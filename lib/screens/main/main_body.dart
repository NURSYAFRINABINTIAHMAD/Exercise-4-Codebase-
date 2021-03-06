//TODO Complete the implementation of this class

import 'dart:math';
import 'package:flutter/material.dart';

import 'note_editor_tile.dart';
import 'note_tile.dart';
import 'package:exercise4/screens/main/main_viewmodel.dart';
import '../view.dart';
/// `MainBody` the body of the main screen.
/// It should display the list of notes.
/// If the note is under editing, show the note with `NoteEditor` tile widget.
/// Otherwise, show the note with `NoteTile` widget
///
class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SelectorView<MainViewmodel, int>(
        selector: (_, vm) => vm.dataCount,
        builder: (_, vm, __, ___){
          print('Build ListView');
          return ListView.separated(
            itemCount: vm.dataCount,
            separatorBuilder: (context, index) => Divider (
              color: Colors.blueGrey),

              itemBuilder: (context, index) => (vm. editIndex == index) ? NoteEditorTile(index) : NoteTile(index),
            );
          
        },
      ),
    );
  }
}

