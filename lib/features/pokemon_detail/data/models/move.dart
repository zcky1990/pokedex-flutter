import "named_api_resource.dart";
import 'move_version.dart';

class Move {
  final NamedAPIResource move;
  final List<MoveVersion> versionGroupDetails;

  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: NamedAPIResource.fromJson(json['move']),
        versionGroupDetails: (json['version_group_details'] as List)
            .map((v) => MoveVersion.fromJson(v))
            .toList(),
      );
}
