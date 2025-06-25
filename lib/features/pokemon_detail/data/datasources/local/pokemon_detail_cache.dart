import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PokemonDetailCache {
  static const String _pokemonListKey = 'pokemon_list';
  static const String _pokemon = 'pokemon';

  Future<void> savePokemon(
      String pokemonId, Map<String, dynamic> pokemonDetail) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(pokemonDetail);
    await prefs.setString("${_pokemon}_${pokemonId}", jsonString);
  }

  Future<Map<String, dynamic>?> getPokemon(String pokemonId) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString("${_pokemon}_${pokemonId}");
    if (jsonString != null) {
      final decoded = json.decode(jsonString);
      return decoded;
    }
    return null;
  }

  Future<List<Map<String, dynamic>>?> getPokemonList() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_pokemonListKey);
    if (jsonString != null) {
      final List decoded = json.decode(jsonString);
      return decoded.cast<Map<String, dynamic>>();
    }
    return null;
  }
}
