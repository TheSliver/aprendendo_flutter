import 'package:aprendendo_flutter/Component/picture_frame.dart';
import 'package:aprendendo_flutter/data/task_inherited.dart';
import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  final Size tela;

  const FormScreen(this.tela, {super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController taskController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 222, 249, 191),
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Cadastrar Tarefa'),
        ),
        body: SingleChildScrollView(
          child: Center(
            heightFactor: 1.05,
            child: Container(
              width: num.parse(
                    widget.tela.width.toStringAsPrecision(3),
                  ) *
                  0.95,
              height: 700,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                  boxShadow: const [
                    BoxShadow(color: Colors.black54, blurRadius: 3),
                  ]),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Insira o Nome da Tarefa';
                      }
                      return null;
                    },
                    controller: taskController,
                    cursorColor: const Color.fromARGB(255, 255, 255, 255),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 0, 0),
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 0, 0),
                          width: 2,
                        ),
                      ),
                      labelText: 'Tarefa',
                      floatingLabelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 222, 249, 191),
                        fontSize: 15,
                      ),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 222, 249, 191),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                SliderPick('Dificuldade', 5, 5, difficultyController),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Adicione uma Imagem';
                      }
                      return null;
                    },
                    onChanged: (imageController) {
                      setState(() {});
                    },
                    controller: imageController,
                    cursorColor: const Color.fromARGB(255, 255, 255, 255),
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                          fontSize: 15, color: Color.fromARGB(255, 255, 0, 0)),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 0, 0),
                          width: 2,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 255, 0, 0),
                          width: 2,
                        ),
                      ),
                      labelText: 'Tarefa',
                      floatingLabelStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      labelStyle: TextStyle(
                        color: Color.fromARGB(255, 222, 249, 191),
                        fontSize: 15,
                      ),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 222, 249, 191),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: PictureFrame(imageController.text, widget.tela),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      TaskInherited.of(widget.taskContext).newTask(
                        taskController.text,
                        imageController.text,
                        int.parse(difficultyController.text),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(backgroundColor: Colors.black87,
                          content: Text('Tarefa Inserida com Sucesso!',
                              style: TextStyle(color: Colors.lightGreenAccent),
                          ),
                        ),
                      );
                      Navigator.pop(context);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith(
                      (states) => const Color.fromARGB(255, 222, 249, 191),
                    ),
                  ),
                  child: SizedBox(
                    height: 50,
                    width: num.parse(widget.tela.width.toStringAsPrecision(3)) *
                        0.20,
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Salvar',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                              color: Colors.green),
                        )
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class SliderPick extends StatefulWidget {
  final String sliderName;
  final double slidePickMax;
  final int slidePickDivisions;
  final TextEditingController
      difficultyController; // = TextEditingController();

  const SliderPick(this.sliderName, this.slidePickMax, this.slidePickDivisions,
      this.difficultyController,
      {super.key});

  @override
  State<SliderPick> createState() => _SliderPickState();
}

class _SliderPickState extends State<SliderPick> {
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color.fromARGB(255, 222, 249, 191),
          ),
          borderRadius: BorderRadius.circular(4.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10),
            child: Text(
              widget.sliderName,
              style: const TextStyle(
                  color: Color.fromARGB(255, 222, 249, 191), fontSize: 15),
            ),
          ),
          Slider(
            value: _currentSliderValue,
            min: 1,
            max: widget.slidePickMax,
            divisions: widget.slidePickDivisions,
            activeColor: const Color.fromARGB(255, 222, 249, 191),
            inactiveColor: const Color.fromARGB(103, 222, 249, 191),
            label: '${_currentSliderValue.round()} ★ ',
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
                widget.difficultyController.text = value.round().toString();
              });
            },
          ),
        ],
      ),
    );
  }
}
