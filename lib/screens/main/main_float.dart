//TODO Complete the implementation of this class

//import 'dart:js';
import 'dart:math';
import 'package:provider/provider.dart';
import '../../models/note.dart';
import '../view.dart';
import 'main_viewmodel.dart';
import 'package:flutter/material.dart';

/// `MainFloat` is show the Floating Action Button (i.e, the Add or the + button)
///
class MainFloat extends StatelessWidget {
  const MainFloat({
    Key key,
  }) : super(key:key);
  
  @override
  Widget build(BuildContext context) {
    return View<MainViewmodel>(
      shouldRebuild: false,
      builder: (_, vm, __) {
        print('Build MainFloat + button');
      return FloatingActionButton(
         child: Icon(Icons.add),
         tooltip: 'Add a new note',  
         onPressed: () => vm.addNote(Note(title: 'Untitled Note', content: 'Content'))     
         );
      },
      );
  }
}

