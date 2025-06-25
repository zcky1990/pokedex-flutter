import 'package:new_pokedex/features/landing/domain/entities/landing_pokemon_entity.dart';
import 'package:new_pokedex/features/landing/domain/repositories/landing_repository.dart';
import 'package:new_pokedex/features/landing/data/datasources/remote/landing_api.dart';
import 'package:new_pokedex/features/landing/data/datasources/local/landing_cache.dart';
import 'package:new_pokedex/features/landing/data/models/landing_pokemon_model.dart';

class LandingRepositoryImpl implements LandingRepository {
  final LandingApi api;
  final LandingCache cache;

  LandingRepositoryImpl({required this.api, required this.cache});

  @override
  Future<List<LandingPokemonEntity>> getPokemonList() async {
    // Try to get from cache first
    final cached = await cache.getPokemonList();
    print("mSUK SINi");
    if (cached != null && cached.isNotEmpty) {
      print("masuk if");
      return cached
          .map((e) => LandingPokemonModel.fromJson(e))
          .map((m) => LandingPokemonEntity(name: m.name, url: m.url))
          .toList();
    }

    // If not in cache, fetch from API
    final apiList = await api.fetchPokemonList();
    await cache.savePokemonList(apiList);
    return apiList
        .map((e) => LandingPokemonModel.fromJson(e))
        .map((m) => LandingPokemonEntity(name: m.name, url: m.url))
        .toList();
  }
}
