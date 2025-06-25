import "named_api_resource.dart";

class MoveVersion {
  final NamedAPIResource moveLearnMethod;
  final NamedAPIResource versionGroup;
  final int levelLearnedAt;

  MoveVersion({
    required this.moveLearnMethod,
    required this.versionGroup,
    required this.levelLearnedAt,
  });

  factory MoveVersion.fromJson(Map<String, dynamic> json) => MoveVersion(
        moveLearnMethod: NamedAPIResource.fromJson(json['move_learn_method']),
        versionGroup: NamedAPIResource.fromJson(json['version_group']),
        levelLearnedAt: json['level_learned_at'],
      );
}
