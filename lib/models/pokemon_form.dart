class PokemonForm {
  final int id;
  final String name;
  final int order;
  final int formOrder;
  final bool isDefault;
  final bool isBattleOnly;
  final bool isMega;
  final String formName;
  final NamedAPIResource pokemon;
  final Sprites sprites;

  PokemonForm({
    required this.id,
    required this.name,
    required this.order,
    required this.formOrder,
    required this.isDefault,
    required this.isBattleOnly,
    required this.isMega,
    required this.formName,
    required this.pokemon,
    required this.sprites,
  });

  factory PokemonForm.fromJson(Map<String, dynamic> json) {
    return PokemonForm(
      id: json['id'],
      name: json['name'],
      order: json['order'],
      formOrder: json['form_order'],
      isDefault: json['is_default'],
      isBattleOnly: json['is_battle_only'],
      isMega: json['is_mega'],
      formName: json['form_name'],
      pokemon: NamedAPIResource.fromJson(json['pokemon']),
      sprites: Sprites.fromJson(json['sprites']),
    );
  }
}

class NamedAPIResource {
  final String name;
  final String url;

  NamedAPIResource({
    required this.name,
    required this.url,
  });

  factory NamedAPIResource.fromJson(Map<String, dynamic> json) {
    return NamedAPIResource(
      name: json['name'],
      url: json['url'],
    );
  }
}

class Sprites {
  final String? frontDefault;
  final String? frontShiny;

  Sprites({
    this.frontDefault,
    this.frontShiny,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) {
    return Sprites(
      frontDefault: json['front_default'],
      frontShiny: json['front_shiny'],
    );
  }
}
