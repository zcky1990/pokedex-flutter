import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:new_pokedex/features/pokemon_detail/data/datasources/local/pokemon_detail_cache.dart';
import 'package:new_pokedex/features/pokemon_detail/data/datasources/remote/pokemon_detail_api.dart';
import 'package:new_pokedex/features/pokemon_detail/domain/usecases/get_pokemon_detail.dart';
import 'package:new_pokedex/features/pokemon_detail/presentation/view_models/pokemon_detail_view_model.dart';
import 'package:new_pokedex/features/pokemon_detail/data/repositories/pokemon_detail_repository_impl.dart';

List<SingleChildWidget> pokemonDetailProviders = [
  Provider(create: (_) => PokemonDetailApi()),
  Provider(create: (_) => PokemonDetailCache()),
  Provider(
      create: (context) => PokemonDetailRepositoryImpl(
          api: context.read<PokemonDetailApi>(),
          cache: context.read<PokemonDetailCache>())),
  Provider(
      create: (context) => GetPokemonDetail(
          repository: context.read<PokemonDetailRepositoryImpl>())),
  ChangeNotifierProvider(
    create: (context) => PokemonDetailViewModel(
      getPokemonDetail: context.read<GetPokemonDetail>(),
    ),
  ),
];
