import "named_api_resource.dart";

class Type {
  final int slot;
  final NamedAPIResource type;

  Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json['slot'],
        type: NamedAPIResource.fromJson(json['type']),
      );
}
