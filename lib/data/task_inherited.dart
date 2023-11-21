import 'package:flutter/material.dart';

import '../Component/cards.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({
    super.key,
    required Widget child,
  }) : super(child: child);

  final List<Cards> cardsList = [
    const Cards('Aprender Flutter', 'assets/image/flutterMascote.png', 5),
    const Cards('Tocar Guitarra', 'assets/image/guitarra.png', 2),
    const Cards('Jogar Video Game', 'assets/image/ControlePlay.jpg', 1),
    const Cards('Trabalhar', 'assets/image/trabalhar.png', 3),
  ];

  void newTask(String name, String photo, int difficulty) {
    cardsList.add(
      Cards(name, photo, difficulty),
    );
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'No TaskInherited found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited old) {
    return old.cardsList.length != cardsList.length;
  }
}
