import "named_api_resource.dart";

class Stat {
  final int baseStat;
  final int effort;
  final NamedAPIResource stat;

  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json['base_stat'],
        effort: json['effort'],
        stat: NamedAPIResource.fromJson(json['stat']),
      );
}
