class CharacterThumbnail {
  String? path;
  String? extension;

  CharacterThumbnail({this.path, this.extension});

  CharacterThumbnail.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    extension = json['extension'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    data['extension'] = extension;
    return data;
  }
}
