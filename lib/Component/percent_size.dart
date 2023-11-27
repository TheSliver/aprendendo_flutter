import 'package:flutter/material.dart';

class PercentSize{

  width(double percentSize, BuildContext context) {
    final Size tela = MediaQuery.of(context).size;

    return num.parse(tela.width.toStringAsPrecision(3)) * (percentSize/100);
  }

  height(double percentSize, BuildContext context) {
    final Size tela = MediaQuery.of(context).size;

    return num.parse(tela.height.toStringAsPrecision(3)) * (percentSize/100);
  }
}