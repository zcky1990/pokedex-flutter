class PokemonEntity {
  final int id;
  final String name;
  final int baseExperience;
  final int height;
  final bool isDefault;
  final int order;
  final int weight;
  final List abilities;
  final List forms;
  final List gameIndices;
  final List heldItems;
  final String locationAreaEncounters;
  final List moves;
  final species;
  final sprites;
  final List stats;
  final List types;

  PokemonEntity({
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
}
