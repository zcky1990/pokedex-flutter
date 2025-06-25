class LandingPokemonModel {
  final String name;
  final String url;

  LandingPokemonModel({required this.name, required this.url});

  factory LandingPokemonModel.fromJson(Map<String, dynamic> json) {
    return LandingPokemonModel(
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
