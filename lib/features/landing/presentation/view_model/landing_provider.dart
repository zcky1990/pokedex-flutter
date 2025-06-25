import 'package:flutter/material.dart';
import 'package:new_pokedex/features/landing/domain/entities/landing_pokemon_entity.dart';
import 'package:new_pokedex/features/landing/domain/usecases/get_landing_pokemon_list.dart';

class LandingProvider extends ChangeNotifier {
  final GetLandingPokemonList? getLandingPokemonList;

  LandingProvider({required this.getLandingPokemonList});

  List<LandingPokemonEntity>? _pokemonList;
  bool _isLoading = false;
  String? _error;

  List<LandingPokemonEntity>? get pokemonList => _pokemonList;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchPokemonList() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _pokemonList = await getLandingPokemonList!.call();
      print("provider success get data");
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
