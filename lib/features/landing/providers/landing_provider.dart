import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'package:new_pokedex/features/landing/data/datasources/remote/landing_api.dart';
import 'package:new_pokedex/features/landing/data/datasources/local/landing_cache.dart';
import 'package:new_pokedex/features/landing/data/repositories/landing_repository_impl.dart';
import 'package:new_pokedex/features/landing/domain/usecases/get_landing_pokemon_list.dart';
import 'package:new_pokedex/features/landing/presentation/view_model/landing_provider.dart';

List<SingleChildWidget> landingProviders = [
  Provider(create: (_) => LandingApi()),
  Provider(create: (_) => LandingCache()),
  Provider(
      create: (context) => LandingRepositoryImpl(
          api: context.read<LandingApi>(),
          cache: context.read<LandingCache>())),
  Provider(
      create: (context) =>
          GetLandingPokemonList(context.read<LandingRepositoryImpl>())),
  ChangeNotifierProvider(
      create: (context) => LandingProvider(
          getLandingPokemonList: context.read<GetLandingPokemonList>()))
];
