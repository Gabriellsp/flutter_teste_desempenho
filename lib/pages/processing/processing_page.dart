import 'dart:math';
import 'package:flutter/material.dart';

class ProcessingPage extends StatefulWidget {
  const ProcessingPage({Key? key}) : super(key: key);
  @override
  State<ProcessingPage> createState() => _ProcessingPageState();
}

class _ProcessingPageState extends State<ProcessingPage> {
  late DateTime initialTime;
  late DateTime finalTime;
  late int processingTime;

  @override
  void initState() {
    super.initState();
    calculationMathFunctions();
  }

  void calculationMathFunctions() {
    initialTime = DateTime.now();
    int numberIterations = 100000000;
    for (int i = 0; i < numberIterations; i++) {
      var cosseno = cos(i);
      var seno = sin(cosseno);
      var tangente = tan(seno);
    }
    finalTime = DateTime.now();
    processingTime = finalTime.difference(initialTime).inMilliseconds;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teste de Processamento'),
      ),
      body: Align(
        child: SizedBox(
          width: 200,
          child: Text('Tempo de processamento: $processingTime milissegundos!',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
