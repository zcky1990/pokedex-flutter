import "named_api_resource.dart";

class Ability {
  final NamedAPIResource ability;
  final bool isHidden;
  final int slot;

  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: NamedAPIResource.fromJson(json['ability']),
        isHidden: json['is_hidden'],
        slot: json['slot'],
      );
}
