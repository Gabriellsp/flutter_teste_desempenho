import 'package:flutter_teste_desempenho/models/character_thumbnail.dart';

class MarvelCharacter {
  int? id;
  String? name;
  String? description;
  CharacterThumbnail? thumbnail;

  MarvelCharacter({
    this.id,
    this.name,
    this.description,
    this.thumbnail,
  });

  MarvelCharacter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    thumbnail = json['thumbnail'] != null
        ? CharacterThumbnail.fromJson(json['thumbnail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    if (thumbnail != null) {
      data['thumbnail'] = thumbnail?.toJson();
    }
    return data;
  }
}
