import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_teste_desempenho/models/marvel_character.dart';
import 'package:http/http.dart' as http;

class MarvelRepository {
  Future<List<MarvelCharacter>> getMarvelCharacters(int offset) async {
    var listCharacter = <MarvelCharacter>[];
    var url = Uri.https(
      'gateway.marvel.com',
      '/v1/public/characters',
      {
        'ts': '1',
        'orderBy': 'name',
        'limit': '100',
        'offset': offset.toString(),
        'apikey': '422190db783a962029ff4735e165cb88',
        'hash': '3b5c77dd93627ad07e11a02afa9c7239'
      },
    );
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body) as Map<String, dynamic>;
      var data = jsonResponse['data'];
      data['results'].forEach((element) {
        listCharacter.add(MarvelCharacter.fromJson(element));
      });
    } else {
      if (kDebugMode) {
        print('Request failed with status: ${response.statusCode}.');
      }
    }
    return listCharacter;
  }
}
