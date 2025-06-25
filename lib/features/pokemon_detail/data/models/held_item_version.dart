import "named_api_resource.dart";

class HeldItemVersion {
  final NamedAPIResource version;
  final int rarity;

  HeldItemVersion({
    required this.version,
    required this.rarity,
  });

  factory HeldItemVersion.fromJson(Map<String, dynamic> json) =>
      HeldItemVersion(
        version: NamedAPIResource.fromJson(json['version']),
        rarity: json['rarity'],
      );
}
