import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon/pokemon.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/models/pokemon/named_api_resource.dart';
import 'package:pokedex/components/sprite_loader/sprite_loader.dart';
import 'package:pokedex/components/pokemon_card/pokemon_card.dart';

class PokedexListPageView extends StatelessWidget {
  final String title;
  final bool isLoading;
  final Function getData;
  final Pokemon? data;
  final List<NamedAPIResource> pokemonList;
  final NamedAPIResource? selectedPokemon;

  const PokedexListPageView(
      {super.key,
      required this.title,
      required this.getData,
      this.isLoading = false,
      this.data,
      required this.pokemonList,
      this.selectedPokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          color: Colors.redAccent,
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
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: DropdownSearch<NamedAPIResource>(
                          selectedItem: selectedPokemon,
                          enabled: true,
                          items: (f, isf) => pokemonList,
                          itemAsString: (NamedAPIResource p) =>
                              p.name.toUpperCase(),
                          compareFn: (item1, item2) => item1.url == item2.url,
                          onChanged: (value) {
                            getData(value);
                          },
                          suffixProps: DropdownSuffixProps(
                            dropdownButtonProps: DropdownButtonProps(
                              iconClosed: Icon(Icons.keyboard_arrow_down),
                              iconOpened: Icon(Icons.keyboard_arrow_up),
                            ),
                          ),
                          decoratorProps: DropDownDecoratorProps(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(vertical: 6),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Please select...',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          ),
                          popupProps: PopupProps.menu(
                            itemBuilder:
                                (context, item, isDisabled, isSelected) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Text(
                                  item.name.toUpperCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            },
                            constraints: BoxConstraints(maxHeight: 160),
                            menuProps: MenuProps(
                              margin: EdgeInsets.only(top: 12),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12))),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
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
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Stack(
                          children: [
                            PokemonCard(
                              pokemon: data,
                            ),
                            SpriteLoader(
                                frontImage: data?.sprites.frontDefault ?? '',
                                backImage: data?.sprites.backDefault ?? ''),
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
