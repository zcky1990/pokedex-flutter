import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LandingCache {
  static const String _pokemonListKey = 'pokemon_list';

  Future<void> savePokemonList(List<Map<String, dynamic>> pokemonList) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(pokemonList);
    await prefs.setString(_pokemonListKey, jsonString);
  }

  Future<List<Map<String, dynamic>>?> getPokemonList() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_pokemonListKey);
    if (jsonString != null) {
      final List decoded = json.decode(jsonString);
      return decoded.cast<Map<String, dynamic>>();
    }
    return [];
  }
}
