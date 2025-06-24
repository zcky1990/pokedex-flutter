import "named_api_resource.dart";
import 'held_item_version.dart';

class HeldItem {
  final NamedAPIResource item;
  final List<HeldItemVersion> versionDetails;

  HeldItem({
    required this.item,
    required this.versionDetails,
  });

  factory HeldItem.fromJson(Map<String, dynamic> json) => HeldItem(
        item: NamedAPIResource.fromJson(json['item']),
        versionDetails: (json['version_details'] as List)
            .map((v) => HeldItemVersion.fromJson(v))
            .toList(),
      );
}
