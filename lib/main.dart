import 'package:flutter/cupertino.dart';
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

class CorpoTela extends StatelessWidget {
  const CorpoTela({super.key});

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
        ));
  }
}

//Meus Cartões
class Cards extends StatefulWidget {
  final String texto;
  final String foto;
  final int dificuldade;
  final Size tela;

  const Cards(this.texto, this.foto, this.dificuldade, this.tela, {super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  int lvltarefa = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.green,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 5,
                        offset: Offset(2, 3),
                      ),
                    ]),
                width: (widget.tela.width * 95) / 100, //380,
                height: 135,
              ),
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black54,
                          blurRadius: 5,
                          offset: Offset(2, 3), // Shadow position
                        ),
                      ],
                    ),
                    width: (widget.tela.width * 95) / 100,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: (widget.tela.width * 20) / 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.network(
                              widget.foto,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                widget.texto,
                                style: const TextStyle(fontSize: 20),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 1)
                                      ? Colors.green
                                      : Colors.green.shade100,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 2)
                                      ? Colors.green
                                      : Colors.green.shade100,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 3)
                                      ? Colors.green
                                      : Colors.green.shade100,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 4)
                                      ? Colors.green
                                      : Colors.green.shade100,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 15,
                                  color: (widget.dificuldade >= 5)
                                      ? Colors.green
                                      : Colors.green.shade100,
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                lvltarefa++;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 222, 249, 191),
                              shadowColor: Colors.black,
                              elevation: 5,
                            ),
                            child: const SizedBox(
                              height: 75,
                              width: 35,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.arrow_drop_up,
                                      color: Colors.black87),
                                  Text(
                                    'Lvl Up',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black87),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 380,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 200,
                            child: LinearProgressIndicator(
                              value: (widget.dificuldade > 0)
                                  ? (lvltarefa / widget.dificuldade) / 10
                                  : 1,
                              backgroundColor: Colors.white,
                              color: Colors.yellow.shade800,
                            ),
                          ),
                          Text(
                            'Level $lvltarefa',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
