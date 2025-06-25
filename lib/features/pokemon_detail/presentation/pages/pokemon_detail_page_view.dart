import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_pokedex/features/pokemon_detail/domain/entities/pokemon_entity.dart';
import 'package:new_pokedex/features/landing/domain/entities/landing_pokemon_entity.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:new_pokedex/features/pokemon_detail/presentation/pages/sprite_loader/sprite_loader.dart';
import 'package:new_pokedex/features/pokemon_detail/presentation/pages/pokemon_card/pokemon_card.dart';

/// View for the Pokedex list page with Pokemon selection and display
class PokemonDetailPageView extends StatelessWidget {
  final String title;
  final bool isLoading;
  final Function getData;
  final List<LandingPokemonEntity>? pokemonList;
  final PokemonEntity? selectedPokemon;
  final Color? backgroundColor;

  const PokemonDetailPageView({
    super.key,
    required this.title,
    required this.getData,
    required this.pokemonList,
    required this.selectedPokemon,
    required this.isLoading,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          color: backgroundColor,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: Opacity(
                    opacity: 0.3,
                    child: SvgPicture.asset(
                      'assets/image/Pokeball.svg',
                      width: 300,
                      height: 300,
                    )),
              ),
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              'assets/image/Pokeball.svg',
                              width: 24,
                              height: 24,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "PokeDex",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: DropdownButton2<String>(
                            isExpanded: true,
                            hint: Center(child: Text("Select a pokemon")),
                            value: selectedPokemon?.name,
                            items:
                                pokemonList?.map((LandingPokemonEntity items) {
                              return DropdownMenuItem(
                                alignment: AlignmentDirectional.center,
                                value: items.name,
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0, vertical: 8.0),
                                    child: Text(items.name),
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              getData(newValue);
                            },
                            style: const TextStyle(color: Colors.blue),
                            underline: SizedBox(),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.zero,
                            bottomRight: Radius.zero,
                          ),
                        ),
                        child: Stack(
                          children: [
                            PokemonCard(
                              pokemon: selectedPokemon,
                            ),
                            SpriteLoader(
                                frontImage:
                                    selectedPokemon?.sprites.frontDefault ?? '',
                                backImage:
                                    selectedPokemon?.sprites.backDefault ?? ''),
                          ],
                        )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
