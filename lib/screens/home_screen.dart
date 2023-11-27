import 'package:aprendendo_flutter/data/task_inherited.dart';
import 'package:aprendendo_flutter/screens/form_screen.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 249, 191),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Atividades e Tarefas',
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 80),

        children: TaskInherited.of(context).cardsList
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => FormScreen(taskContext: context),
              ),
            );
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
