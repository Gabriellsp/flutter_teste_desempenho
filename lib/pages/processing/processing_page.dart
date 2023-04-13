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
    final _database = await SharedPref.instance.database;
    int numberIterations = 100000000;
    for (int i = 0; i < numberIterations; i++) {
      await _database.setString('number', i.toString());
      // ignore: unused_local_variable
      var number = _database.getString('number');
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
