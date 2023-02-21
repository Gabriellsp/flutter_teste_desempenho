import 'package:flutter/material.dart';
import 'package:flutter_teste_desempenho/models/marvel_character.dart';
import 'package:flutter_teste_desempenho/pages/data_rendering/widgets/card_marvel_character.dart';
import 'package:flutter_teste_desempenho/repository/marvel_repository.dart';

class DataRenderingPage extends StatefulWidget {
  const DataRenderingPage({Key? key}) : super(key: key);

  @override
  State<DataRenderingPage> createState() => _DataRenderingPageState();
}

class _DataRenderingPageState extends State<DataRenderingPage> {
  final _repository = MarvelRepository();
  var _marvelCharacters = <MarvelCharacter>[];
  var _loading = true;

  @override
  void initState() {
    super.initState();
    _marvelCharacters = <MarvelCharacter>[];
    _getMarvelCharacters();
  }

  void _getMarvelCharacters() async {
    var resultList = <MarvelCharacter>[];

    for (int i = 0; i < 1000; i = i + 100) {
      var listByOffset = await _repository.getMarvelCharacters(i);
      resultList.addAll(listByOffset);
    }

    setState(() {
      _marvelCharacters = resultList;
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('1000 Marvel Characters'),
      ),
      body: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _marvelCharacters.length,
              itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CardMarvelCharacter(
                    marvelCharacter: _marvelCharacters[index],
                  )),
            ),
    );
  }
}
