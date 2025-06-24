import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon/pokemon.dart';
import 'package:pokedex/models/pokemon/named_api_resource.dart';
import 'package:pokedex/components/sprite_loader/sprite_loader.dart';

class PokedexPageView extends StatelessWidget {
  final String title;
  final bool isLoading;
  final Function getData;
  final Pokemon? data;
  final List<NamedAPIResource>? pokemonList;
  final String? selectedPokemon;

  const PokedexPageView(
      {super.key,
      required this.title,
      required this.getData,
      this.isLoading = false,
      this.data,
      this.pokemonList,
      this.selectedPokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.error,
        title: Text(title),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              value: selectedPokemon,
              hint: const Text('Select a pokemon'),
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(8),
              items: pokemonList?.map((pokemon) {
                return DropdownMenuItem<String>(
                  value: pokemon.url,
                  child: Text(pokemon.name),
                );
              }).toList(),
              onChanged: (value) {
                getData(value);
              },
            ),
            SizedBox(height: 12),
            SpriteLoader(
                frontImage: data?.sprites.frontDefault ?? '',
                backImage: data?.sprites.backDefault ?? ''),
            Text(data?.name ?? ""),
          ],
        ),
      ),
    );
  }
}
