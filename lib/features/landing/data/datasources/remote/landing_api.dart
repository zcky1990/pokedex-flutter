import 'dart:convert';
import 'package:http/http.dart' as http;

class LandingApi {
  static const String _endpoint =
      'https://pokeapi.co/api/v2/pokemon?limit=100000&offset=0';

  Future<List<Map<String, dynamic>>> fetchPokemonList() async {
    try {
      final response = await http.get(Uri.parse(_endpoint));
      print(response.toString());
      if (response.statusCode == 200) {
        print("success fetch poke list");
        final data = json.decode(response.body);
        print("data : $data");
        final List results = data['results'];
        return results.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Failed to load Pokémon list');
      }
    } catch (e) {
      print("Exception: $e");
      throw Exception('Failed to load Pokémon list');
    }
  }
}
