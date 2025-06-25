import 'package:flutter/material.dart';
import 'package:new_pokedex/features/landing/domain/entities/landing_pokemon_entity.dart';
import 'package:new_pokedex/features/pokemon_detail/domain/entities/pokemon_entity.dart';
import 'package:new_pokedex/features/pokemon_detail/domain/usecases/get_pokemon_detail.dart';

class PokemonDetailViewModel extends ChangeNotifier {
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

  List<LandingPokemonEntity>? _pokemonList;
  bool _isLoading = false;
  String? _error;
  Color? _background = Colors.redAccent;
  PokemonEntity? _selectedPokemon;

  bool get isLoading => _isLoading;
  PokemonEntity? get selectedPokemon => _selectedPokemon;
  List<LandingPokemonEntity>? get pokemonList => _pokemonList;
  Color? get background => _background;
  String? get error => _error;

  GetPokemonDetail? getPokemonDetail;

  PokemonDetailViewModel({required this.getPokemonDetail});

  MaterialColor getColorBaseOnType(String type) {
    return _pokemonTypeColors[type.toLowerCase()] ?? Colors.blueGrey;
  }

  void setBackgroundColor() {
    if (_selectedPokemon == null || _selectedPokemon!.types.isEmpty) {
      _background = Colors.redAccent;
    }
    final type = _selectedPokemon!.types.first.type.name;
    print("TYPE $type");
    _background = getColorBaseOnType(type);
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String error) {
    _error = error;
    _isLoading = false;
    notifyListeners();
  }

  void _clearError() {
    _error = null;
  }

  Future<void> getPokemonDetails(String name) async {
    _setLoading(true);
    _clearError();
    try {
      _selectedPokemon = await getPokemonDetail!.fetchPokemonDetail(name);
    } catch (e) {
      _error = e.toString();
    }

    try {
      setBackgroundColor();
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> getPokemonList() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _pokemonList = await getPokemonDetail!.fetchPokemonList();
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }
}
