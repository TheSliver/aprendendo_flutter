//Meus Cartões

import 'package:flutter/material.dart';

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
                width: num.parse(widget.tela.width.toStringAsPrecision(3)) *
                    0.95, //380,
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
                    width: num.parse(widget.tela.width.toStringAsPrecision(3)) *
                        0.95,
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: num.parse(
                                  widget.tela.width.toStringAsPrecision(3)) *
                              0.20,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.all(
                              Radius.circular(5),
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
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
                              width: num.parse(widget.tela.width
                                      .toStringAsPrecision(3)) *
                                  0.50, //200,
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
                            child: SizedBox(
                              height: 75,
                              width: num.parse(widget.tela.width
                                      .toStringAsPrecision(3)) *
                                  0.10,
                              child: const Column(
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
                    width: num.parse(widget.tela.width.toStringAsPrecision(3)) *
                        0.95,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: num.parse(
                                    widget.tela.width.toStringAsPrecision(3)) *
                                0.50,
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
