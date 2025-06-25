import 'ability.dart';
import 'game_index.dart';
import 'held_item.dart';
import 'move.dart';
import "named_api_resource.dart";
import 'sprites.dart';
import 'stat.dart';
import 'type.dart';
import 'package:new_pokedex/features/pokemon_detail/domain/entities/pokemon_entity.dart';

class Pokemon {
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final bool isDefault;
  final int order;
  final int weight;
  final List<Ability> abilities;
  final List<NamedAPIResource> forms;
  final List<GameIndex> gameIndices;
  final List<HeldItem> heldItems;
  final String locationAreaEncounters;
  final List<Move> moves;
  final NamedAPIResource species;
  final Sprites sprites;
  final List<Stat> stats;
  final List<Type> types;

  Pokemon({
    required this.id,
    required this.name,
    required this.baseExperience,
    required this.height,
    required this.isDefault,
    required this.order,
    required this.weight,
    required this.abilities,
    required this.forms,
    required this.gameIndices,
    required this.heldItems,
    required this.locationAreaEncounters,
    required this.moves,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json['id'],
        name: json['name'],
        baseExperience: json['base_experience'],
        height: json['height'],
        isDefault: json['is_default'],
        order: json['order'],
        weight: json['weight'],
        abilities: (json['abilities'] as List)
            .map((a) => Ability.fromJson(a))
            .toList(),
        forms: (json['forms'] as List)
            .map((f) => NamedAPIResource.fromJson(f))
            .toList(),
        gameIndices: (json['game_indices'] as List)
            .map((g) => GameIndex.fromJson(g))
            .toList(),
        heldItems: (json['held_items'] as List)
            .map((h) => HeldItem.fromJson(h))
            .toList(),
        locationAreaEncounters: json['location_area_encounters'],
        moves: (json['moves'] as List).map((m) => Move.fromJson(m)).toList(),
        species: NamedAPIResource.fromJson(json['species']),
        sprites: Sprites.fromJson(json['sprites']),
        stats: (json['stats'] as List).map((s) => Stat.fromJson(s)).toList(),
        types: (json['types'] as List).map((t) => Type.fromJson(t)).toList(),
      );

  PokemonEntity toEntity() {
    return PokemonEntity(
      id: id,
      name: name,
      baseExperience: baseExperience,
      height: height,
      isDefault: isDefault,
      order: order,
      weight: weight,
      abilities: abilities,
      forms: forms,
      gameIndices: gameIndices,
      heldItems: heldItems,
      locationAreaEncounters: locationAreaEncounters,
      moves: moves,
      species: species,
      sprites: sprites,
      stats: stats,
      types: types,
    );
  }
}
