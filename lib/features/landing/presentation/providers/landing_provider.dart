import 'package:flutter/material.dart';
import 'package:new_pokedex/features/landing/domain/entities/landing_pokemon_entity.dart';
import 'package:new_pokedex/features/landing/domain/usecases/get_landing_pokemon_list.dart';
import 'package:new_pokedex/features/landing/data/datasources/remote/landing_api.dart';
import 'package:new_pokedex/features/landing/data/datasources/local/landing_cache.dart';
import 'package:new_pokedex/features/landing/data//repositories/landing_repository_impl.dart';

class LandingProvider extends ChangeNotifier {
  GetLandingPokemonList? _getLandingPokemonList;

  LandingProvider() {
    _getLandingPokemonList = GetLandingPokemonList(
        LandingRepositoryImpl(api: LandingApi(), cache: LandingCache()));
  }

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
      _pokemonList = await _getLandingPokemonList!.call();
      print("provider success get data");
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
