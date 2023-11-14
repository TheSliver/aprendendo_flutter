import 'package:aprendendo_flutter/screens/form_screen.dart';
import 'package:flutter/material.dart';
import 'cards.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 249, 191),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Atividades e Tarefas',
        ),
      ),
      body: ListView(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Cards('Aprender Flutter', 'assets/image/flutterMascote.png', 5,
              screenSize),
          Cards('Tocar Guitarra', 'assets/image/guitarra.png', 2, screenSize),
          Cards('Jogar Video Game', 'assets/image/ControlePlay.jpg', 1,
              screenSize),
          Cards('Trabalhar', 'assets/image/trabalhar.png', 3, screenSize),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FormScreen(screenSize),
              ),
            );
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
