import 'package:flutter/material.dart';
import 'package:flutter_teste_desempenho/models/marvel_character.dart';

class CardMarvelCharacter extends StatelessWidget {
  final MarvelCharacter marvelCharacter;
  const CardMarvelCharacter({Key? key, required this.marvelCharacter})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(236, 29, 36, 1),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    '${marvelCharacter.thumbnail!.path!}.${marvelCharacter.thumbnail!.extension!}',
                  ),
                  fit: BoxFit.cover),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text.rich(
                    TextSpan(children: [
                      const TextSpan(
                          text: 'Id: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(
                        text: marvelCharacter.id!.toString(),
                      ),
                    ]),
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text.rich(
                    TextSpan(children: [
                      const TextSpan(
                          text: 'Name: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(
                        text: marvelCharacter.name!.toString(),
                      ),
                    ]),
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Text.rich(
                    TextSpan(children: [
                      const TextSpan(
                          text: 'Description: ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          )),
                      TextSpan(
                        text: marvelCharacter.description!.isEmpty
                            ? '-'
                            : marvelCharacter.description!.toString(),
                      ),
                    ]),
                    textAlign: TextAlign.justify,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
