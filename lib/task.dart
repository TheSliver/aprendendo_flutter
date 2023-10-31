import 'package:flutter/material.dart';
import 'cards.dart';

class Task extends StatefulWidget {
  const Task({super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool opacidade = true;

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
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: opacidade ? 1 : 0,
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Cards(
                'Aprender Flutter',
                'https://media.licdn.com/dms/image/C4D12AQGN-i1zeCivGA/article-inline_image-shrink_1500_2232/0/1614519283776?e=1701302400&v=beta&t=19NLg_sbBkNB8ZdiotPMf_x1oNvX-d_cotcsWuwjKC4',
                5,
                screenSize),
            Cards(
                'Tocar Guitarra',
                'https://www.timbres.com.br/a/p/9403-guitarra-phx-strato-power-hhs-vermelha-metalica-sthmrd/guitarra-phx-strato-power-hss-vermelha-metalica-sthmrd_1000x1000-50.png',
                2,
                screenSize),
            Cards(
                'Jogar Video Game',
                'https://i.etsystatic.com/25760358/r/il/76ab0c/2711637734/il_570xN.2711637734_l1qp.jpg',
                1,
                screenSize),
            Cards(
                'Trabalhar',
                'https://cdn-icons-png.flaticon.com/512/914/914614.png',
                3,
                screenSize),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            opacidade = !opacidade;
          });
        },
        child: const Icon(Icons.remove_red_eye),
      ),
    );
  }
}
