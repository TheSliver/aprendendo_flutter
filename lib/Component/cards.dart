//Meus Cartões

import 'package:aprendendo_flutter/Component/percent_size.dart';
import 'package:aprendendo_flutter/Component/picture_frame.dart';
import 'package:flutter/material.dart';
import '../Component/difficulty.dart';

class Cards extends StatefulWidget {
  final String texto;
  final String foto;
  final int dificuldade;

  const Cards(this.texto, this.foto, this.dificuldade, {super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  int lvltarefa = 0;
  final PercentSize percentSize = PercentSize();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                width:percentSize.width(95, context),
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
                    width: percentSize.width(95, context),
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PictureFrame(widget.foto),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width:percentSize.width(50, context),
                              child: Text(
                                widget.texto,
                                style: const TextStyle(fontSize: 20),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Difficulty(widget.dificuldade)
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
                              width:percentSize.width(10, context),
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
                    width: percentSize.width(95, context),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width:
                            percentSize.width(50, context),
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
