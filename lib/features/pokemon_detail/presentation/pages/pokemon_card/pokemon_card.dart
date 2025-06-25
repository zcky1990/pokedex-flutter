import 'package:flutter/material.dart';
import 'package:new_pokedex/features/pokemon_detail/domain/entities/pokemon_entity.dart';

class PokemonCard extends StatefulWidget {
  final PokemonEntity? pokemon;

  const PokemonCard({
    super.key,
    required this.pokemon,
  });

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  static const Map<String, MaterialColor> _pokemonTypeColors = {
    'normal': Colors.grey,
    'fire': Colors.red,
    'water': Colors.blue,
    'grass': Colors.green,
    'electric': Colors.amber,
    'ice': Colors.cyan,
    'fighting': Colors.deepOrange,
    'poison': Colors.deepPurple,
    'ground': Colors.brown,
    'flying': Colors.lightBlue,
    'psychic': Colors.indigo,
    'bug': Colors.lightGreen,
    'rock': Colors.brown,
    'ghost': Colors.purple,
    'dragon': Colors.indigo,
    'steel': Colors.blueGrey,
    'dark': Colors.grey,
    'fairy': Colors.pink,
  };

  MaterialColor _getAboutColor() {
    String type = widget.pokemon?.types.first.type.name ?? 'neutral';
    return _getColorBaseOnType(type);
  }

  MaterialColor _getColorBaseOnType(String type) {
    return _pokemonTypeColors[type.toLowerCase()] ?? Colors.blueGrey;
  }

  @override
  Widget build(BuildContext context) {
    final String pokemonName = widget.pokemon?.name ?? 'No Pokemon Selected';
    final List<dynamic> pokemonTypes = widget.pokemon?.types ?? [];
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
