import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon/pokemon.dart';
import 'package:pokedex/models/pokemon/type.dart';

class PokemonCard extends StatefulWidget {
  final Pokemon? pokemon;

  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  MaterialColor _getAboutColor() {
    String type = widget.pokemon?.types.first.type.name ?? 'neutral';
    return _getColorBaseOnType(type);
  }

  MaterialColor _getColorBaseOnType(String type) {
    MaterialColor typeColor;
    switch (type.toLowerCase()) {
      // Convert to lowercase for consistent matching
      case 'normal':
        typeColor = Colors.grey;
        break;
      case 'fire':
        typeColor = Colors.red;
        break;
      case 'water':
        typeColor = Colors.blue;
        break;
      case 'grass':
        typeColor = Colors.green;
        break;
      case 'electric':
        typeColor = Colors.amber;
        break;
      case 'ice':
        typeColor = Colors.cyan;
        break;
      case 'fighting':
        typeColor = Colors.deepOrange;
        break;
      case 'poison':
        typeColor = Colors.deepPurple;
        break;
      case 'ground':
        typeColor = Colors.brown;
        break;
      case 'flying':
        typeColor = Colors.lightBlue;
        break;
      case 'psychic':
        typeColor = Colors.indigo;
        break;
      case 'bug':
        typeColor = Colors.lightGreen;
        break;
      case 'rock':
        typeColor = Colors.brown;
        break;
      case 'ghost':
        typeColor = Colors.purple;
        break;
      case 'dragon':
        typeColor = Colors.indigo;
        break;
      case 'steel':
        typeColor = Colors.blueGrey;
        break;
      case 'dark':
        typeColor = Colors.grey;
        break;
      case 'fairy':
        typeColor = Colors.pink;
        break;
      default:
        typeColor = Colors.blueGrey;
        break;
    }
    return typeColor;
  }

  @override
  Widget build(BuildContext context) {
    final String pokemonName = widget.pokemon?.name ?? 'No Pokemon Selected';
    final List<Type> pokemonTypes = widget.pokemon?.types ?? [];
    final int pokemonWeight = widget.pokemon?.weight ?? 0;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(80),
          topRight: Radius.circular(80),
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      width: double.infinity,
      margin: EdgeInsets.fromLTRB(3, 130, 3, 0),
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...pokemonTypes.map((type) {
                return Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                        width: 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color:
                              _getColorBaseOnType(type.type.name.toLowerCase()),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 7),
                        child: Text(
                          type.type.name,
                          style: TextStyle(color: Colors.white),
                        )));
              })
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "About",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: _getAboutColor()),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
