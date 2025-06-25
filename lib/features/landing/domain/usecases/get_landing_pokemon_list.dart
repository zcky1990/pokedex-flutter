import '../entities/landing_pokemon_entity.dart';
import '../repositories/landing_repository.dart';

class GetLandingPokemonList {
  final LandingRepository repository;

  GetLandingPokemonList(this.repository);

  Future<List<LandingPokemonEntity>?> call() async {
    return await repository.getPokemonList();
  }
}
