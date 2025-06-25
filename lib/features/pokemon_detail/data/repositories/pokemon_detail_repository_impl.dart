import 'package:new_pokedex/features/pokemon_detail/domain/entities/pokemon_entity.dart';
import 'package:new_pokedex/features/pokemon_detail/domain/repositories/pokemon_detail_repository.dart';
import 'package:new_pokedex/features/pokemon_detail/data/datasources/local/pokemon_detail_cache.dart';
import 'package:new_pokedex/features/pokemon_detail/data/datasources/remote/pokemon_detail_api.dart';
import 'package:new_pokedex/features/pokemon_detail/data/models/pokemon.dart';

import 'package:new_pokedex/features/landing/domain/entities/landing_pokemon_entity.dart';
import 'package:new_pokedex/features/landing/data/models/landing_pokemon_model.dart';

class PokemonDetailRepositoryImpl implements PokemonDetailRepository {
  final PokemonDetailApi api;
  final PokemonDetailCache cache;

  PokemonDetailRepositoryImpl({required this.api, required this.cache});

  @override
  Future<List<LandingPokemonEntity>> getPokemonList() async {
    // Try to get from cache first
    final cached = await cache.getPokemonList();
    if (cached != null && cached.isNotEmpty) {
      return cached
          .map((e) => LandingPokemonModel.fromJson(e))
          .map((m) => LandingPokemonEntity(name: m.name, url: m.url))
          .toList();
    }
    print("list empty");
    return [];
  }

  @override
  Future<PokemonEntity?> getPokemonDetail(String name) async {
    try {
      print("get pokemon detail from cache");
      final cachedData = await cache.getPokemon(name);
      if (cachedData != null) {
        return Pokemon.fromJson(cachedData).toEntity();
      }

      print("get pokemon detail from api");
      final apiData = await api.fetchPokemon(name);
      if (apiData != null) {
        await cache.savePokemon(name, apiData);
        return Pokemon.fromJson(apiData).toEntity();
      }
      return null;
    } catch (e, stackTrace) {
      print('Error fetching Pokémon detail: $e');
      print(stackTrace);
      return null;
    }
  }
}
