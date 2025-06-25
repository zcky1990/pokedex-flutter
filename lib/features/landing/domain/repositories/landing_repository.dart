import 'package:new_pokedex/features/landing/domain/entities/landing_pokemon_entity.dart';

abstract class LandingRepository {
  Future<List<LandingPokemonEntity>> getPokemonList();
}
