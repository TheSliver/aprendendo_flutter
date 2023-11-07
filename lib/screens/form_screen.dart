import 'package:flutter/material.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController taskController = TextEditingController();

  TextEditingController difficultyController = TextEditingController();

  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 249, 191),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Cadastrar Tarefa'),
      ),
      body: Center(
        heightFactor: 1.05,
        child: Container(
          width: 380,
          height: 700,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
              boxShadow: const [
                BoxShadow(color: Colors.black54, blurRadius: 3),
              ]),
          child: Column(children: [
            Campo('Tarefa', taskController),
            const SliderPick('Dificuldade', 5, 5),
            Campo('Imagem', taskController),
            ElevatedButton(
              onPressed: () {
                print(taskController.text);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateColor.resolveWith(
                  (states) => const Color.fromARGB(255, 222, 249, 191),
                ),
              ),
              child: const SizedBox(
                height: 50,
                width: 200,
                child: Column(
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
    );
  }
}

class Campo extends StatelessWidget {
  final String labelName;
  final TextEditingController varController;

  const Campo(this.labelName, this.varController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: varController,
        cursorColor: const Color.fromARGB(255, 255, 255, 255),
        style: const TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          labelText: labelName,
          floatingLabelStyle: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          labelStyle: const TextStyle(
            color: Color.fromARGB(255, 222, 249, 191),
            fontSize: 15,
          ),
          filled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 222, 249, 191),
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2,
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

  const SliderPick(this.sliderName, this.slidePickMax, this.slidePickDivisions, {super.key});

  @override
  State<SliderPick> createState() => _SliderPickState();
}

class _SliderPickState extends State<SliderPick> {
  double _currentSliderValue = 1;

  @override
  Widget build(BuildContext context) {
    return
      Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(
              color: const Color.fromARGB(255, 222, 249, 191),
            ),
            borderRadius: BorderRadius.circular(4.5)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, top: 10),
              child: Text(
                widget.sliderName,
                style: const TextStyle(
                    color: Color.fromARGB(255, 222, 249, 191),
                    fontSize: 15),
              ),
            ),
            Slider(
              value: _currentSliderValue,
              max: widget.slidePickMax,
              divisions: widget.slidePickDivisions,
              activeColor: const Color.fromARGB(255, 222, 249, 191),
              inactiveColor: const Color.fromARGB(103, 222, 249, 191),
              label: '${_currentSliderValue.round()} ★ ',
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ],
        ),
      );
  }
}
