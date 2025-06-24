import "named_api_resource.dart";

class GameIndex {
  final int gameIndex;
  final NamedAPIResource version;

  GameIndex({
    required this.gameIndex,
    required this.version,
  });

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json['game_index'],
        version: NamedAPIResource.fromJson(json['version']),
      );
}
