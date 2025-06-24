import "pokemon/named_api_resource.dart";

class PokemonList {
  final int count;
  final String? next;
  final String? previous;
  final List<NamedAPIResource> results;

  PokemonList({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PokemonList.fromJson(Map<String, dynamic> json) {
    return PokemonList(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: (json['results'] as List)
          .map((item) => NamedAPIResource.fromJson(item))
          .toList(),
    );
  }
}
