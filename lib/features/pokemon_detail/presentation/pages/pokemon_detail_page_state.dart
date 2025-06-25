import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:new_pokedex/features/pokemon_detail/presentation/providers/pokemon_detail_provider.dart';
import 'package:new_pokedex/features/pokemon_detail/presentation/pages/pokemon_detail_page_view.dart';

class PokemonDetailPageState extends StatefulWidget {
  const PokemonDetailPageState({super.key});

  @override
  State<PokemonDetailPageState> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPageState>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PokemonDetailProvider>().getPokemonList().whenComplete(() {
        print("success get data list");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonDetailProvider>(builder: (context, provider, child) {
      return PokemonDetailPageView(
        title: "PokdeDex",
        isLoading: provider.isLoading,
        getData: provider.getPokemonDetails,
        pokemonList: provider.pokemonList,
        selectedPokemon: provider.selectedPokemon,
        backgroundColor: provider.background,
      );
    });
  }
}
