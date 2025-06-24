class Sprites {
  final String? frontDefault;
  final String? frontShiny;
  final String? frontFemale;
  final String? frontShinyFemale;
  final String? backDefault;
  final String? backShiny;
  final String? backFemale;
  final String? backShinyFemale;

  Sprites({
    this.frontDefault,
    this.frontShiny,
    this.frontFemale,
    this.frontShinyFemale,
    this.backDefault,
    this.backShiny,
    this.backFemale,
    this.backShinyFemale,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        frontDefault: json['front_default'],
        frontShiny: json['front_shiny'],
        frontFemale: json['front_female'],
        frontShinyFemale: json['front_shiny_female'],
        backDefault: json['back_default'],
        backShiny: json['back_shiny'],
        backFemale: json['back_female'],
        backShinyFemale: json['back_shiny_female'],
      );
}
