import 'package:flutter/material.dart';
import 'package:flutter_teste_desempenho/database/shared_pref.dart';

class ProcessingPage extends StatefulWidget {
  const ProcessingPage({Key? key}) : super(key: key);
  @override
  State<ProcessingPage> createState() => _ProcessingPageState();
}

class _ProcessingPageState extends State<ProcessingPage> {
  DateTime? initialTime;
  DateTime? finalTime;
  int? processingTime;

  @override
  void initState() {
    super.initState();
    sharedPrefTest();
  }

  Future<void> sharedPrefTest() async {
    initialTime = DateTime.now();
    final _sharedPref = await SharedPref.instance.database;
    int numberIterations = 10;
    await _sharedPref.setInt('number', 0);
    var i = 0;
    while(i<numberIterations){
      i = _sharedPref.getInt('number')!
      await _sharedPref.setInt('number', i + 1);
    }
    finalTime = DateTime.now();
    setState(() {
      processingTime = finalTime!.difference(initialTime!).inMilliseconds;
    });
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
              style: const TextStyle(fontSize: 16, color: Colors.white),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
