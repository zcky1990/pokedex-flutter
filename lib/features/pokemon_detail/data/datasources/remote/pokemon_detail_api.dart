import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonDetailApi {
  static const String _endpoint = 'https://pokeapi.co/api/v2/pokemon/';

  Future<Map<String, dynamic>> fetchPokemon(String name) async {
    final response = await http.get(Uri.parse(_endpoint + name));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load Pokémon');
    }
  }
}
