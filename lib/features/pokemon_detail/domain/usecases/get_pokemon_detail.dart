import 'package:new_pokedex/features/pokemon_detail/domain/repositories/pokemon_detail_repository.dart';
import 'package:new_pokedex/features/pokemon_detail/domain/entities/pokemon_entity.dart';
import 'package:new_pokedex/features/landing/domain/entities/landing_pokemon_entity.dart';

class GetPokemonDetail {
  final PokemonDetailRepository repository;

  GetPokemonDetail(this.repository);

  Future<PokemonEntity?> fetchPokemonDetail(String url) async {
    return await repository.getPokemonDetail(url);
  }

  Future<List<LandingPokemonEntity>> fetchPokemonList() async {
    return await repository.getPokemonList();
  }
}
