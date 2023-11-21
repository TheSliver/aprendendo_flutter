import 'package:flutter/material.dart';

class Difficulty extends StatelessWidget {
  final int dificuldade;

  const Difficulty(this.dificuldade, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: (dificuldade >= 1) ? Colors.green : Colors.green.shade100,
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificuldade >= 2) ? Colors.green : Colors.green.shade100,
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificuldade >= 3) ? Colors.green : Colors.green.shade100,
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificuldade >= 4) ? Colors.green : Colors.green.shade100,
        ),
        Icon(
          Icons.star,
          size: 15,
          color: (dificuldade >= 5) ? Colors.green : Colors.green.shade100,
        )
      ],
    );
  }
}
