import 'package:new_pokedex/features/pokemon_detail/domain/entities/pokemon_entity.dart';
import 'package:new_pokedex/features/landing/domain/entities/landing_pokemon_entity.dart';

abstract class PokemonDetailRepository {
  Future<List<LandingPokemonEntity>> getPokemonList();
  Future<PokemonEntity?> getPokemonDetail(String url);
}
