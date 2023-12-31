//import 'package:aprendendo_flutter/screens/form_screen.dart';
 import 'package:aprendendo_flutter/data/task_inherited.dart';
import 'package:aprendendo_flutter/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CorpoTela());
  }
}

class CorpoTela extends StatefulWidget {
  const CorpoTela({super.key});

  @override
  State<CorpoTela> createState() => _CorpoTelaState();
}

class _CorpoTelaState extends State<CorpoTela> {

  
  @override
  Widget build(BuildContext context) {
    return TaskInherited(child: const Task());
    // return const Task();
  }
}


