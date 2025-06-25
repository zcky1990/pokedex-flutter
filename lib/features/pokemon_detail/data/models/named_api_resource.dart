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

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'url': url,
    };
  }
}
